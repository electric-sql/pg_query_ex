# credo:disable-for-this-file
defmodule PgQuery.InsertStmt do
  @moduledoc false
  defstruct relation: nil,
            cols: [],
            select_stmt: nil,
            on_conflict_clause: nil,
            returning_list: [],
            with_clause: nil,
            override: :OVERRIDING_KIND_UNDEFINED

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
        |> encode_cols(msg)
        |> encode_select_stmt(msg)
        |> encode_on_conflict_clause(msg)
        |> encode_returning_list(msg)
        |> encode_with_clause(msg)
        |> encode_override(msg)
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
      defp encode_cols(acc, msg) do
        try do
          case msg.cols do
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
            reraise Protox.EncodingError.new(:cols, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_select_stmt(acc, msg) do
        try do
          if msg.select_stmt == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.select_stmt)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:select_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_on_conflict_clause(acc, msg) do
        try do
          if msg.on_conflict_clause == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.on_conflict_clause)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:on_conflict_clause, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_returning_list(acc, msg) do
        try do
          case msg.returning_list do
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
            reraise Protox.EncodingError.new(:returning_list, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_with_clause(acc, msg) do
        try do
          if msg.with_clause == nil do
            acc
          else
            [acc, "2", Protox.Encode.encode_message(msg.with_clause)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:with_clause, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_override(acc, msg) do
        try do
          if msg.override == :OVERRIDING_KIND_UNDEFINED do
            acc
          else
            [
              acc,
              "8",
              msg.override |> PgQuery.OverridingKind.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:override, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.InsertStmt))
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
              {[cols: msg.cols ++ [PgQuery.Node.decode!(delimited)]], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 select_stmt:
                   Protox.MergeMessage.merge(msg.select_stmt, PgQuery.Node.decode!(delimited))
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 on_conflict_clause:
                   Protox.MergeMessage.merge(
                     msg.on_conflict_clause,
                     PgQuery.OnConflictClause.decode!(delimited)
                   )
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[returning_list: msg.returning_list ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 with_clause:
                   Protox.MergeMessage.merge(
                     msg.with_clause,
                     PgQuery.WithClause.decode!(delimited)
                   )
               ], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.OverridingKind)
              {[override: value], rest}

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
        PgQuery.InsertStmt,
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
        2 => {:cols, :unpacked, {:message, PgQuery.Node}},
        3 => {:select_stmt, {:scalar, nil}, {:message, PgQuery.Node}},
        4 => {:on_conflict_clause, {:scalar, nil}, {:message, PgQuery.OnConflictClause}},
        5 => {:returning_list, :unpacked, {:message, PgQuery.Node}},
        6 => {:with_clause, {:scalar, nil}, {:message, PgQuery.WithClause}},
        7 => {:override, {:scalar, :OVERRIDING_KIND_UNDEFINED}, {:enum, PgQuery.OverridingKind}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        cols: {2, :unpacked, {:message, PgQuery.Node}},
        on_conflict_clause: {4, {:scalar, nil}, {:message, PgQuery.OnConflictClause}},
        override: {7, {:scalar, :OVERRIDING_KIND_UNDEFINED}, {:enum, PgQuery.OverridingKind}},
        relation: {1, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        returning_list: {5, :unpacked, {:message, PgQuery.Node}},
        select_stmt: {3, {:scalar, nil}, {:message, PgQuery.Node}},
        with_clause: {6, {:scalar, nil}, {:message, PgQuery.WithClause}}
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
          json_name: "cols",
          kind: :unpacked,
          label: :repeated,
          name: :cols,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "selectStmt",
          kind: {:scalar, nil},
          label: :optional,
          name: :select_stmt,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "onConflictClause",
          kind: {:scalar, nil},
          label: :optional,
          name: :on_conflict_clause,
          tag: 4,
          type: {:message, PgQuery.OnConflictClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "returningList",
          kind: :unpacked,
          label: :repeated,
          name: :returning_list,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "withClause",
          kind: {:scalar, nil},
          label: :optional,
          name: :with_clause,
          tag: 6,
          type: {:message, PgQuery.WithClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "override",
          kind: {:scalar, :OVERRIDING_KIND_UNDEFINED},
          label: :optional,
          name: :override,
          tag: 7,
          type: {:enum, PgQuery.OverridingKind}
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
        def field_def(:cols) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cols",
             kind: :unpacked,
             label: :repeated,
             name: :cols,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("cols") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cols",
             kind: :unpacked,
             label: :repeated,
             name: :cols,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:select_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "selectStmt",
             kind: {:scalar, nil},
             label: :optional,
             name: :select_stmt,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("selectStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "selectStmt",
             kind: {:scalar, nil},
             label: :optional,
             name: :select_stmt,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("select_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "selectStmt",
             kind: {:scalar, nil},
             label: :optional,
             name: :select_stmt,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:on_conflict_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onConflictClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :on_conflict_clause,
             tag: 4,
             type: {:message, PgQuery.OnConflictClause}
           }}
        end

        def field_def("onConflictClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onConflictClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :on_conflict_clause,
             tag: 4,
             type: {:message, PgQuery.OnConflictClause}
           }}
        end

        def field_def("on_conflict_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onConflictClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :on_conflict_clause,
             tag: 4,
             type: {:message, PgQuery.OnConflictClause}
           }}
        end
      ),
      (
        def field_def(:returning_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returningList",
             kind: :unpacked,
             label: :repeated,
             name: :returning_list,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("returningList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returningList",
             kind: :unpacked,
             label: :repeated,
             name: :returning_list,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("returning_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returningList",
             kind: :unpacked,
             label: :repeated,
             name: :returning_list,
             tag: 5,
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
             tag: 6,
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
             tag: 6,
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
             tag: 6,
             type: {:message, PgQuery.WithClause}
           }}
        end
      ),
      (
        def field_def(:override) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "override",
             kind: {:scalar, :OVERRIDING_KIND_UNDEFINED},
             label: :optional,
             name: :override,
             tag: 7,
             type: {:enum, PgQuery.OverridingKind}
           }}
        end

        def field_def("override") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "override",
             kind: {:scalar, :OVERRIDING_KIND_UNDEFINED},
             label: :optional,
             name: :override,
             tag: 7,
             type: {:enum, PgQuery.OverridingKind}
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
    def default(:relation) do
      {:ok, nil}
    end,
    def default(:cols) do
      {:error, :no_default_value}
    end,
    def default(:select_stmt) do
      {:ok, nil}
    end,
    def default(:on_conflict_clause) do
      {:ok, nil}
    end,
    def default(:returning_list) do
      {:error, :no_default_value}
    end,
    def default(:with_clause) do
      {:ok, nil}
    end,
    def default(:override) do
      {:ok, :OVERRIDING_KIND_UNDEFINED}
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
