# credo:disable-for-this-file
defmodule PgQuery.CaseTestExpr do
  @moduledoc false
  defstruct xpr: nil, type_id: 0, type_mod: 0, collation: 0

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
        |> encode_type_id(msg)
        |> encode_type_mod(msg)
        |> encode_collation(msg)
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
      defp encode_type_id(acc, msg) do
        try do
          if msg.type_id == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.type_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:type_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_type_mod(acc, msg) do
        try do
          if msg.type_mod == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_int32(msg.type_mod)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:type_mod, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_collation(acc, msg) do
        try do
          if msg.collation == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.collation)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:collation, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.CaseTestExpr))
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
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[type_id: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[type_mod: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[collation: value], rest}

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
        PgQuery.CaseTestExpr,
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
        2 => {:type_id, {:scalar, 0}, :uint32},
        3 => {:type_mod, {:scalar, 0}, :int32},
        4 => {:collation, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        collation: {4, {:scalar, 0}, :uint32},
        type_id: {2, {:scalar, 0}, :uint32},
        type_mod: {3, {:scalar, 0}, :int32},
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
          json_name: "typeId",
          kind: {:scalar, 0},
          label: :optional,
          name: :type_id,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "typeMod",
          kind: {:scalar, 0},
          label: :optional,
          name: :type_mod,
          tag: 3,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "collation",
          kind: {:scalar, 0},
          label: :optional,
          name: :collation,
          tag: 4,
          type: :uint32
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
        def field_def(:type_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeId",
             kind: {:scalar, 0},
             label: :optional,
             name: :type_id,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("typeId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeId",
             kind: {:scalar, 0},
             label: :optional,
             name: :type_id,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("type_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeId",
             kind: {:scalar, 0},
             label: :optional,
             name: :type_id,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:type_mod) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeMod",
             kind: {:scalar, 0},
             label: :optional,
             name: :type_mod,
             tag: 3,
             type: :int32
           }}
        end

        def field_def("typeMod") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeMod",
             kind: {:scalar, 0},
             label: :optional,
             name: :type_mod,
             tag: 3,
             type: :int32
           }}
        end

        def field_def("type_mod") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeMod",
             kind: {:scalar, 0},
             label: :optional,
             name: :type_mod,
             tag: 3,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:collation) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collation",
             kind: {:scalar, 0},
             label: :optional,
             name: :collation,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("collation") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collation",
             kind: {:scalar, 0},
             label: :optional,
             name: :collation,
             tag: 4,
             type: :uint32
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
    def default(:type_id) do
      {:ok, 0}
    end,
    def default(:type_mod) do
      {:ok, 0}
    end,
    def default(:collation) do
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
