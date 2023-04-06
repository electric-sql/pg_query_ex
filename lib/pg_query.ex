defmodule PgQuery do
  defdelegate parse!(stmt), to: PgQuery.Parser
  defdelegate parse(stmt), to: PgQuery.Parser
end
