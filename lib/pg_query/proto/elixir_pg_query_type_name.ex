# credo:disable-for-this-file
defmodule PgQuery.TypeName do
  @moduledoc false
  defstruct names: [],
            type_oid: 0,
            setof: false,
            pct_type: false,
            typmods: [],
            typemod: 0,
            array_bounds: [],
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
        |> encode_names(msg)
        |> encode_type_oid(msg)
        |> encode_setof(msg)
        |> encode_pct_type(msg)
        |> encode_typmods(msg)
        |> encode_typemod(msg)
        |> encode_array_bounds(msg)
        |> encode_location(msg)
      end
    )

    []

    [
      defp encode_names(acc, msg) do
        try do
          case msg.names do
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
            reraise Protox.EncodingError.new(:names, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_type_oid(acc, msg) do
        try do
          if msg.type_oid == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.type_oid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:type_oid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_setof(acc, msg) do
        try do
          if msg.setof == false do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_bool(msg.setof)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:setof, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_pct_type(acc, msg) do
        try do
          if msg.pct_type == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.pct_type)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:pct_type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_typmods(acc, msg) do
        try do
          case msg.typmods do
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
            reraise Protox.EncodingError.new(:typmods, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_typemod(acc, msg) do
        try do
          if msg.typemod == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_int32(msg.typemod)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:typemod, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_array_bounds(acc, msg) do
        try do
          case msg.array_bounds do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, ":", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:array_bounds, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "@", Protox.Encode.encode_int32(msg.location)]
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
          parse_key_value(bytes, struct(PgQuery.TypeName))
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
              {[names: msg.names ++ [PgQuery.Node.decode!(delimited)]], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[type_oid: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[setof: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[pct_type: value], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[typmods: msg.typmods ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[typemod: value], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[array_bounds: msg.array_bounds ++ [PgQuery.Node.decode!(delimited)]], rest}

            {8, _, bytes} ->
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
        PgQuery.TypeName,
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
        1 => {:names, :unpacked, {:message, PgQuery.Node}},
        2 => {:type_oid, {:scalar, 0}, :uint32},
        3 => {:setof, {:scalar, false}, :bool},
        4 => {:pct_type, {:scalar, false}, :bool},
        5 => {:typmods, :unpacked, {:message, PgQuery.Node}},
        6 => {:typemod, {:scalar, 0}, :int32},
        7 => {:array_bounds, :unpacked, {:message, PgQuery.Node}},
        8 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        array_bounds: {7, :unpacked, {:message, PgQuery.Node}},
        location: {8, {:scalar, 0}, :int32},
        names: {1, :unpacked, {:message, PgQuery.Node}},
        pct_type: {4, {:scalar, false}, :bool},
        setof: {3, {:scalar, false}, :bool},
        type_oid: {2, {:scalar, 0}, :uint32},
        typemod: {6, {:scalar, 0}, :int32},
        typmods: {5, :unpacked, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "names",
          kind: :unpacked,
          label: :repeated,
          name: :names,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "typeOid",
          kind: {:scalar, 0},
          label: :optional,
          name: :type_oid,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "setof",
          kind: {:scalar, false},
          label: :optional,
          name: :setof,
          tag: 3,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "pctType",
          kind: {:scalar, false},
          label: :optional,
          name: :pct_type,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "typmods",
          kind: :unpacked,
          label: :repeated,
          name: :typmods,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "typemod",
          kind: {:scalar, 0},
          label: :optional,
          name: :typemod,
          tag: 6,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "arrayBounds",
          kind: :unpacked,
          label: :repeated,
          name: :array_bounds,
          tag: 7,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 8,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:names) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "names",
             kind: :unpacked,
             label: :repeated,
             name: :names,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("names") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "names",
             kind: :unpacked,
             label: :repeated,
             name: :names,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:type_oid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeOid",
             kind: {:scalar, 0},
             label: :optional,
             name: :type_oid,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("typeOid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeOid",
             kind: {:scalar, 0},
             label: :optional,
             name: :type_oid,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("type_oid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeOid",
             kind: {:scalar, 0},
             label: :optional,
             name: :type_oid,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:setof) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "setof",
             kind: {:scalar, false},
             label: :optional,
             name: :setof,
             tag: 3,
             type: :bool
           }}
        end

        def field_def("setof") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "setof",
             kind: {:scalar, false},
             label: :optional,
             name: :setof,
             tag: 3,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:pct_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pctType",
             kind: {:scalar, false},
             label: :optional,
             name: :pct_type,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("pctType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pctType",
             kind: {:scalar, false},
             label: :optional,
             name: :pct_type,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("pct_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pctType",
             kind: {:scalar, false},
             label: :optional,
             name: :pct_type,
             tag: 4,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:typmods) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typmods",
             kind: :unpacked,
             label: :repeated,
             name: :typmods,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("typmods") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typmods",
             kind: :unpacked,
             label: :repeated,
             name: :typmods,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:typemod) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typemod",
             kind: {:scalar, 0},
             label: :optional,
             name: :typemod,
             tag: 6,
             type: :int32
           }}
        end

        def field_def("typemod") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typemod",
             kind: {:scalar, 0},
             label: :optional,
             name: :typemod,
             tag: 6,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:array_bounds) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arrayBounds",
             kind: :unpacked,
             label: :repeated,
             name: :array_bounds,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("arrayBounds") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arrayBounds",
             kind: :unpacked,
             label: :repeated,
             name: :array_bounds,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("array_bounds") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arrayBounds",
             kind: :unpacked,
             label: :repeated,
             name: :array_bounds,
             tag: 7,
             type: {:message, PgQuery.Node}
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
             tag: 8,
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
             tag: 8,
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
    def default(:names) do
      {:error, :no_default_value}
    end,
    def default(:type_oid) do
      {:ok, 0}
    end,
    def default(:setof) do
      {:ok, false}
    end,
    def default(:pct_type) do
      {:ok, false}
    end,
    def default(:typmods) do
      {:error, :no_default_value}
    end,
    def default(:typemod) do
      {:ok, 0}
    end,
    def default(:array_bounds) do
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
