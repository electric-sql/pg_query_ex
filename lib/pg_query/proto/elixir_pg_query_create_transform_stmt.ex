# credo:disable-for-this-file
defmodule PgQuery.CreateTransformStmt do
  @moduledoc false
  defstruct replace: false, type_name: nil, lang: "", fromsql: nil, tosql: nil

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
        |> encode_replace(msg)
        |> encode_type_name(msg)
        |> encode_lang(msg)
        |> encode_fromsql(msg)
        |> encode_tosql(msg)
      end
    )

    []

    [
      defp encode_replace(acc, msg) do
        try do
          if msg.replace == false do
            acc
          else
            [acc, "\b", Protox.Encode.encode_bool(msg.replace)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:replace, "invalid field value"), __STACKTRACE__
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
      defp encode_lang(acc, msg) do
        try do
          if msg.lang == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.lang)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:lang, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_fromsql(acc, msg) do
        try do
          if msg.fromsql == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.fromsql)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:fromsql, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_tosql(acc, msg) do
        try do
          if msg.tosql == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.tosql)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:tosql, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.CreateTransformStmt))
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
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[replace: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 type_name:
                   Protox.MergeMessage.merge(msg.type_name, PgQuery.TypeName.decode!(delimited))
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[lang: delimited], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 fromsql:
                   Protox.MergeMessage.merge(
                     msg.fromsql,
                     PgQuery.ObjectWithArgs.decode!(delimited)
                   )
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 tosql:
                   Protox.MergeMessage.merge(msg.tosql, PgQuery.ObjectWithArgs.decode!(delimited))
               ], rest}

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
        PgQuery.CreateTransformStmt,
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
        1 => {:replace, {:scalar, false}, :bool},
        2 => {:type_name, {:scalar, nil}, {:message, PgQuery.TypeName}},
        3 => {:lang, {:scalar, ""}, :string},
        4 => {:fromsql, {:scalar, nil}, {:message, PgQuery.ObjectWithArgs}},
        5 => {:tosql, {:scalar, nil}, {:message, PgQuery.ObjectWithArgs}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        fromsql: {4, {:scalar, nil}, {:message, PgQuery.ObjectWithArgs}},
        lang: {3, {:scalar, ""}, :string},
        replace: {1, {:scalar, false}, :bool},
        tosql: {5, {:scalar, nil}, {:message, PgQuery.ObjectWithArgs}},
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
          json_name: "replace",
          kind: {:scalar, false},
          label: :optional,
          name: :replace,
          tag: 1,
          type: :bool
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
          json_name: "lang",
          kind: {:scalar, ""},
          label: :optional,
          name: :lang,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "fromsql",
          kind: {:scalar, nil},
          label: :optional,
          name: :fromsql,
          tag: 4,
          type: {:message, PgQuery.ObjectWithArgs}
        },
        %{
          __struct__: Protox.Field,
          json_name: "tosql",
          kind: {:scalar, nil},
          label: :optional,
          name: :tosql,
          tag: 5,
          type: {:message, PgQuery.ObjectWithArgs}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:replace) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "replace",
             kind: {:scalar, false},
             label: :optional,
             name: :replace,
             tag: 1,
             type: :bool
           }}
        end

        def field_def("replace") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "replace",
             kind: {:scalar, false},
             label: :optional,
             name: :replace,
             tag: 1,
             type: :bool
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
        def field_def(:lang) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lang",
             kind: {:scalar, ""},
             label: :optional,
             name: :lang,
             tag: 3,
             type: :string
           }}
        end

        def field_def("lang") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lang",
             kind: {:scalar, ""},
             label: :optional,
             name: :lang,
             tag: 3,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:fromsql) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fromsql",
             kind: {:scalar, nil},
             label: :optional,
             name: :fromsql,
             tag: 4,
             type: {:message, PgQuery.ObjectWithArgs}
           }}
        end

        def field_def("fromsql") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fromsql",
             kind: {:scalar, nil},
             label: :optional,
             name: :fromsql,
             tag: 4,
             type: {:message, PgQuery.ObjectWithArgs}
           }}
        end

        []
      ),
      (
        def field_def(:tosql) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tosql",
             kind: {:scalar, nil},
             label: :optional,
             name: :tosql,
             tag: 5,
             type: {:message, PgQuery.ObjectWithArgs}
           }}
        end

        def field_def("tosql") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tosql",
             kind: {:scalar, nil},
             label: :optional,
             name: :tosql,
             tag: 5,
             type: {:message, PgQuery.ObjectWithArgs}
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
    def default(:replace) do
      {:ok, false}
    end,
    def default(:type_name) do
      {:ok, nil}
    end,
    def default(:lang) do
      {:ok, ""}
    end,
    def default(:fromsql) do
      {:ok, nil}
    end,
    def default(:tosql) do
      {:ok, nil}
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
