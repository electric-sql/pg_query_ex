# credo:disable-for-this-file
defmodule PgQuery.MergeStmt do
  @moduledoc false
  defstruct relation: nil,
            source_relation: nil,
            join_condition: nil,
            merge_when_clauses: [],
            with_clause: nil

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
        |> encode_relation(msg)
        |> encode_source_relation(msg)
        |> encode_join_condition(msg)
        |> encode_merge_when_clauses(msg)
        |> encode_with_clause(msg)
      end
    )

    []

    [
      defp encode_relation(acc, msg) do
        try do
          if msg.relation == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.relation)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:relation, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_source_relation(acc, msg) do
        try do
          if msg.source_relation == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.source_relation)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:source_relation, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_join_condition(acc, msg) do
        try do
          if msg.join_condition == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.join_condition)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:join_condition, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_merge_when_clauses(acc, msg) do
        try do
          case msg.merge_when_clauses do
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
            reraise Protox.EncodingError.new(:merge_when_clauses, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_with_clause(acc, msg) do
        try do
          if msg.with_clause == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.with_clause)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:with_clause, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.MergeStmt))
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
                 relation:
                   Protox.MergeMessage.merge(msg.relation, PgQuery.RangeVar.decode!(delimited))
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 source_relation:
                   Protox.MergeMessage.merge(msg.source_relation, PgQuery.Node.decode!(delimited))
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 join_condition:
                   Protox.MergeMessage.merge(msg.join_condition, PgQuery.Node.decode!(delimited))
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[merge_when_clauses: msg.merge_when_clauses ++ [PgQuery.Node.decode!(delimited)]],
               rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 with_clause:
                   Protox.MergeMessage.merge(
                     msg.with_clause,
                     PgQuery.WithClause.decode!(delimited)
                   )
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
        PgQuery.MergeStmt,
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
        1 => {:relation, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        2 => {:source_relation, {:scalar, nil}, {:message, PgQuery.Node}},
        3 => {:join_condition, {:scalar, nil}, {:message, PgQuery.Node}},
        4 => {:merge_when_clauses, :unpacked, {:message, PgQuery.Node}},
        5 => {:with_clause, {:scalar, nil}, {:message, PgQuery.WithClause}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        join_condition: {3, {:scalar, nil}, {:message, PgQuery.Node}},
        merge_when_clauses: {4, :unpacked, {:message, PgQuery.Node}},
        relation: {1, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        source_relation: {2, {:scalar, nil}, {:message, PgQuery.Node}},
        with_clause: {5, {:scalar, nil}, {:message, PgQuery.WithClause}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "relation",
          kind: {:scalar, nil},
          label: :optional,
          name: :relation,
          tag: 1,
          type: {:message, PgQuery.RangeVar}
        },
        %{
          __struct__: Protox.Field,
          json_name: "sourceRelation",
          kind: {:scalar, nil},
          label: :optional,
          name: :source_relation,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "joinCondition",
          kind: {:scalar, nil},
          label: :optional,
          name: :join_condition,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "mergeWhenClauses",
          kind: :unpacked,
          label: :repeated,
          name: :merge_when_clauses,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "withClause",
          kind: {:scalar, nil},
          label: :optional,
          name: :with_clause,
          tag: 5,
          type: {:message, PgQuery.WithClause}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:relation) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relation",
             kind: {:scalar, nil},
             label: :optional,
             name: :relation,
             tag: 1,
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
             tag: 1,
             type: {:message, PgQuery.RangeVar}
           }}
        end

        []
      ),
      (
        def field_def(:source_relation) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sourceRelation",
             kind: {:scalar, nil},
             label: :optional,
             name: :source_relation,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("sourceRelation") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sourceRelation",
             kind: {:scalar, nil},
             label: :optional,
             name: :source_relation,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("source_relation") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sourceRelation",
             kind: {:scalar, nil},
             label: :optional,
             name: :source_relation,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:join_condition) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "joinCondition",
             kind: {:scalar, nil},
             label: :optional,
             name: :join_condition,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("joinCondition") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "joinCondition",
             kind: {:scalar, nil},
             label: :optional,
             name: :join_condition,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("join_condition") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "joinCondition",
             kind: {:scalar, nil},
             label: :optional,
             name: :join_condition,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:merge_when_clauses) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mergeWhenClauses",
             kind: :unpacked,
             label: :repeated,
             name: :merge_when_clauses,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("mergeWhenClauses") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mergeWhenClauses",
             kind: :unpacked,
             label: :repeated,
             name: :merge_when_clauses,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("merge_when_clauses") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mergeWhenClauses",
             kind: :unpacked,
             label: :repeated,
             name: :merge_when_clauses,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:with_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "withClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :with_clause,
             tag: 5,
             type: {:message, PgQuery.WithClause}
           }}
        end

        def field_def("withClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "withClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :with_clause,
             tag: 5,
             type: {:message, PgQuery.WithClause}
           }}
        end

        def field_def("with_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "withClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :with_clause,
             tag: 5,
             type: {:message, PgQuery.WithClause}
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
    def default(:relation) do
      {:ok, nil}
    end,
    def default(:source_relation) do
      {:ok, nil}
    end,
    def default(:join_condition) do
      {:ok, nil}
    end,
    def default(:merge_when_clauses) do
      {:error, :no_default_value}
    end,
    def default(:with_clause) do
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
