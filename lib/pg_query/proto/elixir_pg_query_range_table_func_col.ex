# credo:disable-for-this-file
defmodule PgQuery.RangeTableFuncCol do
  @moduledoc false
  defstruct colname: "",
            type_name: nil,
            for_ordinality: false,
            is_not_null: false,
            colexpr: nil,
            coldefexpr: nil,
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
        |> encode_colname(msg)
        |> encode_type_name(msg)
        |> encode_for_ordinality(msg)
        |> encode_is_not_null(msg)
        |> encode_colexpr(msg)
        |> encode_coldefexpr(msg)
        |> encode_location(msg)
      end
    )

    []

    [
      defp encode_colname(acc, msg) do
        try do
          if msg.colname == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.colname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:colname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_type_name(acc, msg) do
        try do
          if msg.type_name == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.type_name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:type_name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_for_ordinality(acc, msg) do
        try do
          if msg.for_ordinality == false do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_bool(msg.for_ordinality)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:for_ordinality, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_is_not_null(acc, msg) do
        try do
          if msg.is_not_null == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.is_not_null)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_not_null, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_colexpr(acc, msg) do
        try do
          if msg.colexpr == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.colexpr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:colexpr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_coldefexpr(acc, msg) do
        try do
          if msg.coldefexpr == nil do
            acc
          else
            [acc, "2", Protox.Encode.encode_message(msg.coldefexpr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:coldefexpr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "8", Protox.Encode.encode_int32(msg.location)]
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
          parse_key_value(bytes, struct(PgQuery.RangeTableFuncCol))
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
              {[colname: delimited], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 type_name:
                   Protox.MergeMessage.merge(msg.type_name, PgQuery.TypeName.decode!(delimited))
               ], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[for_ordinality: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_not_null: value], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[colexpr: Protox.MergeMessage.merge(msg.colexpr, PgQuery.Node.decode!(delimited))],
               rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 coldefexpr:
                   Protox.MergeMessage.merge(msg.coldefexpr, PgQuery.Node.decode!(delimited))
               ], rest}

            {7, _, bytes} ->
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
        PgQuery.RangeTableFuncCol,
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
        1 => {:colname, {:scalar, ""}, :string},
        2 => {:type_name, {:scalar, nil}, {:message, PgQuery.TypeName}},
        3 => {:for_ordinality, {:scalar, false}, :bool},
        4 => {:is_not_null, {:scalar, false}, :bool},
        5 => {:colexpr, {:scalar, nil}, {:message, PgQuery.Node}},
        6 => {:coldefexpr, {:scalar, nil}, {:message, PgQuery.Node}},
        7 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        coldefexpr: {6, {:scalar, nil}, {:message, PgQuery.Node}},
        colexpr: {5, {:scalar, nil}, {:message, PgQuery.Node}},
        colname: {1, {:scalar, ""}, :string},
        for_ordinality: {3, {:scalar, false}, :bool},
        is_not_null: {4, {:scalar, false}, :bool},
        location: {7, {:scalar, 0}, :int32},
        type_name: {2, {:scalar, nil}, {:message, PgQuery.TypeName}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "colname",
          kind: {:scalar, ""},
          label: :optional,
          name: :colname,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "typeName",
          kind: {:scalar, nil},
          label: :optional,
          name: :type_name,
          tag: 2,
          type: {:message, PgQuery.TypeName}
        },
        %{
          __struct__: Protox.Field,
          json_name: "forOrdinality",
          kind: {:scalar, false},
          label: :optional,
          name: :for_ordinality,
          tag: 3,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "isNotNull",
          kind: {:scalar, false},
          label: :optional,
          name: :is_not_null,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "colexpr",
          kind: {:scalar, nil},
          label: :optional,
          name: :colexpr,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "coldefexpr",
          kind: {:scalar, nil},
          label: :optional,
          name: :coldefexpr,
          tag: 6,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 7,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:colname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colname",
             kind: {:scalar, ""},
             label: :optional,
             name: :colname,
             tag: 1,
             type: :string
           }}
        end

        def field_def("colname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colname",
             kind: {:scalar, ""},
             label: :optional,
             name: :colname,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:type_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeName",
             kind: {:scalar, nil},
             label: :optional,
             name: :type_name,
             tag: 2,
             type: {:message, PgQuery.TypeName}
           }}
        end

        def field_def("typeName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeName",
             kind: {:scalar, nil},
             label: :optional,
             name: :type_name,
             tag: 2,
             type: {:message, PgQuery.TypeName}
           }}
        end

        def field_def("type_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeName",
             kind: {:scalar, nil},
             label: :optional,
             name: :type_name,
             tag: 2,
             type: {:message, PgQuery.TypeName}
           }}
        end
      ),
      (
        def field_def(:for_ordinality) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "forOrdinality",
             kind: {:scalar, false},
             label: :optional,
             name: :for_ordinality,
             tag: 3,
             type: :bool
           }}
        end

        def field_def("forOrdinality") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "forOrdinality",
             kind: {:scalar, false},
             label: :optional,
             name: :for_ordinality,
             tag: 3,
             type: :bool
           }}
        end

        def field_def("for_ordinality") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "forOrdinality",
             kind: {:scalar, false},
             label: :optional,
             name: :for_ordinality,
             tag: 3,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:is_not_null) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isNotNull",
             kind: {:scalar, false},
             label: :optional,
             name: :is_not_null,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("isNotNull") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isNotNull",
             kind: {:scalar, false},
             label: :optional,
             name: :is_not_null,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("is_not_null") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isNotNull",
             kind: {:scalar, false},
             label: :optional,
             name: :is_not_null,
             tag: 4,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:colexpr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colexpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :colexpr,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("colexpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colexpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :colexpr,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:coldefexpr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coldefexpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :coldefexpr,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("coldefexpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coldefexpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :coldefexpr,
             tag: 6,
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
             tag: 7,
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
             tag: 7,
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
    def default(:colname) do
      {:ok, ""}
    end,
    def default(:type_name) do
      {:ok, nil}
    end,
    def default(:for_ordinality) do
      {:ok, false}
    end,
    def default(:is_not_null) do
      {:ok, false}
    end,
    def default(:colexpr) do
      {:ok, nil}
    end,
    def default(:coldefexpr) do
      {:ok, nil}
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
