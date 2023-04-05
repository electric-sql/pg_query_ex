defmodule PgQuery do
  use Protox,
    files: [
      "./c_src/libpg_query/protobuf/pg_query.proto"
    ],
    keep_unknown_fields: false

  defdelegate parse!(stmt), to: PgQuery.Parser
  defdelegate parse(stmt), to: PgQuery.Parser
end
