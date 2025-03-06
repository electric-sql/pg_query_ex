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

  @doc """
  Deparses the Protobuf AST `parse_result` into a query string.
  """
  @spec protobuf_to_query(%PgQuery.ParseResult{}) :: {:ok, String.t()} | {:error, error()}
  defdelegate protobuf_to_query(parse_result), to: PgQuery.Parser

  @doc """
  Deparses the Protobuf AST `parse_result` into a query string.
  """
  @spec protobuf_to_query!(%PgQuery.ParseResult{}) :: String.t() | no_return()
  defdelegate protobuf_to_query!(parse_result), to: PgQuery.Parser
end
