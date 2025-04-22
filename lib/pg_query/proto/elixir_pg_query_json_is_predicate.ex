# credo:disable-for-this-file
defmodule PgQuery.JsonIsPredicate do
  @moduledoc false
  defstruct expr: nil,
            format: nil,
            item_type: :JSON_VALUE_TYPE_UNDEFINED,
            unique_keys: false,
            location: 0

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
        []
        |> encode_expr(msg)
        |> encode_format(msg)
        |> encode_item_type(msg)
        |> encode_unique_keys(msg)
        |> encode_location(msg)
      end
    )

    []

    [
      defp encode_expr(acc, msg) do
        try do
          if msg.expr == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.expr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:expr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_format(acc, msg) do
        try do
          if msg.format == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.format)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:format, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_item_type(acc, msg) do
        try do
          if msg.item_type == :JSON_VALUE_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "\x18",
              msg.item_type |> PgQuery.JsonValueType.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:item_type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_unique_keys(acc, msg) do
        try do
          if msg.unique_keys == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.unique_keys)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:unique_keys, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_int32(msg.location)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:location, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.JsonIsPredicate))
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
              {[expr: Protox.MergeMessage.merge(msg.expr, PgQuery.Node.decode!(delimited))], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 format:
                   Protox.MergeMessage.merge(msg.format, PgQuery.JsonFormat.decode!(delimited))
               ], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.JsonValueType)
              {[item_type: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[unique_keys: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[location: value], rest}

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
        PgQuery.JsonIsPredicate,
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
        1 => {:expr, {:scalar, nil}, {:message, PgQuery.Node}},
        2 => {:format, {:scalar, nil}, {:message, PgQuery.JsonFormat}},
        3 => {:item_type, {:scalar, :JSON_VALUE_TYPE_UNDEFINED}, {:enum, PgQuery.JsonValueType}},
        4 => {:unique_keys, {:scalar, false}, :bool},
        5 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        expr: {1, {:scalar, nil}, {:message, PgQuery.Node}},
        format: {2, {:scalar, nil}, {:message, PgQuery.JsonFormat}},
        item_type: {3, {:scalar, :JSON_VALUE_TYPE_UNDEFINED}, {:enum, PgQuery.JsonValueType}},
        location: {5, {:scalar, 0}, :int32},
        unique_keys: {4, {:scalar, false}, :bool}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "expr",
          kind: {:scalar, nil},
          label: :optional,
          name: :expr,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "format",
          kind: {:scalar, nil},
          label: :optional,
          name: :format,
          tag: 2,
          type: {:message, PgQuery.JsonFormat}
        },
        %{
          __struct__: Protox.Field,
          json_name: "itemType",
          kind: {:scalar, :JSON_VALUE_TYPE_UNDEFINED},
          label: :optional,
          name: :item_type,
          tag: 3,
          type: {:enum, PgQuery.JsonValueType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "uniqueKeys",
          kind: {:scalar, false},
          label: :optional,
          name: :unique_keys,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 5,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "expr",
             kind: {:scalar, nil},
             label: :optional,
             name: :expr,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "expr",
             kind: {:scalar, nil},
             label: :optional,
             name: :expr,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        []
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
             tag: 2,
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
             tag: 2,
             type: {:message, PgQuery.JsonFormat}
           }}
        end

        []
      ),
      (
        def field_def(:item_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "itemType",
             kind: {:scalar, :JSON_VALUE_TYPE_UNDEFINED},
             label: :optional,
             name: :item_type,
             tag: 3,
             type: {:enum, PgQuery.JsonValueType}
           }}
        end

        def field_def("itemType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "itemType",
             kind: {:scalar, :JSON_VALUE_TYPE_UNDEFINED},
             label: :optional,
             name: :item_type,
             tag: 3,
             type: {:enum, PgQuery.JsonValueType}
           }}
        end

        def field_def("item_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "itemType",
             kind: {:scalar, :JSON_VALUE_TYPE_UNDEFINED},
             label: :optional,
             name: :item_type,
             tag: 3,
             type: {:enum, PgQuery.JsonValueType}
           }}
        end
      ),
      (
        def field_def(:unique_keys) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "uniqueKeys",
             kind: {:scalar, false},
             label: :optional,
             name: :unique_keys,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("uniqueKeys") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "uniqueKeys",
             kind: {:scalar, false},
             label: :optional,
             name: :unique_keys,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("unique_keys") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "uniqueKeys",
             kind: {:scalar, false},
             label: :optional,
             name: :unique_keys,
             tag: 4,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:location) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "location",
             kind: {:scalar, 0},
             label: :optional,
             name: :location,
             tag: 5,
             type: :int32
           }}
        end

        def field_def("location") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "location",
             kind: {:scalar, 0},
             label: :optional,
             name: :location,
             tag: 5,
             type: :int32
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
    def default(:expr) do
      {:ok, nil}
    end,
    def default(:format) do
      {:ok, nil}
    end,
    def default(:item_type) do
      {:ok, :JSON_VALUE_TYPE_UNDEFINED}
    end,
    def default(:unique_keys) do
      {:ok, false}
    end,
    def default(:location) do
      {:ok, 0}
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
