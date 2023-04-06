defmodule PgQuery.Parser do
  @on_load :init

  defmodule Error do
    defexception [:message]
  end

  def init do
    :ok = load_nif()
  end

  defp load_nif do
    :pg_query_ex
    |> Application.app_dir("priv/libpg_query_ex")
    |> String.to_charlist()
    |> :erlang.load_nif(0)
  end

  def parse(query) when is_binary(query) do
    with {:ok, proto} <- parse_query(query) do
      Protox.decode(proto, PgQuery.ParseResult)
    end
  end

  def parse!(query) when is_binary(query) do
    case parse_query(query) do
      {:ok, proto} ->
        Protox.decode!(proto, PgQuery.ParseResult)

      {:error, reason} ->
        raise Error, message: reason
    end
  end

  def parse_query(_query), do: :erlang.nif_error(:nif_not_loaded)
end
