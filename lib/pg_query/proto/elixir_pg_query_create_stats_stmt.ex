# credo:disable-for-this-file
defmodule PgQuery.CreateStatsStmt do
  @moduledoc false
  defstruct defnames: [],
            stat_types: [],
            exprs: [],
            relations: [],
            stxcomment: "",
            transformed: false,
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
        |> encode_defnames(msg)
        |> encode_stat_types(msg)
        |> encode_exprs(msg)
        |> encode_relations(msg)
        |> encode_stxcomment(msg)
        |> encode_transformed(msg)
        |> encode_if_not_exists(msg)
      end
    )

    []

    [
      defp encode_defnames(acc, msg) do
        try do
          case msg.defnames do
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
            reraise Protox.EncodingError.new(:defnames, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_stat_types(acc, msg) do
        try do
          case msg.stat_types do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x12", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:stat_types, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_exprs(acc, msg) do
        try do
          case msg.exprs do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x1A", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:exprs, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_relations(acc, msg) do
        try do
          case msg.relations do
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
            reraise Protox.EncodingError.new(:relations, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_stxcomment(acc, msg) do
        try do
          if msg.stxcomment == "" do
            acc
          else
            [acc, "*", Protox.Encode.encode_string(msg.stxcomment)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:stxcomment, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_transformed(acc, msg) do
        try do
          if msg.transformed == false do
            acc
          else
            [acc, "0", Protox.Encode.encode_bool(msg.transformed)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:transformed, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_if_not_exists(acc, msg) do
        try do
          if msg.if_not_exists == false do
            acc
          else
            [acc, "8", Protox.Encode.encode_bool(msg.if_not_exists)]
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
          parse_key_value(bytes, struct(PgQuery.CreateStatsStmt))
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
              {[defnames: msg.defnames ++ [PgQuery.Node.decode!(delimited)]], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[stat_types: msg.stat_types ++ [PgQuery.Node.decode!(delimited)]], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[exprs: msg.exprs ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[relations: msg.relations ++ [PgQuery.Node.decode!(delimited)]], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[stxcomment: delimited], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[transformed: value], rest}

            {7, _, bytes} ->
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
        PgQuery.CreateStatsStmt,
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
        1 => {:defnames, :unpacked, {:message, PgQuery.Node}},
        2 => {:stat_types, :unpacked, {:message, PgQuery.Node}},
        3 => {:exprs, :unpacked, {:message, PgQuery.Node}},
        4 => {:relations, :unpacked, {:message, PgQuery.Node}},
        5 => {:stxcomment, {:scalar, ""}, :string},
        6 => {:transformed, {:scalar, false}, :bool},
        7 => {:if_not_exists, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        defnames: {1, :unpacked, {:message, PgQuery.Node}},
        exprs: {3, :unpacked, {:message, PgQuery.Node}},
        if_not_exists: {7, {:scalar, false}, :bool},
        relations: {4, :unpacked, {:message, PgQuery.Node}},
        stat_types: {2, :unpacked, {:message, PgQuery.Node}},
        stxcomment: {5, {:scalar, ""}, :string},
        transformed: {6, {:scalar, false}, :bool}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "defnames",
          kind: :unpacked,
          label: :repeated,
          name: :defnames,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "statTypes",
          kind: :unpacked,
          label: :repeated,
          name: :stat_types,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "exprs",
          kind: :unpacked,
          label: :repeated,
          name: :exprs,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "relations",
          kind: :unpacked,
          label: :repeated,
          name: :relations,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "stxcomment",
          kind: {:scalar, ""},
          label: :optional,
          name: :stxcomment,
          tag: 5,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "transformed",
          kind: {:scalar, false},
          label: :optional,
          name: :transformed,
          tag: 6,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "ifNotExists",
          kind: {:scalar, false},
          label: :optional,
          name: :if_not_exists,
          tag: 7,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:defnames) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "defnames",
             kind: :unpacked,
             label: :repeated,
             name: :defnames,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("defnames") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "defnames",
             kind: :unpacked,
             label: :repeated,
             name: :defnames,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:stat_types) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "statTypes",
             kind: :unpacked,
             label: :repeated,
             name: :stat_types,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("statTypes") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "statTypes",
             kind: :unpacked,
             label: :repeated,
             name: :stat_types,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("stat_types") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "statTypes",
             kind: :unpacked,
             label: :repeated,
             name: :stat_types,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:exprs) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "exprs",
             kind: :unpacked,
             label: :repeated,
             name: :exprs,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("exprs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "exprs",
             kind: :unpacked,
             label: :repeated,
             name: :exprs,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:relations) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relations",
             kind: :unpacked,
             label: :repeated,
             name: :relations,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("relations") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relations",
             kind: :unpacked,
             label: :repeated,
             name: :relations,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:stxcomment) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "stxcomment",
             kind: {:scalar, ""},
             label: :optional,
             name: :stxcomment,
             tag: 5,
             type: :string
           }}
        end

        def field_def("stxcomment") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "stxcomment",
             kind: {:scalar, ""},
             label: :optional,
             name: :stxcomment,
             tag: 5,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:transformed) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "transformed",
             kind: {:scalar, false},
             label: :optional,
             name: :transformed,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("transformed") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "transformed",
             kind: {:scalar, false},
             label: :optional,
             name: :transformed,
             tag: 6,
             type: :bool
           }}
        end

        []
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
             tag: 7,
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
             tag: 7,
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
             tag: 7,
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
    def default(:defnames) do
      {:error, :no_default_value}
    end,
    def default(:stat_types) do
      {:error, :no_default_value}
    end,
    def default(:exprs) do
      {:error, :no_default_value}
    end,
    def default(:relations) do
      {:error, :no_default_value}
    end,
    def default(:stxcomment) do
      {:ok, ""}
    end,
    def default(:transformed) do
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
