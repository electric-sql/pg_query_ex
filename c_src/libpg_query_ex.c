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

ERL_NIF_TERM make_binary(ErlNifEnv *env, char *source) {
  ERL_NIF_TERM binary;
  size_t len = strlen(source);
  unsigned char *data = enif_make_new_binary(env, len, &binary);
  memcpy(data, source, len);
  return binary;
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
      ERL_NIF_TERM error_map = enif_make_new_map(env);

      if (!enif_make_map_put(
        env,
        error_map,
        enif_make_atom(env, "message"), 
        make_binary(env, result.error->message),
        &error_map
      )) {
        return enif_raise_exception(env, make_binary(env, "failed to update map"));
      }

      if (!enif_make_map_put(
        env,
        error_map,
        enif_make_atom(env, "cursorpos"), 
        // drop the cursorpos by one, so it's zero-indexed
        enif_make_int(env, result.error->cursorpos - 1),
        &error_map
      )) {
        return enif_raise_exception(env, make_binary(env, "failed to update map"));
      }

      term = enif_make_tuple2(env, enif_make_atom(env, "error"), error_map);
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

static ERL_NIF_TERM deparse_query(ErlNifEnv *env, int argc,
                               const ERL_NIF_TERM argv[]) {
  ErlNifBinary proto;
  ERL_NIF_TERM term;

  if (argc == 1 && enif_inspect_binary(env, argv[0], &proto)) {
    PgQueryProtobuf parse_tree;
    parse_tree.data = (char *)proto.data;
    parse_tree.len = proto.size;

    PgQueryDeparseResult result = pg_query_deparse_protobuf(parse_tree);

    if (result.error) {
      ERL_NIF_TERM error_map = enif_make_new_map(env);

      if (!enif_make_map_put(
        env,
        error_map,
        enif_make_atom(env, "message"), 
        make_binary(env, result.error->message),
        &error_map
      )) {
        return enif_raise_exception(env, make_binary(env, "failed to update map"));
      }

      term = enif_make_tuple2(env, enif_make_atom(env, "error"), error_map);
    } else {
      term = result_tuple(env, "ok", result.query, strlen(result.query));
    }
    pg_query_free_deparse_result(result);

    return term;
  } else {
    return enif_make_badarg(env);
  }
}

static ErlNifFunc funcs[] = {
  {"parse_query", 1, parse_query},
  {"deparse_query", 1, deparse_query}
};

ERL_NIF_INIT(Elixir.PgQuery.Parser, funcs, NULL, NULL, NULL, NULL)
