# credo:disable-for-this-file
defmodule PgQuery.AlterObjectDependsStmt do
  @moduledoc false
  defstruct object_type: :OBJECT_TYPE_UNDEFINED,
            relation: nil,
            object: nil,
            extname: nil,
            remove: false

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
        |> encode_object_type(msg)
        |> encode_relation(msg)
        |> encode_object(msg)
        |> encode_extname(msg)
        |> encode_remove(msg)
      end
    )

    []

    [
      defp encode_object_type(acc, msg) do
        try do
          if msg.object_type == :OBJECT_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "\b",
              msg.object_type |> PgQuery.ObjectType.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:object_type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_relation(acc, msg) do
        try do
          if msg.relation == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.relation)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:relation, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_object(acc, msg) do
        try do
          if msg.object == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.object)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:object, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_extname(acc, msg) do
        try do
          if msg.extname == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.extname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:extname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_remove(acc, msg) do
        try do
          if msg.remove == false do
            acc
          else
            [acc, "(", Protox.Encode.encode_bool(msg.remove)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:remove, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.AlterObjectDependsStmt))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.ObjectType)
              {[object_type: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 relation:
                   Protox.MergeMessage.merge(msg.relation, PgQuery.RangeVar.decode!(delimited))
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[object: Protox.MergeMessage.merge(msg.object, PgQuery.Node.decode!(delimited))],
               rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 extname:
                   Protox.MergeMessage.merge(msg.extname, PgQuery.String.decode!(delimited))
               ], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[remove: value], rest}

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
        PgQuery.AlterObjectDependsStmt,
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
        1 => {:object_type, {:scalar, :OBJECT_TYPE_UNDEFINED}, {:enum, PgQuery.ObjectType}},
        2 => {:relation, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        3 => {:object, {:scalar, nil}, {:message, PgQuery.Node}},
        4 => {:extname, {:scalar, nil}, {:message, PgQuery.String}},
        5 => {:remove, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        extname: {4, {:scalar, nil}, {:message, PgQuery.String}},
        object: {3, {:scalar, nil}, {:message, PgQuery.Node}},
        object_type: {1, {:scalar, :OBJECT_TYPE_UNDEFINED}, {:enum, PgQuery.ObjectType}},
        relation: {2, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        remove: {5, {:scalar, false}, :bool}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "objectType",
          kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
          label: :optional,
          name: :object_type,
          tag: 1,
          type: {:enum, PgQuery.ObjectType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "relation",
          kind: {:scalar, nil},
          label: :optional,
          name: :relation,
          tag: 2,
          type: {:message, PgQuery.RangeVar}
        },
        %{
          __struct__: Protox.Field,
          json_name: "object",
          kind: {:scalar, nil},
          label: :optional,
          name: :object,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "extname",
          kind: {:scalar, nil},
          label: :optional,
          name: :extname,
          tag: 4,
          type: {:message, PgQuery.String}
        },
        %{
          __struct__: Protox.Field,
          json_name: "remove",
          kind: {:scalar, false},
          label: :optional,
          name: :remove,
          tag: 5,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:object_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "objectType",
             kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
             label: :optional,
             name: :object_type,
             tag: 1,
             type: {:enum, PgQuery.ObjectType}
           }}
        end

        def field_def("objectType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "objectType",
             kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
             label: :optional,
             name: :object_type,
             tag: 1,
             type: {:enum, PgQuery.ObjectType}
           }}
        end

        def field_def("object_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "objectType",
             kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
             label: :optional,
             name: :object_type,
             tag: 1,
             type: {:enum, PgQuery.ObjectType}
           }}
        end
      ),
      (
        def field_def(:relation) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relation",
             kind: {:scalar, nil},
             label: :optional,
             name: :relation,
             tag: 2,
             type: {:message, PgQuery.RangeVar}
           }}
        end

        def field_def("relation") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relation",
             kind: {:scalar, nil},
             label: :optional,
             name: :relation,
             tag: 2,
             type: {:message, PgQuery.RangeVar}
           }}
        end

        []
      ),
      (
        def field_def(:object) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "object",
             kind: {:scalar, nil},
             label: :optional,
             name: :object,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("object") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "object",
             kind: {:scalar, nil},
             label: :optional,
             name: :object,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:extname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "extname",
             kind: {:scalar, nil},
             label: :optional,
             name: :extname,
             tag: 4,
             type: {:message, PgQuery.String}
           }}
        end

        def field_def("extname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "extname",
             kind: {:scalar, nil},
             label: :optional,
             name: :extname,
             tag: 4,
             type: {:message, PgQuery.String}
           }}
        end

        []
      ),
      (
        def field_def(:remove) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "remove",
             kind: {:scalar, false},
             label: :optional,
             name: :remove,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("remove") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "remove",
             kind: {:scalar, false},
             label: :optional,
             name: :remove,
             tag: 5,
             type: :bool
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
    def default(:object_type) do
      {:ok, :OBJECT_TYPE_UNDEFINED}
    end,
    def default(:relation) do
      {:ok, nil}
    end,
    def default(:object) do
      {:ok, nil}
    end,
    def default(:extname) do
      {:ok, nil}
    end,
    def default(:remove) do
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
