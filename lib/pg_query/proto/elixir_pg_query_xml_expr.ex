# credo:disable-for-this-file
defmodule PgQuery.XmlExpr do
  @moduledoc false
  defstruct xpr: nil,
            op: :XML_EXPR_OP_UNDEFINED,
            name: "",
            named_args: [],
            arg_names: [],
            args: [],
            xmloption: :XML_OPTION_TYPE_UNDEFINED,
            type: 0,
            typmod: 0,
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
        |> encode_xpr(msg)
        |> encode_op(msg)
        |> encode_name(msg)
        |> encode_named_args(msg)
        |> encode_arg_names(msg)
        |> encode_args(msg)
        |> encode_xmloption(msg)
        |> encode_type(msg)
        |> encode_typmod(msg)
        |> encode_location(msg)
      end
    )

    []

    [
      defp encode_xpr(acc, msg) do
        try do
          if msg.xpr == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.xpr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:xpr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_op(acc, msg) do
        try do
          if msg.op == :XML_EXPR_OP_UNDEFINED do
            acc
          else
            [acc, "\x10", msg.op |> PgQuery.XmlExprOp.encode() |> Protox.Encode.encode_enum()]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:op, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_name(acc, msg) do
        try do
          if msg.name == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_named_args(acc, msg) do
        try do
          case msg.named_args do
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
            reraise Protox.EncodingError.new(:named_args, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_arg_names(acc, msg) do
        try do
          case msg.arg_names do
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
            reraise Protox.EncodingError.new(:arg_names, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_args(acc, msg) do
        try do
          case msg.args do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "2", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:args, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_xmloption(acc, msg) do
        try do
          if msg.xmloption == :XML_OPTION_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "8",
              msg.xmloption |> PgQuery.XmlOptionType.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:xmloption, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_type(acc, msg) do
        try do
          if msg.type == 0 do
            acc
          else
            [acc, "@", Protox.Encode.encode_uint32(msg.type)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_typmod(acc, msg) do
        try do
          if msg.typmod == 0 do
            acc
          else
            [acc, "H", Protox.Encode.encode_int32(msg.typmod)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:typmod, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "P", Protox.Encode.encode_int32(msg.location)]
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
          parse_key_value(bytes, struct(PgQuery.XmlExpr))
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
              {[xpr: Protox.MergeMessage.merge(msg.xpr, PgQuery.Node.decode!(delimited))], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.XmlExprOp)
              {[op: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[name: delimited], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[named_args: msg.named_args ++ [PgQuery.Node.decode!(delimited)]], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[arg_names: msg.arg_names ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[args: msg.args ++ [PgQuery.Node.decode!(delimited)]], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.XmlOptionType)
              {[xmloption: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[type: value], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[typmod: value], rest}

            {10, _, bytes} ->
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
        PgQuery.XmlExpr,
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
        1 => {:xpr, {:scalar, nil}, {:message, PgQuery.Node}},
        2 => {:op, {:scalar, :XML_EXPR_OP_UNDEFINED}, {:enum, PgQuery.XmlExprOp}},
        3 => {:name, {:scalar, ""}, :string},
        4 => {:named_args, :unpacked, {:message, PgQuery.Node}},
        5 => {:arg_names, :unpacked, {:message, PgQuery.Node}},
        6 => {:args, :unpacked, {:message, PgQuery.Node}},
        7 => {:xmloption, {:scalar, :XML_OPTION_TYPE_UNDEFINED}, {:enum, PgQuery.XmlOptionType}},
        8 => {:type, {:scalar, 0}, :uint32},
        9 => {:typmod, {:scalar, 0}, :int32},
        10 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        arg_names: {5, :unpacked, {:message, PgQuery.Node}},
        args: {6, :unpacked, {:message, PgQuery.Node}},
        location: {10, {:scalar, 0}, :int32},
        name: {3, {:scalar, ""}, :string},
        named_args: {4, :unpacked, {:message, PgQuery.Node}},
        op: {2, {:scalar, :XML_EXPR_OP_UNDEFINED}, {:enum, PgQuery.XmlExprOp}},
        type: {8, {:scalar, 0}, :uint32},
        typmod: {9, {:scalar, 0}, :int32},
        xmloption: {7, {:scalar, :XML_OPTION_TYPE_UNDEFINED}, {:enum, PgQuery.XmlOptionType}},
        xpr: {1, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "xpr",
          kind: {:scalar, nil},
          label: :optional,
          name: :xpr,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "op",
          kind: {:scalar, :XML_EXPR_OP_UNDEFINED},
          label: :optional,
          name: :op,
          tag: 2,
          type: {:enum, PgQuery.XmlExprOp}
        },
        %{
          __struct__: Protox.Field,
          json_name: "name",
          kind: {:scalar, ""},
          label: :optional,
          name: :name,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "namedArgs",
          kind: :unpacked,
          label: :repeated,
          name: :named_args,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "argNames",
          kind: :unpacked,
          label: :repeated,
          name: :arg_names,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "args",
          kind: :unpacked,
          label: :repeated,
          name: :args,
          tag: 6,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "xmloption",
          kind: {:scalar, :XML_OPTION_TYPE_UNDEFINED},
          label: :optional,
          name: :xmloption,
          tag: 7,
          type: {:enum, PgQuery.XmlOptionType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "type",
          kind: {:scalar, 0},
          label: :optional,
          name: :type,
          tag: 8,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "typmod",
          kind: {:scalar, 0},
          label: :optional,
          name: :typmod,
          tag: 9,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 10,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:xpr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :xpr,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("xpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :xpr,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:op) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "op",
             kind: {:scalar, :XML_EXPR_OP_UNDEFINED},
             label: :optional,
             name: :op,
             tag: 2,
             type: {:enum, PgQuery.XmlExprOp}
           }}
        end

        def field_def("op") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "op",
             kind: {:scalar, :XML_EXPR_OP_UNDEFINED},
             label: :optional,
             name: :op,
             tag: 2,
             type: {:enum, PgQuery.XmlExprOp}
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
             kind: {:scalar, ""},
             label: :optional,
             name: :name,
             tag: 3,
             type: :string
           }}
        end

        def field_def("name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, ""},
             label: :optional,
             name: :name,
             tag: 3,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:named_args) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "namedArgs",
             kind: :unpacked,
             label: :repeated,
             name: :named_args,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("namedArgs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "namedArgs",
             kind: :unpacked,
             label: :repeated,
             name: :named_args,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("named_args") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "namedArgs",
             kind: :unpacked,
             label: :repeated,
             name: :named_args,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:arg_names) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "argNames",
             kind: :unpacked,
             label: :repeated,
             name: :arg_names,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("argNames") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "argNames",
             kind: :unpacked,
             label: :repeated,
             name: :arg_names,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("arg_names") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "argNames",
             kind: :unpacked,
             label: :repeated,
             name: :arg_names,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:args) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "args",
             kind: :unpacked,
             label: :repeated,
             name: :args,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("args") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "args",
             kind: :unpacked,
             label: :repeated,
             name: :args,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:xmloption) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xmloption",
             kind: {:scalar, :XML_OPTION_TYPE_UNDEFINED},
             label: :optional,
             name: :xmloption,
             tag: 7,
             type: {:enum, PgQuery.XmlOptionType}
           }}
        end

        def field_def("xmloption") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xmloption",
             kind: {:scalar, :XML_OPTION_TYPE_UNDEFINED},
             label: :optional,
             name: :xmloption,
             tag: 7,
             type: {:enum, PgQuery.XmlOptionType}
           }}
        end

        []
      ),
      (
        def field_def(:type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, 0},
             label: :optional,
             name: :type,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, 0},
             label: :optional,
             name: :type,
             tag: 8,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:typmod) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typmod",
             kind: {:scalar, 0},
             label: :optional,
             name: :typmod,
             tag: 9,
             type: :int32
           }}
        end

        def field_def("typmod") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typmod",
             kind: {:scalar, 0},
             label: :optional,
             name: :typmod,
             tag: 9,
             type: :int32
           }}
        end

        []
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
             tag: 10,
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
             tag: 10,
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
    def default(:xpr) do
      {:ok, nil}
    end,
    def default(:op) do
      {:ok, :XML_EXPR_OP_UNDEFINED}
    end,
    def default(:name) do
      {:ok, ""}
    end,
    def default(:named_args) do
      {:error, :no_default_value}
    end,
    def default(:arg_names) do
      {:error, :no_default_value}
    end,
    def default(:args) do
      {:error, :no_default_value}
    end,
    def default(:xmloption) do
      {:ok, :XML_OPTION_TYPE_UNDEFINED}
    end,
    def default(:type) do
      {:ok, 0}
    end,
    def default(:typmod) do
      {:ok, 0}
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
