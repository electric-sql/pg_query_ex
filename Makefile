MIX = mix
CFLAGS = -O3 -Wall
ERLANG_PATH = $(shell erl -eval 'io:format("~s", [lists:concat([code:root_dir(), "/erts-", erlang:system_info(version), "/include"])])' -s init stop -noshell)
CFLAGS += -I$(ERLANG_PATH)
LIBPG_QUERY_PATH = c_src/libpg_query

CFLAGS += -I$(LIBPG_QUERY_PATH) -fPIC

LDFLAGS = -lpthread -shared
ifeq ($(shell uname -s),Darwin)
    LDFLAGS += -undefined dynamic_lookup
endif

FUZZ_CC      = clang
FUZZ_CFLAGS  = -g -O1 -fsanitize=fuzzer,address -I$(LIBPG_QUERY_PATH)
FUZZ_LDFLAGS = -fsanitize=fuzzer,address -lpthread
FUZZ_SRCS    = fuzz/fuzz_parse_protobuf.c \
               fuzz/fuzz_scan.c \
               fuzz/fuzz_deparse.c \
               fuzz/fuzz_roundtrip.c
FUZZ_BINS    = $(patsubst fuzz/%.c,fuzz/_build/%,$(FUZZ_SRCS))

.PHONY: all libpg_query_ex clean fuzz fuzz-corpus fuzz-clean patch update-libpg_query

all: priv/libpg_query_ex.so


fuzz/_build:
	mkdir -p fuzz/_build

$(LIBPG_QUERY_PATH)/libpg_query.a:
	$(MAKE) -B -C $(LIBPG_QUERY_PATH) libpg_query.a

priv/libpg_query_ex.so: $(LIBPG_QUERY_PATH)/libpg_query.a c_src/libpg_query_ex.c
	mkdir -p priv
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ c_src/libpg_query_ex.c $(LIBPG_QUERY_PATH)/libpg_query.a

# Build all fuzz targets (requires clang with libFuzzer)
fuzz: fuzz/_build $(LIBPG_QUERY_PATH)/libpg_query.a $(FUZZ_BINS)
	@echo ""
	@echo "Fuzz targets built in fuzz/_build/. Next steps:"
	@echo "  1. Populate the deparse corpus:  make fuzz-corpus"
	@echo "  2. Run a fuzzer, e.g.:"
	@echo "       fuzz/_build/fuzz_parse_protobuf -max_len=65536 fuzz/corpus/parse/"
	@echo "       fuzz/_build/fuzz_deparse        -max_len=65536 fuzz/corpus/deparse/"

fuzz/_build/%: fuzz/%.c $(LIBPG_QUERY_PATH)/libpg_query.a
	$(FUZZ_CC) $(FUZZ_CFLAGS) -o $@ $< $(LIBPG_QUERY_PATH)/libpg_query.a $(FUZZ_LDFLAGS)

# Also build the corpus generator (not a fuzz target, no -fsanitize=fuzzer)
fuzz/_build/gen_deparse_corpus: fuzz/gen_deparse_corpus.c $(LIBPG_QUERY_PATH)/libpg_query.a
	$(FUZZ_CC) -g -O1 -fsanitize=address -I$(LIBPG_QUERY_PATH) -o $@ $< \
		$(LIBPG_QUERY_PATH)/libpg_query.a -fsanitize=address -lpthread

# Generate binary protobuf seeds for fuzz_deparse from the SQL corpus
fuzz-corpus: fuzz/_build/gen_deparse_corpus
	@mkdir -p fuzz/corpus/deparse
	fuzz/_build/gen_deparse_corpus fuzz/corpus/deparse \
		"SELECT 1" \
		"SELECT id, name FROM users WHERE active = true" \
		"SELECT u.id, o.total FROM users u JOIN orders o ON u.id = o.user_id" \
		"INSERT INTO users (name, email) VALUES ('Alice', 'alice@example.com')" \
		"UPDATE users SET active = false WHERE last_login < NOW() - INTERVAL '90 days'" \
		"DELETE FROM sessions WHERE expires_at < NOW()" \
		"WITH recent AS (SELECT * FROM events WHERE created_at > NOW() - INTERVAL '1 hour') SELECT count(*) FROM recent" \
		"SELECT * FROM users WHERE id IN (SELECT user_id FROM orders WHERE total > 100)" \
		"SELECT department, count(*), avg(salary) FROM employees GROUP BY department HAVING count(*) > 5" \
		"SELECT id, salary, rank() OVER (PARTITION BY department ORDER BY salary DESC) FROM employees" \
		"SELECT id::text, created_at::date, price::numeric(10,2) FROM products" \
		"SELECT CASE WHEN status = 1 THEN 'active' WHEN status = 2 THEN 'pending' ELSE 'unknown' END FROM orders" \
		"SELECT ARRAY[1,2,3], unnest(tags) FROM posts" \
		"SELECT data->>'name', data->'address'->>'city' FROM profiles WHERE data @> '{\"active\":true}'" \
		"SELECT id FROM users WHERE EXISTS (SELECT 1 FROM orders WHERE orders.user_id = users.id)" \
		"SELECT * FROM events WHERE created_at BETWEEN '2024-01-01' AND '2024-12-31'" \
		"SELECT * FROM users WHERE email ILIKE '%@example.com' AND name NOT LIKE 'test%'" \
		"SELECT * FROM users WHERE deleted_at IS NULL AND parent_id IS NOT NULL" \
		"SELECT * FROM users WHERE id = \$$1 AND status = \$$2" \
		"SELECT id FROM admins UNION ALL SELECT id FROM moderators EXCEPT SELECT id FROM banned_users"

fuzz-clean:
	$(RM) -r fuzz/_build fuzz/corpus/deparse fuzz/crashes

protobuf:
	MIX_ENV=prod mix protox.generate --output-path=lib/pg_query/proto --multiple-files c_src/libpg_query/protobuf/pg_query.proto

clean:
	$(MIX) clean
	$(MAKE) -C $(LIBPG_QUERY_PATH) clean
	$(RM) priv/libpg_query_ex.so

# Apply all local patches to the vendored libpg_query source
patch:
	@for p in patches/*.patch; do \
		echo "Applying $$p ..."; \
		git apply "$$p" || { echo "FAILED: $$p"; exit 1; }; \
	done
	@echo "All patches applied."

update-libpg_query:
	git subtree pull -P "c_src/libpg_query" --squash https://github.com/pganalyze/libpg_query.git 17-latest
	$(MAKE) patch

