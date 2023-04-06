# credo:disable-for-this-file
defmodule PgQuery.RangeFunction do
  @moduledoc false
  defstruct lateral: false,
            ordinality: false,
            is_rowsfrom: false,
            functions: [],
            alias: nil,
            coldeflist: []

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
        |> encode_lateral(msg)
        |> encode_ordinality(msg)
        |> encode_is_rowsfrom(msg)
        |> encode_functions(msg)
        |> encode_alias(msg)
        |> encode_coldeflist(msg)
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
      defp encode_ordinality(acc, msg) do
        try do
          if msg.ordinality == false do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_bool(msg.ordinality)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ordinality, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_is_rowsfrom(acc, msg) do
        try do
          if msg.is_rowsfrom == false do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_bool(msg.is_rowsfrom)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_rowsfrom, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_functions(acc, msg) do
        try do
          case msg.functions do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\"", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:functions, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_alias(acc, msg) do
        try do
          if msg.alias == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.alias)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alias, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_coldeflist(acc, msg) do
        try do
          case msg.coldeflist do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "2", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:coldeflist, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.RangeFunction))
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
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[ordinality: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_rowsfrom: value], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[functions: msg.functions ++ [PgQuery.Node.decode!(delimited)]], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[alias: Protox.MergeMessage.merge(msg.alias, PgQuery.Alias.decode!(delimited))],
               rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[coldeflist: msg.coldeflist ++ [PgQuery.Node.decode!(delimited)]], rest}

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
        PgQuery.RangeFunction,
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
        2 => {:ordinality, {:scalar, false}, :bool},
        3 => {:is_rowsfrom, {:scalar, false}, :bool},
        4 => {:functions, :unpacked, {:message, PgQuery.Node}},
        5 => {:alias, {:scalar, nil}, {:message, PgQuery.Alias}},
        6 => {:coldeflist, :unpacked, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        alias: {5, {:scalar, nil}, {:message, PgQuery.Alias}},
        coldeflist: {6, :unpacked, {:message, PgQuery.Node}},
        functions: {4, :unpacked, {:message, PgQuery.Node}},
        is_rowsfrom: {3, {:scalar, false}, :bool},
        lateral: {1, {:scalar, false}, :bool},
        ordinality: {2, {:scalar, false}, :bool}
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
          json_name: "ordinality",
          kind: {:scalar, false},
          label: :optional,
          name: :ordinality,
          tag: 2,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "isRowsfrom",
          kind: {:scalar, false},
          label: :optional,
          name: :is_rowsfrom,
          tag: 3,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "functions",
          kind: :unpacked,
          label: :repeated,
          name: :functions,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alias",
          kind: {:scalar, nil},
          label: :optional,
          name: :alias,
          tag: 5,
          type: {:message, PgQuery.Alias}
        },
        %{
          __struct__: Protox.Field,
          json_name: "coldeflist",
          kind: :unpacked,
          label: :repeated,
          name: :coldeflist,
          tag: 6,
          type: {:message, PgQuery.Node}
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
        def field_def(:ordinality) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ordinality",
             kind: {:scalar, false},
             label: :optional,
             name: :ordinality,
             tag: 2,
             type: :bool
           }}
        end

        def field_def("ordinality") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ordinality",
             kind: {:scalar, false},
             label: :optional,
             name: :ordinality,
             tag: 2,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:is_rowsfrom) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isRowsfrom",
             kind: {:scalar, false},
             label: :optional,
             name: :is_rowsfrom,
             tag: 3,
             type: :bool
           }}
        end

        def field_def("isRowsfrom") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isRowsfrom",
             kind: {:scalar, false},
             label: :optional,
             name: :is_rowsfrom,
             tag: 3,
             type: :bool
           }}
        end

        def field_def("is_rowsfrom") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isRowsfrom",
             kind: {:scalar, false},
             label: :optional,
             name: :is_rowsfrom,
             tag: 3,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:functions) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "functions",
             kind: :unpacked,
             label: :repeated,
             name: :functions,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("functions") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "functions",
             kind: :unpacked,
             label: :repeated,
             name: :functions,
             tag: 4,
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
             tag: 5,
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
             tag: 5,
             type: {:message, PgQuery.Alias}
           }}
        end

        []
      ),
      (
        def field_def(:coldeflist) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coldeflist",
             kind: :unpacked,
             label: :repeated,
             name: :coldeflist,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("coldeflist") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coldeflist",
             kind: :unpacked,
             label: :repeated,
             name: :coldeflist,
             tag: 6,
             type: {:message, PgQuery.Node}
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
    def default(:ordinality) do
      {:ok, false}
    end,
    def default(:is_rowsfrom) do
      {:ok, false}
    end,
    def default(:functions) do
      {:error, :no_default_value}
    end,
    def default(:alias) do
      {:ok, nil}
    end,
    def default(:coldeflist) do
      {:error, :no_default_value}
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
