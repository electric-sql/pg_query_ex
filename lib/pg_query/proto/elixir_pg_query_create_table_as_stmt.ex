# credo:disable-for-this-file
defmodule PgQuery.CreateTableAsStmt do
  @moduledoc false
  defstruct query: nil,
            into: nil,
            objtype: :OBJECT_TYPE_UNDEFINED,
            is_select_into: false,
            if_not_exists: false

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
        |> encode_query(msg)
        |> encode_into(msg)
        |> encode_objtype(msg)
        |> encode_is_select_into(msg)
        |> encode_if_not_exists(msg)
      end
    )

    []

    [
      defp encode_query(acc, msg) do
        try do
          if msg.query == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.query)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:query, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_into(acc, msg) do
        try do
          if msg.into == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.into)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:into, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_objtype(acc, msg) do
        try do
          if msg.objtype == :OBJECT_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "\x18",
              msg.objtype |> PgQuery.ObjectType.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:objtype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_is_select_into(acc, msg) do
        try do
          if msg.is_select_into == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.is_select_into)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_select_into, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_if_not_exists(acc, msg) do
        try do
          if msg.if_not_exists == false do
            acc
          else
            [acc, "(", Protox.Encode.encode_bool(msg.if_not_exists)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:if_not_exists, "invalid field value"),
                    __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.CreateTableAsStmt))
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

              {[query: Protox.MergeMessage.merge(msg.query, PgQuery.Node.decode!(delimited))],
               rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[into: Protox.MergeMessage.merge(msg.into, PgQuery.IntoClause.decode!(delimited))],
               rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.ObjectType)
              {[objtype: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_select_into: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[if_not_exists: value], rest}

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
        PgQuery.CreateTableAsStmt,
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
        1 => {:query, {:scalar, nil}, {:message, PgQuery.Node}},
        2 => {:into, {:scalar, nil}, {:message, PgQuery.IntoClause}},
        3 => {:objtype, {:scalar, :OBJECT_TYPE_UNDEFINED}, {:enum, PgQuery.ObjectType}},
        4 => {:is_select_into, {:scalar, false}, :bool},
        5 => {:if_not_exists, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        if_not_exists: {5, {:scalar, false}, :bool},
        into: {2, {:scalar, nil}, {:message, PgQuery.IntoClause}},
        is_select_into: {4, {:scalar, false}, :bool},
        objtype: {3, {:scalar, :OBJECT_TYPE_UNDEFINED}, {:enum, PgQuery.ObjectType}},
        query: {1, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "query",
          kind: {:scalar, nil},
          label: :optional,
          name: :query,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "into",
          kind: {:scalar, nil},
          label: :optional,
          name: :into,
          tag: 2,
          type: {:message, PgQuery.IntoClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "objtype",
          kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
          label: :optional,
          name: :objtype,
          tag: 3,
          type: {:enum, PgQuery.ObjectType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "isSelectInto",
          kind: {:scalar, false},
          label: :optional,
          name: :is_select_into,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "ifNotExists",
          kind: {:scalar, false},
          label: :optional,
          name: :if_not_exists,
          tag: 5,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:query) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "query",
             kind: {:scalar, nil},
             label: :optional,
             name: :query,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("query") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "query",
             kind: {:scalar, nil},
             label: :optional,
             name: :query,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:into) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "into",
             kind: {:scalar, nil},
             label: :optional,
             name: :into,
             tag: 2,
             type: {:message, PgQuery.IntoClause}
           }}
        end

        def field_def("into") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "into",
             kind: {:scalar, nil},
             label: :optional,
             name: :into,
             tag: 2,
             type: {:message, PgQuery.IntoClause}
           }}
        end

        []
      ),
      (
        def field_def(:objtype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "objtype",
             kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
             label: :optional,
             name: :objtype,
             tag: 3,
             type: {:enum, PgQuery.ObjectType}
           }}
        end

        def field_def("objtype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "objtype",
             kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
             label: :optional,
             name: :objtype,
             tag: 3,
             type: {:enum, PgQuery.ObjectType}
           }}
        end

        []
      ),
      (
        def field_def(:is_select_into) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isSelectInto",
             kind: {:scalar, false},
             label: :optional,
             name: :is_select_into,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("isSelectInto") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isSelectInto",
             kind: {:scalar, false},
             label: :optional,
             name: :is_select_into,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("is_select_into") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isSelectInto",
             kind: {:scalar, false},
             label: :optional,
             name: :is_select_into,
             tag: 4,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:if_not_exists) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ifNotExists",
             kind: {:scalar, false},
             label: :optional,
             name: :if_not_exists,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("ifNotExists") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ifNotExists",
             kind: {:scalar, false},
             label: :optional,
             name: :if_not_exists,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("if_not_exists") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ifNotExists",
             kind: {:scalar, false},
             label: :optional,
             name: :if_not_exists,
             tag: 5,
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
    def default(:query) do
      {:ok, nil}
    end,
    def default(:into) do
      {:ok, nil}
    end,
    def default(:objtype) do
      {:ok, :OBJECT_TYPE_UNDEFINED}
    end,
    def default(:is_select_into) do
      {:ok, false}
    end,
    def default(:if_not_exists) do
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
