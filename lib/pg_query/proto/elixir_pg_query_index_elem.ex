# credo:disable-for-this-file
defmodule PgQuery.IndexElem do
  @moduledoc false
  defstruct name: "",
            expr: nil,
            indexcolname: "",
            collation: [],
            opclass: [],
            opclassopts: [],
            ordering: :SORT_BY_DIR_UNDEFINED,
            nulls_ordering: :SORT_BY_NULLS_UNDEFINED

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
        |> encode_name(msg)
        |> encode_expr(msg)
        |> encode_indexcolname(msg)
        |> encode_collation(msg)
        |> encode_opclass(msg)
        |> encode_opclassopts(msg)
        |> encode_ordering(msg)
        |> encode_nulls_ordering(msg)
      end
    )

    []

    [
      defp encode_name(acc, msg) do
        try do
          if msg.name == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_expr(acc, msg) do
        try do
          if msg.expr == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.expr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:expr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_indexcolname(acc, msg) do
        try do
          if msg.indexcolname == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.indexcolname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:indexcolname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_collation(acc, msg) do
        try do
          case msg.collation do
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
            reraise Protox.EncodingError.new(:collation, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_opclass(acc, msg) do
        try do
          case msg.opclass do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "*", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:opclass, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_opclassopts(acc, msg) do
        try do
          case msg.opclassopts do
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
            reraise Protox.EncodingError.new(:opclassopts, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ordering(acc, msg) do
        try do
          if msg.ordering == :SORT_BY_DIR_UNDEFINED do
            acc
          else
            [acc, "8", msg.ordering |> PgQuery.SortByDir.encode() |> Protox.Encode.encode_enum()]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ordering, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_nulls_ordering(acc, msg) do
        try do
          if msg.nulls_ordering == :SORT_BY_NULLS_UNDEFINED do
            acc
          else
            [
              acc,
              "@",
              msg.nulls_ordering |> PgQuery.SortByNulls.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:nulls_ordering, "invalid field value"),
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
          parse_key_value(bytes, struct(PgQuery.IndexElem))
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
              {[name: delimited], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[expr: Protox.MergeMessage.merge(msg.expr, PgQuery.Node.decode!(delimited))], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[indexcolname: delimited], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[collation: msg.collation ++ [PgQuery.Node.decode!(delimited)]], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[opclass: msg.opclass ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[opclassopts: msg.opclassopts ++ [PgQuery.Node.decode!(delimited)]], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.SortByDir)
              {[ordering: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.SortByNulls)
              {[nulls_ordering: value], rest}

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
        PgQuery.IndexElem,
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
        1 => {:name, {:scalar, ""}, :string},
        2 => {:expr, {:scalar, nil}, {:message, PgQuery.Node}},
        3 => {:indexcolname, {:scalar, ""}, :string},
        4 => {:collation, :unpacked, {:message, PgQuery.Node}},
        5 => {:opclass, :unpacked, {:message, PgQuery.Node}},
        6 => {:opclassopts, :unpacked, {:message, PgQuery.Node}},
        7 => {:ordering, {:scalar, :SORT_BY_DIR_UNDEFINED}, {:enum, PgQuery.SortByDir}},
        8 => {:nulls_ordering, {:scalar, :SORT_BY_NULLS_UNDEFINED}, {:enum, PgQuery.SortByNulls}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        collation: {4, :unpacked, {:message, PgQuery.Node}},
        expr: {2, {:scalar, nil}, {:message, PgQuery.Node}},
        indexcolname: {3, {:scalar, ""}, :string},
        name: {1, {:scalar, ""}, :string},
        nulls_ordering: {8, {:scalar, :SORT_BY_NULLS_UNDEFINED}, {:enum, PgQuery.SortByNulls}},
        opclass: {5, :unpacked, {:message, PgQuery.Node}},
        opclassopts: {6, :unpacked, {:message, PgQuery.Node}},
        ordering: {7, {:scalar, :SORT_BY_DIR_UNDEFINED}, {:enum, PgQuery.SortByDir}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "name",
          kind: {:scalar, ""},
          label: :optional,
          name: :name,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "expr",
          kind: {:scalar, nil},
          label: :optional,
          name: :expr,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "indexcolname",
          kind: {:scalar, ""},
          label: :optional,
          name: :indexcolname,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "collation",
          kind: :unpacked,
          label: :repeated,
          name: :collation,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "opclass",
          kind: :unpacked,
          label: :repeated,
          name: :opclass,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "opclassopts",
          kind: :unpacked,
          label: :repeated,
          name: :opclassopts,
          tag: 6,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "ordering",
          kind: {:scalar, :SORT_BY_DIR_UNDEFINED},
          label: :optional,
          name: :ordering,
          tag: 7,
          type: {:enum, PgQuery.SortByDir}
        },
        %{
          __struct__: Protox.Field,
          json_name: "nullsOrdering",
          kind: {:scalar, :SORT_BY_NULLS_UNDEFINED},
          label: :optional,
          name: :nulls_ordering,
          tag: 8,
          type: {:enum, PgQuery.SortByNulls}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, ""},
             label: :optional,
             name: :name,
             tag: 1,
             type: :string
           }}
        end

        def field_def("name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, ""},
             label: :optional,
             name: :name,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "expr",
             kind: {:scalar, nil},
             label: :optional,
             name: :expr,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "expr",
             kind: {:scalar, nil},
             label: :optional,
             name: :expr,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:indexcolname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexcolname",
             kind: {:scalar, ""},
             label: :optional,
             name: :indexcolname,
             tag: 3,
             type: :string
           }}
        end

        def field_def("indexcolname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexcolname",
             kind: {:scalar, ""},
             label: :optional,
             name: :indexcolname,
             tag: 3,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:collation) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collation",
             kind: :unpacked,
             label: :repeated,
             name: :collation,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("collation") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collation",
             kind: :unpacked,
             label: :repeated,
             name: :collation,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:opclass) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opclass",
             kind: :unpacked,
             label: :repeated,
             name: :opclass,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("opclass") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opclass",
             kind: :unpacked,
             label: :repeated,
             name: :opclass,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:opclassopts) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opclassopts",
             kind: :unpacked,
             label: :repeated,
             name: :opclassopts,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("opclassopts") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opclassopts",
             kind: :unpacked,
             label: :repeated,
             name: :opclassopts,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:ordering) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ordering",
             kind: {:scalar, :SORT_BY_DIR_UNDEFINED},
             label: :optional,
             name: :ordering,
             tag: 7,
             type: {:enum, PgQuery.SortByDir}
           }}
        end

        def field_def("ordering") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ordering",
             kind: {:scalar, :SORT_BY_DIR_UNDEFINED},
             label: :optional,
             name: :ordering,
             tag: 7,
             type: {:enum, PgQuery.SortByDir}
           }}
        end

        []
      ),
      (
        def field_def(:nulls_ordering) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nullsOrdering",
             kind: {:scalar, :SORT_BY_NULLS_UNDEFINED},
             label: :optional,
             name: :nulls_ordering,
             tag: 8,
             type: {:enum, PgQuery.SortByNulls}
           }}
        end

        def field_def("nullsOrdering") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nullsOrdering",
             kind: {:scalar, :SORT_BY_NULLS_UNDEFINED},
             label: :optional,
             name: :nulls_ordering,
             tag: 8,
             type: {:enum, PgQuery.SortByNulls}
           }}
        end

        def field_def("nulls_ordering") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nullsOrdering",
             kind: {:scalar, :SORT_BY_NULLS_UNDEFINED},
             label: :optional,
             name: :nulls_ordering,
             tag: 8,
             type: {:enum, PgQuery.SortByNulls}
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
    def default(:name) do
      {:ok, ""}
    end,
    def default(:expr) do
      {:ok, nil}
    end,
    def default(:indexcolname) do
      {:ok, ""}
    end,
    def default(:collation) do
      {:error, :no_default_value}
    end,
    def default(:opclass) do
      {:error, :no_default_value}
    end,
    def default(:opclassopts) do
      {:error, :no_default_value}
    end,
    def default(:ordering) do
      {:ok, :SORT_BY_DIR_UNDEFINED}
    end,
    def default(:nulls_ordering) do
      {:ok, :SORT_BY_NULLS_UNDEFINED}
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