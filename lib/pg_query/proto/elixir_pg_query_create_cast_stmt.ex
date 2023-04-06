# credo:disable-for-this-file
defmodule PgQuery.CreateCastStmt do
  @moduledoc false
  defstruct sourcetype: nil,
            targettype: nil,
            func: nil,
            context: :COERCION_CONTEXT_UNDEFINED,
            inout: false

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
        |> encode_sourcetype(msg)
        |> encode_targettype(msg)
        |> encode_func(msg)
        |> encode_context(msg)
        |> encode_inout(msg)
      end
    )

    []

    [
      defp encode_sourcetype(acc, msg) do
        try do
          if msg.sourcetype == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.sourcetype)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sourcetype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_targettype(acc, msg) do
        try do
          if msg.targettype == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.targettype)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:targettype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_func(acc, msg) do
        try do
          if msg.func == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.func)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:func, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_context(acc, msg) do
        try do
          if msg.context == :COERCION_CONTEXT_UNDEFINED do
            acc
          else
            [
              acc,
              " ",
              msg.context |> PgQuery.CoercionContext.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:context, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_inout(acc, msg) do
        try do
          if msg.inout == false do
            acc
          else
            [acc, "(", Protox.Encode.encode_bool(msg.inout)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:inout, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.CreateCastStmt))
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

              {[
                 sourcetype:
                   Protox.MergeMessage.merge(msg.sourcetype, PgQuery.TypeName.decode!(delimited))
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 targettype:
                   Protox.MergeMessage.merge(msg.targettype, PgQuery.TypeName.decode!(delimited))
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 func:
                   Protox.MergeMessage.merge(msg.func, PgQuery.ObjectWithArgs.decode!(delimited))
               ], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.CoercionContext)
              {[context: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[inout: value], rest}

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
        PgQuery.CreateCastStmt,
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
        1 => {:sourcetype, {:scalar, nil}, {:message, PgQuery.TypeName}},
        2 => {:targettype, {:scalar, nil}, {:message, PgQuery.TypeName}},
        3 => {:func, {:scalar, nil}, {:message, PgQuery.ObjectWithArgs}},
        4 => {:context, {:scalar, :COERCION_CONTEXT_UNDEFINED}, {:enum, PgQuery.CoercionContext}},
        5 => {:inout, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        context: {4, {:scalar, :COERCION_CONTEXT_UNDEFINED}, {:enum, PgQuery.CoercionContext}},
        func: {3, {:scalar, nil}, {:message, PgQuery.ObjectWithArgs}},
        inout: {5, {:scalar, false}, :bool},
        sourcetype: {1, {:scalar, nil}, {:message, PgQuery.TypeName}},
        targettype: {2, {:scalar, nil}, {:message, PgQuery.TypeName}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "sourcetype",
          kind: {:scalar, nil},
          label: :optional,
          name: :sourcetype,
          tag: 1,
          type: {:message, PgQuery.TypeName}
        },
        %{
          __struct__: Protox.Field,
          json_name: "targettype",
          kind: {:scalar, nil},
          label: :optional,
          name: :targettype,
          tag: 2,
          type: {:message, PgQuery.TypeName}
        },
        %{
          __struct__: Protox.Field,
          json_name: "func",
          kind: {:scalar, nil},
          label: :optional,
          name: :func,
          tag: 3,
          type: {:message, PgQuery.ObjectWithArgs}
        },
        %{
          __struct__: Protox.Field,
          json_name: "context",
          kind: {:scalar, :COERCION_CONTEXT_UNDEFINED},
          label: :optional,
          name: :context,
          tag: 4,
          type: {:enum, PgQuery.CoercionContext}
        },
        %{
          __struct__: Protox.Field,
          json_name: "inout",
          kind: {:scalar, false},
          label: :optional,
          name: :inout,
          tag: 5,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:sourcetype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sourcetype",
             kind: {:scalar, nil},
             label: :optional,
             name: :sourcetype,
             tag: 1,
             type: {:message, PgQuery.TypeName}
           }}
        end

        def field_def("sourcetype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sourcetype",
             kind: {:scalar, nil},
             label: :optional,
             name: :sourcetype,
             tag: 1,
             type: {:message, PgQuery.TypeName}
           }}
        end

        []
      ),
      (
        def field_def(:targettype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "targettype",
             kind: {:scalar, nil},
             label: :optional,
             name: :targettype,
             tag: 2,
             type: {:message, PgQuery.TypeName}
           }}
        end

        def field_def("targettype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "targettype",
             kind: {:scalar, nil},
             label: :optional,
             name: :targettype,
             tag: 2,
             type: {:message, PgQuery.TypeName}
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
             tag: 3,
             type: {:message, PgQuery.ObjectWithArgs}
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
             tag: 3,
             type: {:message, PgQuery.ObjectWithArgs}
           }}
        end

        []
      ),
      (
        def field_def(:context) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "context",
             kind: {:scalar, :COERCION_CONTEXT_UNDEFINED},
             label: :optional,
             name: :context,
             tag: 4,
             type: {:enum, PgQuery.CoercionContext}
           }}
        end

        def field_def("context") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "context",
             kind: {:scalar, :COERCION_CONTEXT_UNDEFINED},
             label: :optional,
             name: :context,
             tag: 4,
             type: {:enum, PgQuery.CoercionContext}
           }}
        end

        []
      ),
      (
        def field_def(:inout) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inout",
             kind: {:scalar, false},
             label: :optional,
             name: :inout,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("inout") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inout",
             kind: {:scalar, false},
             label: :optional,
             name: :inout,
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
    def default(:sourcetype) do
      {:ok, nil}
    end,
    def default(:targettype) do
      {:ok, nil}
    end,
    def default(:func) do
      {:ok, nil}
    end,
    def default(:context) do
      {:ok, :COERCION_CONTEXT_UNDEFINED}
    end,
    def default(:inout) do
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
