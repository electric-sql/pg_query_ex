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

      {:error, %{message: message}} ->
        raise Error, message: message
    end
  end

  def protobuf_to_query(%PgQuery.ParseResult{} = parse_result) do
    with {:ok, encoded, _size} <- Protox.encode(parse_result) do
      deparse_query(IO.iodata_to_binary(encoded))
    end
  end

  def protobuf_to_query!(%PgQuery.ParseResult{} = parse_result) do
    case protobuf_to_query(parse_result) do
      {:ok, query} ->
        query

      {:error, %{message: message}} ->
        raise Error, message: message
    end
  end

  def scan(query) when is_binary(query) do
    with {:ok, proto} <- scan_query(query) do
      Protox.decode(proto, PgQuery.ScanResult)
    end
  end

  def scan!(query) when is_binary(query) do
    case scan_query(query) do
      {:ok, proto} ->
        Protox.decode!(proto, PgQuery.ScanResult)

      {:error, %{message: message}} ->
        raise Error, message: message
    end
  end

  def parse_query(_query), do: :erlang.nif_error(:nif_not_loaded)
  def deparse_query(_encoded_proto), do: :erlang.nif_error(:nif_not_loaded)
  def scan_query(_query), do: :erlang.nif_error(:nif_not_loaded)
end
