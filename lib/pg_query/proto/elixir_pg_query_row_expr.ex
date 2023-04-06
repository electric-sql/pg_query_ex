# credo:disable-for-this-file
defmodule PgQuery.RowExpr do
  @moduledoc false
  defstruct xpr: nil,
            args: [],
            row_typeid: 0,
            row_format: :COERCION_FORM_UNDEFINED,
            colnames: [],
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
        |> encode_args(msg)
        |> encode_row_typeid(msg)
        |> encode_row_format(msg)
        |> encode_colnames(msg)
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
      defp encode_args(acc, msg) do
        try do
          case msg.args do
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
            reraise Protox.EncodingError.new(:args, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_row_typeid(acc, msg) do
        try do
          if msg.row_typeid == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.row_typeid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:row_typeid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_row_format(acc, msg) do
        try do
          if msg.row_format == :COERCION_FORM_UNDEFINED do
            acc
          else
            [
              acc,
              " ",
              msg.row_format |> PgQuery.CoercionForm.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:row_format, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_colnames(acc, msg) do
        try do
          case msg.colnames do
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
            reraise Protox.EncodingError.new(:colnames, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_int32(msg.location)]
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
          parse_key_value(bytes, struct(PgQuery.RowExpr))
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
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[args: msg.args ++ [PgQuery.Node.decode!(delimited)]], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[row_typeid: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.CoercionForm)
              {[row_format: value], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[colnames: msg.colnames ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
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
        PgQuery.RowExpr,
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
        2 => {:args, :unpacked, {:message, PgQuery.Node}},
        3 => {:row_typeid, {:scalar, 0}, :uint32},
        4 => {:row_format, {:scalar, :COERCION_FORM_UNDEFINED}, {:enum, PgQuery.CoercionForm}},
        5 => {:colnames, :unpacked, {:message, PgQuery.Node}},
        6 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        args: {2, :unpacked, {:message, PgQuery.Node}},
        colnames: {5, :unpacked, {:message, PgQuery.Node}},
        location: {6, {:scalar, 0}, :int32},
        row_format: {4, {:scalar, :COERCION_FORM_UNDEFINED}, {:enum, PgQuery.CoercionForm}},
        row_typeid: {3, {:scalar, 0}, :uint32},
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
          json_name: "args",
          kind: :unpacked,
          label: :repeated,
          name: :args,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rowTypeid",
          kind: {:scalar, 0},
          label: :optional,
          name: :row_typeid,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "rowFormat",
          kind: {:scalar, :COERCION_FORM_UNDEFINED},
          label: :optional,
          name: :row_format,
          tag: 4,
          type: {:enum, PgQuery.CoercionForm}
        },
        %{
          __struct__: Protox.Field,
          json_name: "colnames",
          kind: :unpacked,
          label: :repeated,
          name: :colnames,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 6,
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
        def field_def(:args) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "args",
             kind: :unpacked,
             label: :repeated,
             name: :args,
             tag: 2,
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
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:row_typeid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowTypeid",
             kind: {:scalar, 0},
             label: :optional,
             name: :row_typeid,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("rowTypeid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowTypeid",
             kind: {:scalar, 0},
             label: :optional,
             name: :row_typeid,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("row_typeid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowTypeid",
             kind: {:scalar, 0},
             label: :optional,
             name: :row_typeid,
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:row_format) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowFormat",
             kind: {:scalar, :COERCION_FORM_UNDEFINED},
             label: :optional,
             name: :row_format,
             tag: 4,
             type: {:enum, PgQuery.CoercionForm}
           }}
        end

        def field_def("rowFormat") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowFormat",
             kind: {:scalar, :COERCION_FORM_UNDEFINED},
             label: :optional,
             name: :row_format,
             tag: 4,
             type: {:enum, PgQuery.CoercionForm}
           }}
        end

        def field_def("row_format") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowFormat",
             kind: {:scalar, :COERCION_FORM_UNDEFINED},
             label: :optional,
             name: :row_format,
             tag: 4,
             type: {:enum, PgQuery.CoercionForm}
           }}
        end
      ),
      (
        def field_def(:colnames) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colnames",
             kind: :unpacked,
             label: :repeated,
             name: :colnames,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("colnames") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colnames",
             kind: :unpacked,
             label: :repeated,
             name: :colnames,
             tag: 5,
             type: {:message, PgQuery.Node}
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
             tag: 6,
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
             tag: 6,
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
    def default(:args) do
      {:error, :no_default_value}
    end,
    def default(:row_typeid) do
      {:ok, 0}
    end,
    def default(:row_format) do
      {:ok, :COERCION_FORM_UNDEFINED}
    end,
    def default(:colnames) do
      {:error, :no_default_value}
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
