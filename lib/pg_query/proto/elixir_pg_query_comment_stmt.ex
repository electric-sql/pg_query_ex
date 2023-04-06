# credo:disable-for-this-file
defmodule PgQuery.CommentStmt do
  @moduledoc false
  defstruct objtype: :OBJECT_TYPE_UNDEFINED, object: nil, comment: ""

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
        [] |> encode_objtype(msg) |> encode_object(msg) |> encode_comment(msg)
      end
    )

    []

    [
      defp encode_objtype(acc, msg) do
        try do
          if msg.objtype == :OBJECT_TYPE_UNDEFINED do
            acc
          else
            [acc, "\b", msg.objtype |> PgQuery.ObjectType.encode() |> Protox.Encode.encode_enum()]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:objtype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_object(acc, msg) do
        try do
          if msg.object == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.object)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:object, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_comment(acc, msg) do
        try do
          if msg.comment == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.comment)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:comment, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.CommentStmt))
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
              {[objtype: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[object: Protox.MergeMessage.merge(msg.object, PgQuery.Node.decode!(delimited))],
               rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[comment: delimited], rest}

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
        PgQuery.CommentStmt,
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
        1 => {:objtype, {:scalar, :OBJECT_TYPE_UNDEFINED}, {:enum, PgQuery.ObjectType}},
        2 => {:object, {:scalar, nil}, {:message, PgQuery.Node}},
        3 => {:comment, {:scalar, ""}, :string}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        comment: {3, {:scalar, ""}, :string},
        object: {2, {:scalar, nil}, {:message, PgQuery.Node}},
        objtype: {1, {:scalar, :OBJECT_TYPE_UNDEFINED}, {:enum, PgQuery.ObjectType}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "objtype",
          kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
          label: :optional,
          name: :objtype,
          tag: 1,
          type: {:enum, PgQuery.ObjectType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "object",
          kind: {:scalar, nil},
          label: :optional,
          name: :object,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "comment",
          kind: {:scalar, ""},
          label: :optional,
          name: :comment,
          tag: 3,
          type: :string
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:objtype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "objtype",
             kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
             label: :optional,
             name: :objtype,
             tag: 1,
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
             tag: 1,
             type: {:enum, PgQuery.ObjectType}
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
             tag: 2,
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
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:comment) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "comment",
             kind: {:scalar, ""},
             label: :optional,
             name: :comment,
             tag: 3,
             type: :string
           }}
        end

        def field_def("comment") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "comment",
             kind: {:scalar, ""},
             label: :optional,
             name: :comment,
             tag: 3,
             type: :string
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
    def default(:objtype) do
      {:ok, :OBJECT_TYPE_UNDEFINED}
    end,
    def default(:object) do
      {:ok, nil}
    end,
    def default(:comment) do
      {:ok, ""}
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
