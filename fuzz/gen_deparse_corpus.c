/*
 * gen_deparse_corpus.c - Generate binary protobuf seeds for fuzz_deparse
 *
 * Parses each SQL statement passed on argv and writes the raw protobuf
 * bytes to a file in the output directory.
 *
 * Usage:
 *   ./gen_deparse_corpus <output_dir> <sql> [<sql> ...]
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "pg_query.h"

int main(int argc, char **argv) {
    if (argc < 3) {
        fprintf(stderr, "Usage: %s <output_dir> <sql> [<sql> ...]\n", argv[0]);
        return 1;
    }

    const char *outdir = argv[1];
    int ok = 0, fail = 0;

    for (int i = 2; i < argc; i++) {
        PgQueryProtobufParseResult result = pg_query_parse_protobuf(argv[i]);
        if (result.error) {
            fprintf(stderr, "  skip [%d]: parse error: %s\n", i - 1, result.error->message);
            fail++;
        } else {
            char path[4096];
            snprintf(path, sizeof(path), "%s/%03d.pb", outdir, i - 1);
            FILE *f = fopen(path, "wb");
            if (!f) {
                perror(path);
                pg_query_free_protobuf_parse_result(result);
                return 1;
            }
            fwrite(result.parse_tree.data, 1, result.parse_tree.len, f);
            fclose(f);
            fprintf(stderr, "  wrote %s (%zu bytes)\n", path, result.parse_tree.len);
            ok++;
        }
        pg_query_free_protobuf_parse_result(result);
    }

    fprintf(stderr, "Done: %d written, %d skipped\n", ok, fail);
    return 0;
}
