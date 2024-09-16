defmodule PgQuery.MixProject do
  use Mix.Project

  def project do
    [
      app: :pg_query_ex,
      elixir: "~> 1.13",
      version: "0.5.3",
      start_permanent: Mix.env() == :prod,
      compilers: [:elixir_make] ++ Mix.compilers(),
      deps: deps(),
      description: description(),
      name: "PgQuery",
      package: package(),
      docs: docs(),
      source_url: "https://github.com/electric-sql/pg_query_ex",
      homepage_url: "https://electric-sql.com"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:elixir_make, "~> 0.4", runtime: false},
      {:protox, "~> 1.7"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    # Exclude the test files and other bits and bobs to sneak us in under the
    # 8MB hex.pm package size limit...
    c_src = ~w(
      c_src/libpg_query_ex.c
      c_src/libpg_query/LICENSE
      c_src/libpg_query/Makefile
      c_src/libpg_query/README.md
      c_src/libpg_query/pg_query.h
      c_src/libpg_query/patches
      c_src/libpg_query/protobuf
      c_src/libpg_query/src
      c_src/libpg_query/vendor
    )

    [
      files: ~w(lib .formatter.exs mix.exs README.* LICENSE Makefile) ++ c_src,
      licenses: ["Apache-2.0"],
      links: %{
        "libpg_query" => "https://github.com/pganalyze/libpg_query",
        "Github" => "https://github.com/electric-sql/pg_query_ex",
        "Electric SQL" => "https://electric-sql.com"
      }
    ]
  end

  defp description do
    "An Elixir interface to the lib_pg_query postgres query parser. Converts a valid PostgreSQL query into a Protobuf based AST."
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md", "LICENSE"]
    ]
  end
end
