# credo:disable-for-this-file
defmodule PgQuery.CreateOpClassStmt do
  @moduledoc false
  defstruct opclassname: [],
            opfamilyname: [],
            amname: "",
            datatype: nil,
            items: [],
            is_default: false

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
        |> encode_opclassname(msg)
        |> encode_opfamilyname(msg)
        |> encode_amname(msg)
        |> encode_datatype(msg)
        |> encode_items(msg)
        |> encode_is_default(msg)
      end
    )

    []

    [
      defp encode_opclassname(acc, msg) do
        try do
          case msg.opclassname do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\n", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:opclassname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_opfamilyname(acc, msg) do
        try do
          case msg.opfamilyname do
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
            reraise Protox.EncodingError.new(:opfamilyname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_amname(acc, msg) do
        try do
          if msg.amname == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.amname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:amname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_datatype(acc, msg) do
        try do
          if msg.datatype == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.datatype)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:datatype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_items(acc, msg) do
        try do
          case msg.items do
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
            reraise Protox.EncodingError.new(:items, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_is_default(acc, msg) do
        try do
          if msg.is_default == false do
            acc
          else
            [acc, "0", Protox.Encode.encode_bool(msg.is_default)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_default, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.CreateOpClassStmt))
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
              {[opclassname: msg.opclassname ++ [PgQuery.Node.decode!(delimited)]], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[opfamilyname: msg.opfamilyname ++ [PgQuery.Node.decode!(delimited)]], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[amname: delimited], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 datatype:
                   Protox.MergeMessage.merge(msg.datatype, PgQuery.TypeName.decode!(delimited))
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[items: msg.items ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_default: value], rest}

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
        PgQuery.CreateOpClassStmt,
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
        1 => {:opclassname, :unpacked, {:message, PgQuery.Node}},
        2 => {:opfamilyname, :unpacked, {:message, PgQuery.Node}},
        3 => {:amname, {:scalar, ""}, :string},
        4 => {:datatype, {:scalar, nil}, {:message, PgQuery.TypeName}},
        5 => {:items, :unpacked, {:message, PgQuery.Node}},
        6 => {:is_default, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        amname: {3, {:scalar, ""}, :string},
        datatype: {4, {:scalar, nil}, {:message, PgQuery.TypeName}},
        is_default: {6, {:scalar, false}, :bool},
        items: {5, :unpacked, {:message, PgQuery.Node}},
        opclassname: {1, :unpacked, {:message, PgQuery.Node}},
        opfamilyname: {2, :unpacked, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "opclassname",
          kind: :unpacked,
          label: :repeated,
          name: :opclassname,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "opfamilyname",
          kind: :unpacked,
          label: :repeated,
          name: :opfamilyname,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "amname",
          kind: {:scalar, ""},
          label: :optional,
          name: :amname,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "datatype",
          kind: {:scalar, nil},
          label: :optional,
          name: :datatype,
          tag: 4,
          type: {:message, PgQuery.TypeName}
        },
        %{
          __struct__: Protox.Field,
          json_name: "items",
          kind: :unpacked,
          label: :repeated,
          name: :items,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "isDefault",
          kind: {:scalar, false},
          label: :optional,
          name: :is_default,
          tag: 6,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:opclassname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opclassname",
             kind: :unpacked,
             label: :repeated,
             name: :opclassname,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("opclassname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opclassname",
             kind: :unpacked,
             label: :repeated,
             name: :opclassname,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:opfamilyname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opfamilyname",
             kind: :unpacked,
             label: :repeated,
             name: :opfamilyname,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("opfamilyname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opfamilyname",
             kind: :unpacked,
             label: :repeated,
             name: :opfamilyname,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:amname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "amname",
             kind: {:scalar, ""},
             label: :optional,
             name: :amname,
             tag: 3,
             type: :string
           }}
        end

        def field_def("amname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "amname",
             kind: {:scalar, ""},
             label: :optional,
             name: :amname,
             tag: 3,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:datatype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "datatype",
             kind: {:scalar, nil},
             label: :optional,
             name: :datatype,
             tag: 4,
             type: {:message, PgQuery.TypeName}
           }}
        end

        def field_def("datatype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "datatype",
             kind: {:scalar, nil},
             label: :optional,
             name: :datatype,
             tag: 4,
             type: {:message, PgQuery.TypeName}
           }}
        end

        []
      ),
      (
        def field_def(:items) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "items",
             kind: :unpacked,
             label: :repeated,
             name: :items,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("items") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "items",
             kind: :unpacked,
             label: :repeated,
             name: :items,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:is_default) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isDefault",
             kind: {:scalar, false},
             label: :optional,
             name: :is_default,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("isDefault") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isDefault",
             kind: {:scalar, false},
             label: :optional,
             name: :is_default,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("is_default") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isDefault",
             kind: {:scalar, false},
             label: :optional,
             name: :is_default,
             tag: 6,
             type: :bool
           }}
        end
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
    def default(:opclassname) do
      {:error, :no_default_value}
    end,
    def default(:opfamilyname) do
      {:error, :no_default_value}
    end,
    def default(:amname) do
      {:ok, ""}
    end,
    def default(:datatype) do
      {:ok, nil}
    end,
    def default(:items) do
      {:error, :no_default_value}
    end,
    def default(:is_default) do
      {:ok, false}
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
