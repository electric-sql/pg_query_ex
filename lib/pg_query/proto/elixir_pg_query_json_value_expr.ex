# credo:disable-for-this-file
defmodule PgQuery.JsonValueExpr do
  @moduledoc false
  defstruct raw_expr: nil, formatted_expr: nil, format: nil

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
        [] |> encode_raw_expr(msg) |> encode_formatted_expr(msg) |> encode_format(msg)
      end
    )

    []

    [
      defp encode_raw_expr(acc, msg) do
        try do
          if msg.raw_expr == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.raw_expr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:raw_expr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_formatted_expr(acc, msg) do
        try do
          if msg.formatted_expr == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.formatted_expr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:formatted_expr, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_format(acc, msg) do
        try do
          if msg.format == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.format)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:format, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.JsonValueExpr))
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
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 raw_expr:
                   Protox.MergeMessage.merge(msg.raw_expr, PgQuery.Node.decode!(delimited))
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 formatted_expr:
                   Protox.MergeMessage.merge(msg.formatted_expr, PgQuery.Node.decode!(delimited))
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 format:
                   Protox.MergeMessage.merge(msg.format, PgQuery.JsonFormat.decode!(delimited))
               ], rest}

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
        PgQuery.JsonValueExpr,
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
        1 => {:raw_expr, {:scalar, nil}, {:message, PgQuery.Node}},
        2 => {:formatted_expr, {:scalar, nil}, {:message, PgQuery.Node}},
        3 => {:format, {:scalar, nil}, {:message, PgQuery.JsonFormat}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        format: {3, {:scalar, nil}, {:message, PgQuery.JsonFormat}},
        formatted_expr: {2, {:scalar, nil}, {:message, PgQuery.Node}},
        raw_expr: {1, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "rawExpr",
          kind: {:scalar, nil},
          label: :optional,
          name: :raw_expr,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "formattedExpr",
          kind: {:scalar, nil},
          label: :optional,
          name: :formatted_expr,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "format",
          kind: {:scalar, nil},
          label: :optional,
          name: :format,
          tag: 3,
          type: {:message, PgQuery.JsonFormat}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:raw_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rawExpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :raw_expr,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("rawExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rawExpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :raw_expr,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("raw_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rawExpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :raw_expr,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:formatted_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "formattedExpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :formatted_expr,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("formattedExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "formattedExpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :formatted_expr,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("formatted_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "formattedExpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :formatted_expr,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:format) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "format",
             kind: {:scalar, nil},
             label: :optional,
             name: :format,
             tag: 3,
             type: {:message, PgQuery.JsonFormat}
           }}
        end

        def field_def("format") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "format",
             kind: {:scalar, nil},
             label: :optional,
             name: :format,
             tag: 3,
             type: {:message, PgQuery.JsonFormat}
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
    def default(:raw_expr) do
      {:ok, nil}
    end,
    def default(:formatted_expr) do
      {:ok, nil}
    end,
    def default(:format) do
      {:ok, nil}
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
