/*
 * fuzz_parse_protobuf.c - LibFuzzer harness for pg_query_parse_protobuf
 *
 * Feeds arbitrary SQL strings to the parse path.
 */
#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include <stdlib.h>
#include "pg_query.h"

int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
    /* Need a null-terminated string */
    char *sql = malloc(size + 1);
    if (!sql) return 0;
    memcpy(sql, data, size);
    sql[size] = '\0';

    PgQueryProtobufParseResult result = pg_query_parse_protobuf(sql);
    pg_query_free_protobuf_parse_result(result);
    free(sql);
    return 0;
}
