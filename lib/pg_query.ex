defmodule PgQuery do
  @type error() :: %{message: String.t(), cursorpos: non_neg_integer()}
  @doc """
  Parses the binary statement `stmt` into a Protobuf AST.

  Raises if the statement is invalid.
  """
  @spec parse!(String.t()) :: %PgQuery.ParseResult{} | no_return()
  defdelegate parse!(stmt), to: PgQuery.Parser

  @doc """
  Parses the binary statement `stmt` into a Protobuf AST.
  """
  @spec parse(String.t()) :: {:ok, %PgQuery.ParseResult{}} | {:error, error()}
  defdelegate parse(stmt), to: PgQuery.Parser
end
