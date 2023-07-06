MIX = mix
CFLAGS = -O3 -Wall
ERLANG_PATH = $(shell erl -eval 'io:format("~s", [lists:concat([code:root_dir(), "/erts-", erlang:system_info(version), "/include"])])' -s init stop -noshell)
CFLAGS += -I$(ERLANG_PATH)
LIBPG_QUERY_PATH = c_src/libpg_query

CFLAGS += -I$(LIBPG_QUERY_PATH) -fPIC

LDFLAGS = -lpthread
ifeq ($(shell uname -s),Darwin)
    LDFLAGS += -undefined dynamic_lookup
endif

.PHONY: all libpg_query_ex clean

all: priv/libpg_query_ex.so

priv:
	mkdir -p priv

$(LIBPG_QUERY_PATH)/libpg_query.a:
	$(MAKE) -B -C $(LIBPG_QUERY_PATH) libpg_query.a

priv/libpg_query_ex.so: priv $(LIBPG_QUERY_PATH)/libpg_query.a c_src/libpg_query_ex.c
	$(CC) $(CFLAGS) -shared $(LDFLAGS) -o $@ c_src/libpg_query_ex.c $(LIBPG_QUERY_PATH)/libpg_query.a

protobuf:
	MIX_ENV=prod mix protox.generate --output-path=lib/pg_query/proto --multiple-files --keep-unknown-fields=false c_src/libpg_query/protobuf/pg_query.proto

clean:
	$(MIX) clean
	$(MAKE) -C $(LIBPG_QUERY_PATH) clean
	$(RM) priv/libpg_query_ex.so
