/*
 * fuzz_roundtrip.c - LibFuzzer harness for parse → deparse round-trip
 *
 * Parses arbitrary SQL then deparses the resulting protobuf.
 * Verifies that any successfully parsed query can be deparsed without crashing.
 */
#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include <stdlib.h>
#include "pg_query.h"

int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
    char *sql = malloc(size + 1);
    if (!sql) return 0;
    memcpy(sql, data, size);
    sql[size] = '\0';

    PgQueryProtobufParseResult parse_result = pg_query_parse_protobuf(sql);
    free(sql);

    if (!parse_result.error) {
        PgQueryDeparseResult deparse_result = pg_query_deparse_protobuf(parse_result.parse_tree);
        pg_query_free_deparse_result(deparse_result);
    }

    pg_query_free_protobuf_parse_result(parse_result);
    return 0;
}
