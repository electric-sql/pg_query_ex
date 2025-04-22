# credo:disable-for-this-file
defmodule PgQuery.JsonObjectAgg do
  @moduledoc false
  defstruct constructor: nil, arg: nil, absent_on_null: false, unique: false

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
        |> encode_constructor(msg)
        |> encode_arg(msg)
        |> encode_absent_on_null(msg)
        |> encode_unique(msg)
      end
    )

    []

    [
      defp encode_constructor(acc, msg) do
        try do
          if msg.constructor == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.constructor)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:constructor, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_arg(acc, msg) do
        try do
          if msg.arg == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.arg)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:arg, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_absent_on_null(acc, msg) do
        try do
          if msg.absent_on_null == false do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_bool(msg.absent_on_null)]
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
            [acc, " ", Protox.Encode.encode_bool(msg.unique)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:unique, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.JsonObjectAgg))
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
                 constructor:
                   Protox.MergeMessage.merge(
                     msg.constructor,
                     PgQuery.JsonAggConstructor.decode!(delimited)
                   )
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[arg: Protox.MergeMessage.merge(msg.arg, PgQuery.JsonKeyValue.decode!(delimited))],
               rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[absent_on_null: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[unique: value], rest}

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
        PgQuery.JsonObjectAgg,
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
        1 => {:constructor, {:scalar, nil}, {:message, PgQuery.JsonAggConstructor}},
        2 => {:arg, {:scalar, nil}, {:message, PgQuery.JsonKeyValue}},
        3 => {:absent_on_null, {:scalar, false}, :bool},
        4 => {:unique, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        absent_on_null: {3, {:scalar, false}, :bool},
        arg: {2, {:scalar, nil}, {:message, PgQuery.JsonKeyValue}},
        constructor: {1, {:scalar, nil}, {:message, PgQuery.JsonAggConstructor}},
        unique: {4, {:scalar, false}, :bool}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "constructor",
          kind: {:scalar, nil},
          label: :optional,
          name: :constructor,
          tag: 1,
          type: {:message, PgQuery.JsonAggConstructor}
        },
        %{
          __struct__: Protox.Field,
          json_name: "arg",
          kind: {:scalar, nil},
          label: :optional,
          name: :arg,
          tag: 2,
          type: {:message, PgQuery.JsonKeyValue}
        },
        %{
          __struct__: Protox.Field,
          json_name: "absentOnNull",
          kind: {:scalar, false},
          label: :optional,
          name: :absent_on_null,
          tag: 3,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "unique",
          kind: {:scalar, false},
          label: :optional,
          name: :unique,
          tag: 4,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:constructor) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "constructor",
             kind: {:scalar, nil},
             label: :optional,
             name: :constructor,
             tag: 1,
             type: {:message, PgQuery.JsonAggConstructor}
           }}
        end

        def field_def("constructor") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "constructor",
             kind: {:scalar, nil},
             label: :optional,
             name: :constructor,
             tag: 1,
             type: {:message, PgQuery.JsonAggConstructor}
           }}
        end

        []
      ),
      (
        def field_def(:arg) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arg",
             kind: {:scalar, nil},
             label: :optional,
             name: :arg,
             tag: 2,
             type: {:message, PgQuery.JsonKeyValue}
           }}
        end

        def field_def("arg") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arg",
             kind: {:scalar, nil},
             label: :optional,
             name: :arg,
             tag: 2,
             type: {:message, PgQuery.JsonKeyValue}
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
             tag: 3,
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
             tag: 3,
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
             tag: 3,
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
             tag: 4,
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
             tag: 4,
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
    def default(:constructor) do
      {:ok, nil}
    end,
    def default(:arg) do
      {:ok, nil}
    end,
    def default(:absent_on_null) do
      {:ok, false}
    end,
    def default(:unique) do
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
