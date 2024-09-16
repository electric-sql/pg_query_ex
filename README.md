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

**This package is not currently published to Hex**

The package can be installed by adding `pg_query_ex` to your list of
dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:pg_query_ex, github: "electric-sql/pg_query_ex"}
  ]
end
```

## License

This Elixir interface is distributed under the terms of the [Apache 2.0 license](./LICENSE).

The codebase also contains a git-subtree snapshot of [lib_pg_query](https://github.com/pganalyze/libpg_query) which is distributed under the [BSD 3-Clause license](https://github.com/pganalyze/libpg_query/blob/15-latest/LICENSE).

## Contributing

See the [Community Guidelines](https://github.com/electric-sql/meta) including the [Guide to Contributing](https://github.com/electric-sql/meta/blob/main/CONTRIBUTING.md) and [Contributor License Agreement](https://github.com/electric-sql/meta/blob/main/CLA.md).
