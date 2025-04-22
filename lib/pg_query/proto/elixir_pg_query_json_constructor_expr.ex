# credo:disable-for-this-file
defmodule PgQuery.JsonConstructorExpr do
  @moduledoc false
  defstruct xpr: nil,
            type: :JSON_CONSTRUCTOR_TYPE_UNDEFINED,
            args: [],
            func: nil,
            coercion: nil,
            returning: nil,
            absent_on_null: false,
            unique: false,
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
        |> encode_type(msg)
        |> encode_args(msg)
        |> encode_func(msg)
        |> encode_coercion(msg)
        |> encode_returning(msg)
        |> encode_absent_on_null(msg)
        |> encode_unique(msg)
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
      defp encode_type(acc, msg) do
        try do
          if msg.type == :JSON_CONSTRUCTOR_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "\x10",
              msg.type |> PgQuery.JsonConstructorType.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:type, "invalid field value"), __STACKTRACE__
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
                  [acc, "\x1A", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:args, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_func(acc, msg) do
        try do
          if msg.func == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.func)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:func, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_coercion(acc, msg) do
        try do
          if msg.coercion == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.coercion)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:coercion, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_returning(acc, msg) do
        try do
          if msg.returning == nil do
            acc
          else
            [acc, "2", Protox.Encode.encode_message(msg.returning)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:returning, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_absent_on_null(acc, msg) do
        try do
          if msg.absent_on_null == false do
            acc
          else
            [acc, "8", Protox.Encode.encode_bool(msg.absent_on_null)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:absent_on_null, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_unique(acc, msg) do
        try do
          if msg.unique == false do
            acc
          else
            [acc, "@", Protox.Encode.encode_bool(msg.unique)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:unique, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "H", Protox.Encode.encode_int32(msg.location)]
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
          parse_key_value(bytes, struct(PgQuery.JsonConstructorExpr))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.JsonConstructorType)
              {[type: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[args: msg.args ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[func: Protox.MergeMessage.merge(msg.func, PgQuery.Node.decode!(delimited))], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 coercion:
                   Protox.MergeMessage.merge(msg.coercion, PgQuery.Node.decode!(delimited))
               ], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 returning:
                   Protox.MergeMessage.merge(
                     msg.returning,
                     PgQuery.JsonReturning.decode!(delimited)
                   )
               ], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[absent_on_null: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[unique: value], rest}

            {9, _, bytes} ->
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
        PgQuery.JsonConstructorExpr,
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
        2 =>
          {:type, {:scalar, :JSON_CONSTRUCTOR_TYPE_UNDEFINED},
           {:enum, PgQuery.JsonConstructorType}},
        3 => {:args, :unpacked, {:message, PgQuery.Node}},
        4 => {:func, {:scalar, nil}, {:message, PgQuery.Node}},
        5 => {:coercion, {:scalar, nil}, {:message, PgQuery.Node}},
        6 => {:returning, {:scalar, nil}, {:message, PgQuery.JsonReturning}},
        7 => {:absent_on_null, {:scalar, false}, :bool},
        8 => {:unique, {:scalar, false}, :bool},
        9 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        absent_on_null: {7, {:scalar, false}, :bool},
        args: {3, :unpacked, {:message, PgQuery.Node}},
        coercion: {5, {:scalar, nil}, {:message, PgQuery.Node}},
        func: {4, {:scalar, nil}, {:message, PgQuery.Node}},
        location: {9, {:scalar, 0}, :int32},
        returning: {6, {:scalar, nil}, {:message, PgQuery.JsonReturning}},
        type:
          {2, {:scalar, :JSON_CONSTRUCTOR_TYPE_UNDEFINED}, {:enum, PgQuery.JsonConstructorType}},
        unique: {8, {:scalar, false}, :bool},
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
          json_name: "type",
          kind: {:scalar, :JSON_CONSTRUCTOR_TYPE_UNDEFINED},
          label: :optional,
          name: :type,
          tag: 2,
          type: {:enum, PgQuery.JsonConstructorType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "args",
          kind: :unpacked,
          label: :repeated,
          name: :args,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "func",
          kind: {:scalar, nil},
          label: :optional,
          name: :func,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "coercion",
          kind: {:scalar, nil},
          label: :optional,
          name: :coercion,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "returning",
          kind: {:scalar, nil},
          label: :optional,
          name: :returning,
          tag: 6,
          type: {:message, PgQuery.JsonReturning}
        },
        %{
          __struct__: Protox.Field,
          json_name: "absentOnNull",
          kind: {:scalar, false},
          label: :optional,
          name: :absent_on_null,
          tag: 7,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "unique",
          kind: {:scalar, false},
          label: :optional,
          name: :unique,
          tag: 8,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 9,
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
        def field_def(:type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, :JSON_CONSTRUCTOR_TYPE_UNDEFINED},
             label: :optional,
             name: :type,
             tag: 2,
             type: {:enum, PgQuery.JsonConstructorType}
           }}
        end

        def field_def("type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, :JSON_CONSTRUCTOR_TYPE_UNDEFINED},
             label: :optional,
             name: :type,
             tag: 2,
             type: {:enum, PgQuery.JsonConstructorType}
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
             tag: 3,
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
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:func) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "func",
             kind: {:scalar, nil},
             label: :optional,
             name: :func,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("func") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "func",
             kind: {:scalar, nil},
             label: :optional,
             name: :func,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:coercion) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coercion",
             kind: {:scalar, nil},
             label: :optional,
             name: :coercion,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("coercion") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coercion",
             kind: {:scalar, nil},
             label: :optional,
             name: :coercion,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:returning) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returning",
             kind: {:scalar, nil},
             label: :optional,
             name: :returning,
             tag: 6,
             type: {:message, PgQuery.JsonReturning}
           }}
        end

        def field_def("returning") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returning",
             kind: {:scalar, nil},
             label: :optional,
             name: :returning,
             tag: 6,
             type: {:message, PgQuery.JsonReturning}
           }}
        end

        []
      ),
      (
        def field_def(:absent_on_null) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "absentOnNull",
             kind: {:scalar, false},
             label: :optional,
             name: :absent_on_null,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("absentOnNull") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "absentOnNull",
             kind: {:scalar, false},
             label: :optional,
             name: :absent_on_null,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("absent_on_null") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "absentOnNull",
             kind: {:scalar, false},
             label: :optional,
             name: :absent_on_null,
             tag: 7,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:unique) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "unique",
             kind: {:scalar, false},
             label: :optional,
             name: :unique,
             tag: 8,
             type: :bool
           }}
        end

        def field_def("unique") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "unique",
             kind: {:scalar, false},
             label: :optional,
             name: :unique,
             tag: 8,
             type: :bool
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
             tag: 9,
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
             tag: 9,
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
    def default(:type) do
      {:ok, :JSON_CONSTRUCTOR_TYPE_UNDEFINED}
    end,
    def default(:args) do
      {:error, :no_default_value}
    end,
    def default(:func) do
      {:ok, nil}
    end,
    def default(:coercion) do
      {:ok, nil}
    end,
    def default(:returning) do
      {:ok, nil}
    end,
    def default(:absent_on_null) do
      {:ok, false}
    end,
    def default(:unique) do
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
