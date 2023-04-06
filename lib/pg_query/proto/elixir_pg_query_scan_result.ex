# credo:disable-for-this-file
defmodule PgQuery.ScanResult do
  @moduledoc false
  defstruct version: 0, tokens: []

  (
    (
      @spec encode(struct) :: {:ok, iodata} | {:error, any}
      def encode(msg) do
        try do
          {:ok, encode!(msg)}
        rescue
          e in [Protox.EncodingError, Protox.RequiredFieldsError] -> {:error, e}
        end
      end

      @spec encode!(struct) :: iodata | no_return
      def encode!(msg) do
        [] |> encode_version(msg) |> encode_tokens(msg)
      end
    )

    []

    [
      defp encode_version(acc, msg) do
        try do
          if msg.version == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_int32(msg.version)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:version, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_tokens(acc, msg) do
        try do
          case msg.tokens do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x12", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:tokens, "invalid field value"), __STACKTRACE__
        end
      end
    ]

    []
  )

  (
    (
      @spec decode(binary) :: {:ok, struct} | {:error, any}
      def decode(bytes) do
        try do
          {:ok, decode!(bytes)}
        rescue
          e in [Protox.DecodingError, Protox.IllegalTagError, Protox.RequiredFieldsError] ->
            {:error, e}
        end
      end

      (
        @spec decode!(binary) :: struct | no_return
        def decode!(bytes) do
          parse_key_value(bytes, struct(PgQuery.ScanResult))
        end
      )
    )

    (
      @spec parse_key_value(binary, struct) :: struct
      defp parse_key_value(<<>>, msg) do
        msg
      end

      defp parse_key_value(bytes, msg) do
        {field, rest} =
          case Protox.Decode.parse_key(bytes) do
            {0, _, _} ->
              raise %Protox.IllegalTagError{}

            {1, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[version: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[tokens: msg.tokens ++ [PgQuery.ScanToken.decode!(delimited)]], rest}

            {tag, wire_type, rest} ->
              {_, rest} = Protox.Decode.parse_unknown(tag, wire_type, rest)
              {[], rest}
          end

        msg_updated = struct(msg, field)
        parse_key_value(rest, msg_updated)
      end
    )

    []
  )

  (
    @spec json_decode(iodata(), keyword()) :: {:ok, struct()} | {:error, any()}
    def json_decode(input, opts \\ []) do
      try do
        {:ok, json_decode!(input, opts)}
      rescue
        e in Protox.JsonDecodingError -> {:error, e}
      end
    end

    @spec json_decode!(iodata(), keyword()) :: struct() | no_return()
    def json_decode!(input, opts \\ []) do
      {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :decode)

      Protox.JsonDecode.decode!(
        input,
        PgQuery.ScanResult,
        &json_library_wrapper.decode!(json_library, &1)
      )
    end

    @spec json_encode(struct(), keyword()) :: {:ok, iodata()} | {:error, any()}
    def json_encode(msg, opts \\ []) do
      try do
        {:ok, json_encode!(msg, opts)}
      rescue
        e in Protox.JsonEncodingError -> {:error, e}
      end
    end

    @spec json_encode!(struct(), keyword()) :: iodata() | no_return()
    def json_encode!(msg, opts \\ []) do
      {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :encode)
      Protox.JsonEncode.encode!(msg, &json_library_wrapper.encode!(json_library, &1))
    end
  )

  (
    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs() do
      %{
        1 => {:version, {:scalar, 0}, :int32},
        2 => {:tokens, :unpacked, {:message, PgQuery.ScanToken}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{tokens: {2, :unpacked, {:message, PgQuery.ScanToken}}, version: {1, {:scalar, 0}, :int32}}
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "version",
          kind: {:scalar, 0},
          label: :optional,
          name: :version,
          tag: 1,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "tokens",
          kind: :unpacked,
          label: :repeated,
          name: :tokens,
          tag: 2,
          type: {:message, PgQuery.ScanToken}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:version) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "version",
             kind: {:scalar, 0},
             label: :optional,
             name: :version,
             tag: 1,
             type: :int32
           }}
        end

        def field_def("version") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "version",
             kind: {:scalar, 0},
             label: :optional,
             name: :version,
             tag: 1,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:tokens) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tokens",
             kind: :unpacked,
             label: :repeated,
             name: :tokens,
             tag: 2,
             type: {:message, PgQuery.ScanToken}
           }}
        end

        def field_def("tokens") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tokens",
             kind: :unpacked,
             label: :repeated,
             name: :tokens,
             tag: 2,
             type: {:message, PgQuery.ScanToken}
           }}
        end

        []
      ),
      def field_def(_) do
        {:error, :no_such_field}
      end
    ]
  )

  []

  (
    @spec required_fields() :: []
    def required_fields() do
      []
    end
  )

  (
    @spec syntax() :: atom()
    def syntax() do
      :proto3
    end
  )

  [
    @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
    def default(:version) do
      {:ok, 0}
    end,
    def default(:tokens) do
      {:error, :no_default_value}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]

  (
    @spec file_options() :: nil
    def file_options() do
      nil
    end
  )
end
