/*
 * fuzz_deparse.c - LibFuzzer harness for pg_query_deparse_protobuf
 *
 * Feeds arbitrary bytes as a protobuf parse-tree to the deparse path.
 * This is the highest-risk path: before our fix, a truncated/invalid
 * protobuf caused a SEGV via NULL-dereference in pg_query_protobuf_to_nodes.
 */
#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include "pg_query.h"

int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
    PgQueryProtobuf protobuf;
    protobuf.data = (char *)data;
    protobuf.len  = size;

    PgQueryDeparseResult result = pg_query_deparse_protobuf(protobuf);
    pg_query_free_deparse_result(result);
    return 0;
}
