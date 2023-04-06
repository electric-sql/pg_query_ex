# credo:disable-for-this-file
defmodule PgQuery.RangeSubselect do
  @moduledoc false
  defstruct lateral: false, subquery: nil, alias: nil

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
        [] |> encode_lateral(msg) |> encode_subquery(msg) |> encode_alias(msg)
      end
    )

    []

    [
      defp encode_lateral(acc, msg) do
        try do
          if msg.lateral == false do
            acc
          else
            [acc, "\b", Protox.Encode.encode_bool(msg.lateral)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:lateral, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_subquery(acc, msg) do
        try do
          if msg.subquery == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.subquery)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:subquery, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_alias(acc, msg) do
        try do
          if msg.alias == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.alias)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alias, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.RangeSubselect))
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
              {[lateral: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 subquery:
                   Protox.MergeMessage.merge(msg.subquery, PgQuery.Node.decode!(delimited))
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[alias: Protox.MergeMessage.merge(msg.alias, PgQuery.Alias.decode!(delimited))],
               rest}

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
        PgQuery.RangeSubselect,
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
        1 => {:lateral, {:scalar, false}, :bool},
        2 => {:subquery, {:scalar, nil}, {:message, PgQuery.Node}},
        3 => {:alias, {:scalar, nil}, {:message, PgQuery.Alias}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        alias: {3, {:scalar, nil}, {:message, PgQuery.Alias}},
        lateral: {1, {:scalar, false}, :bool},
        subquery: {2, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "lateral",
          kind: {:scalar, false},
          label: :optional,
          name: :lateral,
          tag: 1,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "subquery",
          kind: {:scalar, nil},
          label: :optional,
          name: :subquery,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alias",
          kind: {:scalar, nil},
          label: :optional,
          name: :alias,
          tag: 3,
          type: {:message, PgQuery.Alias}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:lateral) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lateral",
             kind: {:scalar, false},
             label: :optional,
             name: :lateral,
             tag: 1,
             type: :bool
           }}
        end

        def field_def("lateral") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lateral",
             kind: {:scalar, false},
             label: :optional,
             name: :lateral,
             tag: 1,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:subquery) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subquery",
             kind: {:scalar, nil},
             label: :optional,
             name: :subquery,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("subquery") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subquery",
             kind: {:scalar, nil},
             label: :optional,
             name: :subquery,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:alias) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alias",
             kind: {:scalar, nil},
             label: :optional,
             name: :alias,
             tag: 3,
             type: {:message, PgQuery.Alias}
           }}
        end

        def field_def("alias") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alias",
             kind: {:scalar, nil},
             label: :optional,
             name: :alias,
             tag: 3,
             type: {:message, PgQuery.Alias}
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
    def default(:lateral) do
      {:ok, false}
    end,
    def default(:subquery) do
      {:ok, nil}
    end,
    def default(:alias) do
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
