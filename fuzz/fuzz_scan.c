/*
 * fuzz_scan.c - LibFuzzer harness for pg_query_scan
 *
 * Feeds arbitrary SQL strings to the scanner/tokenizer path.
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

    PgQueryScanResult result = pg_query_scan(sql);
    pg_query_free_scan_result(result);
    free(sql);
    return 0;
}
