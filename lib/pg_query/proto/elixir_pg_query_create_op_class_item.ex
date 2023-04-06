# credo:disable-for-this-file
defmodule PgQuery.CreateOpClassItem do
  @moduledoc false
  defstruct itemtype: 0, name: nil, number: 0, order_family: [], class_args: [], storedtype: nil

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
        |> encode_itemtype(msg)
        |> encode_name(msg)
        |> encode_number(msg)
        |> encode_order_family(msg)
        |> encode_class_args(msg)
        |> encode_storedtype(msg)
      end
    )

    []

    [
      defp encode_itemtype(acc, msg) do
        try do
          if msg.itemtype == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_int32(msg.itemtype)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:itemtype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_name(acc, msg) do
        try do
          if msg.name == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_number(acc, msg) do
        try do
          if msg.number == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_int32(msg.number)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:number, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_order_family(acc, msg) do
        try do
          case msg.order_family do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\"", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:order_family, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_class_args(acc, msg) do
        try do
          case msg.class_args do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "*", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:class_args, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_storedtype(acc, msg) do
        try do
          if msg.storedtype == nil do
            acc
          else
            [acc, "2", Protox.Encode.encode_message(msg.storedtype)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:storedtype, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.CreateOpClassItem))
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
              {[itemtype: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 name:
                   Protox.MergeMessage.merge(msg.name, PgQuery.ObjectWithArgs.decode!(delimited))
               ], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[number: value], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[order_family: msg.order_family ++ [PgQuery.Node.decode!(delimited)]], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[class_args: msg.class_args ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 storedtype:
                   Protox.MergeMessage.merge(msg.storedtype, PgQuery.TypeName.decode!(delimited))
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
        PgQuery.CreateOpClassItem,
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
        1 => {:itemtype, {:scalar, 0}, :int32},
        2 => {:name, {:scalar, nil}, {:message, PgQuery.ObjectWithArgs}},
        3 => {:number, {:scalar, 0}, :int32},
        4 => {:order_family, :unpacked, {:message, PgQuery.Node}},
        5 => {:class_args, :unpacked, {:message, PgQuery.Node}},
        6 => {:storedtype, {:scalar, nil}, {:message, PgQuery.TypeName}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        class_args: {5, :unpacked, {:message, PgQuery.Node}},
        itemtype: {1, {:scalar, 0}, :int32},
        name: {2, {:scalar, nil}, {:message, PgQuery.ObjectWithArgs}},
        number: {3, {:scalar, 0}, :int32},
        order_family: {4, :unpacked, {:message, PgQuery.Node}},
        storedtype: {6, {:scalar, nil}, {:message, PgQuery.TypeName}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "itemtype",
          kind: {:scalar, 0},
          label: :optional,
          name: :itemtype,
          tag: 1,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "name",
          kind: {:scalar, nil},
          label: :optional,
          name: :name,
          tag: 2,
          type: {:message, PgQuery.ObjectWithArgs}
        },
        %{
          __struct__: Protox.Field,
          json_name: "number",
          kind: {:scalar, 0},
          label: :optional,
          name: :number,
          tag: 3,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "orderFamily",
          kind: :unpacked,
          label: :repeated,
          name: :order_family,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "classArgs",
          kind: :unpacked,
          label: :repeated,
          name: :class_args,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "storedtype",
          kind: {:scalar, nil},
          label: :optional,
          name: :storedtype,
          tag: 6,
          type: {:message, PgQuery.TypeName}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:itemtype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "itemtype",
             kind: {:scalar, 0},
             label: :optional,
             name: :itemtype,
             tag: 1,
             type: :int32
           }}
        end

        def field_def("itemtype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "itemtype",
             kind: {:scalar, 0},
             label: :optional,
             name: :itemtype,
             tag: 1,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, nil},
             label: :optional,
             name: :name,
             tag: 2,
             type: {:message, PgQuery.ObjectWithArgs}
           }}
        end

        def field_def("name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, nil},
             label: :optional,
             name: :name,
             tag: 2,
             type: {:message, PgQuery.ObjectWithArgs}
           }}
        end

        []
      ),
      (
        def field_def(:number) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "number",
             kind: {:scalar, 0},
             label: :optional,
             name: :number,
             tag: 3,
             type: :int32
           }}
        end

        def field_def("number") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "number",
             kind: {:scalar, 0},
             label: :optional,
             name: :number,
             tag: 3,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:order_family) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "orderFamily",
             kind: :unpacked,
             label: :repeated,
             name: :order_family,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("orderFamily") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "orderFamily",
             kind: :unpacked,
             label: :repeated,
             name: :order_family,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("order_family") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "orderFamily",
             kind: :unpacked,
             label: :repeated,
             name: :order_family,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:class_args) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "classArgs",
             kind: :unpacked,
             label: :repeated,
             name: :class_args,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("classArgs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "classArgs",
             kind: :unpacked,
             label: :repeated,
             name: :class_args,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("class_args") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "classArgs",
             kind: :unpacked,
             label: :repeated,
             name: :class_args,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:storedtype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "storedtype",
             kind: {:scalar, nil},
             label: :optional,
             name: :storedtype,
             tag: 6,
             type: {:message, PgQuery.TypeName}
           }}
        end

        def field_def("storedtype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "storedtype",
             kind: {:scalar, nil},
             label: :optional,
             name: :storedtype,
             tag: 6,
             type: {:message, PgQuery.TypeName}
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
    def default(:itemtype) do
      {:ok, 0}
    end,
    def default(:name) do
      {:ok, nil}
    end,
    def default(:number) do
      {:ok, 0}
    end,
    def default(:order_family) do
      {:error, :no_default_value}
    end,
    def default(:class_args) do
      {:error, :no_default_value}
    end,
    def default(:storedtype) do
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
