[![License - Apache 2.0](https://img.shields.io/badge/license-Apache_2.0-blue)](main/LICENSE)

# PgQuery

An Elixir interface to the [lib_pg_query postgres query parser](https://github.com/pganalyze/libpg_query).

``` elixir
{:ok, ast} = PgQuery.parse("select * from a_table")
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `pg_query` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:pg_query, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/pg_query>.

