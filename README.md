<a href="https://electric-sql.com">
  <picture>
    <source media="(prefers-color-scheme: dark)"
        srcset="https://raw.githubusercontent.com/electric-sql/meta/main/identity/ElectricSQL-logo-light-trans.svg"
    />
    <source media="(prefers-color-scheme: light)"
        srcset="https://raw.githubusercontent.com/electric-sql/meta/main/identity/ElectricSQL-logo-black.svg"
    />
    <img alt="ElectricSQL logo"
        src="https://raw.githubusercontent.com/electric-sql/meta/main/identity/ElectricSQL-logo-black.svg"
    />
  </picture>
</a>

[![License - Apache 2.0](https://img.shields.io/badge/license-Apache_2.0-blue)](./LICENSE)

# PgQuery

An Elixir interface to the [lib_pg_query postgres query parser](https://github.com/pganalyze/libpg_query).

```elixir
{:ok, ast} = PgQuery.parse("select * from a_table")
```

## Installation

The package can be installed by adding `pg_query_ex` to your list of
dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:pg_query_ex, "~> 0.10"}
  ]
end
```

## Fuzzing

The `fuzz/` directory contains [libFuzzer](https://llvm.org/docs/LibFuzzer.html) harnesses that exercise the NIF boundary. You need clang with libFuzzer support (standard in most LLVM distributions).

Build all four targets:

```bash
make fuzz
```

Optionally seed the deparse corpus from known-good SQL strings:

```bash
make fuzz-corpus
```

Then run a target, for example:

```bash
# Fuzz the parse → deparse round-trip (highest-value target)
fuzz/_build/fuzz_roundtrip -max_len=4096 -artifact_prefix=fuzz/crashes/ fuzz/corpus/parse/

# Fuzz raw protobuf bytes fed directly into the deparser
fuzz/_build/fuzz_deparse -max_len=65536 -artifact_prefix=fuzz/crashes/ fuzz/corpus/deparse/

# Fuzz the SQL parser
fuzz/_build/fuzz_parse_protobuf -max_len=4096 -artifact_prefix=fuzz/crashes/ fuzz/corpus/parse/

# Fuzz the SQL scanner
fuzz/_build/fuzz_scan -max_len=4096 -artifact_prefix=fuzz/crashes/ fuzz/corpus/parse/
```

Crash artifacts are written to `fuzz/crashes/` (the `-artifact_prefix` flag controls this; without it libFuzzer writes to the current directory). Replay a crash by passing the file as a positional argument:

```bash
fuzz/_build/fuzz_roundtrip fuzz/crashes/<file>
```

Clean up build artefacts and generated corpus with `make fuzz-clean`.

## License

This Elixir interface is distributed under the terms of the [Apache 2.0 license](./LICENSE).

The codebase also contains a git-subtree snapshot of [lib_pg_query](https://github.com/pganalyze/libpg_query) which is distributed under the [BSD 3-Clause license](https://github.com/pganalyze/libpg_query/blob/15-latest/LICENSE).

## Contributing

See the [Community Guidelines](https://github.com/electric-sql/meta) including the [Guide to Contributing](https://github.com/electric-sql/meta/blob/main/CONTRIBUTING.md) and [Contributor License Agreement](https://github.com/electric-sql/meta/blob/main/CLA.md).
