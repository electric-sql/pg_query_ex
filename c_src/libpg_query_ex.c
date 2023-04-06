#include <erl_nif.h>
#include <stdio.h>
#include <string.h>

#include "libpg_query/pg_query.h"

static ERL_NIF_TERM result_tuple(ErlNifEnv *env, const char *status,
                                 const char *result, size_t len) {
  ERL_NIF_TERM binary;
  ERL_NIF_TERM atom = enif_make_atom(env, status);

  unsigned char *data = enif_make_new_binary(env, len, &binary);
  memcpy(data, result, len);

  return enif_make_tuple2(env, atom, binary);
}


static ERL_NIF_TERM parse_query(ErlNifEnv *env, int argc,
                                const ERL_NIF_TERM argv[]) {
  ErlNifBinary query;
  ERL_NIF_TERM term;

  if (argc == 1 && enif_inspect_binary(env, argv[0], &query)) {
    // add one more byte for the null termination
    char statement[query.size + 1];

    strncpy(statement, (char *)query.data, query.size);

    // terminate the string
    statement[query.size] = 0;

    PgQueryProtobufParseResult result = pg_query_parse_protobuf(statement);

    if (result.error) {
      size_t max_len = strlen(result.error->message) + 30;
      char error[max_len];
      memset(error, 0, sizeof(error));
      snprintf(error, max_len, "error: %s at char %d", result.error->message,
               result.error->cursorpos);

      term = result_tuple(env, "error", error, strlen(error));
    } else {
      term = result_tuple(env, "ok", result.parse_tree.data,
                          result.parse_tree.len);
    }
    pg_query_free_protobuf_parse_result(result);

    return term;
  } else {
    return enif_make_badarg(env);
  }
}

static ErlNifFunc funcs[] = {{"parse_query", 1, parse_query}};

ERL_NIF_INIT(Elixir.PgQuery.Parser, funcs, NULL, NULL, NULL, NULL)
