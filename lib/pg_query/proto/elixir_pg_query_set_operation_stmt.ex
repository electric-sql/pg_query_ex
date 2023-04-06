# credo:disable-for-this-file
defmodule PgQuery.SetOperationStmt do
  @moduledoc false
  defstruct op: :SET_OPERATION_UNDEFINED,
            all: false,
            larg: nil,
            rarg: nil,
            col_types: [],
            col_typmods: [],
            col_collations: [],
            group_clauses: []

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
        |> encode_op(msg)
        |> encode_all(msg)
        |> encode_larg(msg)
        |> encode_rarg(msg)
        |> encode_col_types(msg)
        |> encode_col_typmods(msg)
        |> encode_col_collations(msg)
        |> encode_group_clauses(msg)
      end
    )

    []

    [
      defp encode_op(acc, msg) do
        try do
          if msg.op == :SET_OPERATION_UNDEFINED do
            acc
          else
            [acc, "\b", msg.op |> PgQuery.SetOperation.encode() |> Protox.Encode.encode_enum()]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:op, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_all(acc, msg) do
        try do
          if msg.all == false do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_bool(msg.all)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:all, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_larg(acc, msg) do
        try do
          if msg.larg == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.larg)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:larg, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rarg(acc, msg) do
        try do
          if msg.rarg == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.rarg)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rarg, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_col_types(acc, msg) do
        try do
          case msg.col_types do
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
            reraise Protox.EncodingError.new(:col_types, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_col_typmods(acc, msg) do
        try do
          case msg.col_typmods do
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
            reraise Protox.EncodingError.new(:col_typmods, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_col_collations(acc, msg) do
        try do
          case msg.col_collations do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, ":", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:col_collations, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_group_clauses(acc, msg) do
        try do
          case msg.group_clauses do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "B", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:group_clauses, "invalid field value"),
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
          parse_key_value(bytes, struct(PgQuery.SetOperationStmt))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.SetOperation)
              {[op: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[all: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[larg: Protox.MergeMessage.merge(msg.larg, PgQuery.Node.decode!(delimited))], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[rarg: Protox.MergeMessage.merge(msg.rarg, PgQuery.Node.decode!(delimited))], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[col_types: msg.col_types ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[col_typmods: msg.col_typmods ++ [PgQuery.Node.decode!(delimited)]], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[col_collations: msg.col_collations ++ [PgQuery.Node.decode!(delimited)]], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[group_clauses: msg.group_clauses ++ [PgQuery.Node.decode!(delimited)]], rest}

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
        PgQuery.SetOperationStmt,
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
        1 => {:op, {:scalar, :SET_OPERATION_UNDEFINED}, {:enum, PgQuery.SetOperation}},
        2 => {:all, {:scalar, false}, :bool},
        3 => {:larg, {:scalar, nil}, {:message, PgQuery.Node}},
        4 => {:rarg, {:scalar, nil}, {:message, PgQuery.Node}},
        5 => {:col_types, :unpacked, {:message, PgQuery.Node}},
        6 => {:col_typmods, :unpacked, {:message, PgQuery.Node}},
        7 => {:col_collations, :unpacked, {:message, PgQuery.Node}},
        8 => {:group_clauses, :unpacked, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        all: {2, {:scalar, false}, :bool},
        col_collations: {7, :unpacked, {:message, PgQuery.Node}},
        col_types: {5, :unpacked, {:message, PgQuery.Node}},
        col_typmods: {6, :unpacked, {:message, PgQuery.Node}},
        group_clauses: {8, :unpacked, {:message, PgQuery.Node}},
        larg: {3, {:scalar, nil}, {:message, PgQuery.Node}},
        op: {1, {:scalar, :SET_OPERATION_UNDEFINED}, {:enum, PgQuery.SetOperation}},
        rarg: {4, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "op",
          kind: {:scalar, :SET_OPERATION_UNDEFINED},
          label: :optional,
          name: :op,
          tag: 1,
          type: {:enum, PgQuery.SetOperation}
        },
        %{
          __struct__: Protox.Field,
          json_name: "all",
          kind: {:scalar, false},
          label: :optional,
          name: :all,
          tag: 2,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "larg",
          kind: {:scalar, nil},
          label: :optional,
          name: :larg,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rarg",
          kind: {:scalar, nil},
          label: :optional,
          name: :rarg,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "colTypes",
          kind: :unpacked,
          label: :repeated,
          name: :col_types,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "colTypmods",
          kind: :unpacked,
          label: :repeated,
          name: :col_typmods,
          tag: 6,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "colCollations",
          kind: :unpacked,
          label: :repeated,
          name: :col_collations,
          tag: 7,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "groupClauses",
          kind: :unpacked,
          label: :repeated,
          name: :group_clauses,
          tag: 8,
          type: {:message, PgQuery.Node}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:op) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "op",
             kind: {:scalar, :SET_OPERATION_UNDEFINED},
             label: :optional,
             name: :op,
             tag: 1,
             type: {:enum, PgQuery.SetOperation}
           }}
        end

        def field_def("op") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "op",
             kind: {:scalar, :SET_OPERATION_UNDEFINED},
             label: :optional,
             name: :op,
             tag: 1,
             type: {:enum, PgQuery.SetOperation}
           }}
        end

        []
      ),
      (
        def field_def(:all) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "all",
             kind: {:scalar, false},
             label: :optional,
             name: :all,
             tag: 2,
             type: :bool
           }}
        end

        def field_def("all") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "all",
             kind: {:scalar, false},
             label: :optional,
             name: :all,
             tag: 2,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:larg) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "larg",
             kind: {:scalar, nil},
             label: :optional,
             name: :larg,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("larg") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "larg",
             kind: {:scalar, nil},
             label: :optional,
             name: :larg,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:rarg) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rarg",
             kind: {:scalar, nil},
             label: :optional,
             name: :rarg,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("rarg") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rarg",
             kind: {:scalar, nil},
             label: :optional,
             name: :rarg,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:col_types) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colTypes",
             kind: :unpacked,
             label: :repeated,
             name: :col_types,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("colTypes") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colTypes",
             kind: :unpacked,
             label: :repeated,
             name: :col_types,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("col_types") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colTypes",
             kind: :unpacked,
             label: :repeated,
             name: :col_types,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:col_typmods) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colTypmods",
             kind: :unpacked,
             label: :repeated,
             name: :col_typmods,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("colTypmods") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colTypmods",
             kind: :unpacked,
             label: :repeated,
             name: :col_typmods,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("col_typmods") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colTypmods",
             kind: :unpacked,
             label: :repeated,
             name: :col_typmods,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:col_collations) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colCollations",
             kind: :unpacked,
             label: :repeated,
             name: :col_collations,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("colCollations") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colCollations",
             kind: :unpacked,
             label: :repeated,
             name: :col_collations,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("col_collations") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colCollations",
             kind: :unpacked,
             label: :repeated,
             name: :col_collations,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:group_clauses) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupClauses",
             kind: :unpacked,
             label: :repeated,
             name: :group_clauses,
             tag: 8,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("groupClauses") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupClauses",
             kind: :unpacked,
             label: :repeated,
             name: :group_clauses,
             tag: 8,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("group_clauses") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupClauses",
             kind: :unpacked,
             label: :repeated,
             name: :group_clauses,
             tag: 8,
             type: {:message, PgQuery.Node}
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
    def default(:op) do
      {:ok, :SET_OPERATION_UNDEFINED}
    end,
    def default(:all) do
      {:ok, false}
    end,
    def default(:larg) do
      {:ok, nil}
    end,
    def default(:rarg) do
      {:ok, nil}
    end,
    def default(:col_types) do
      {:error, :no_default_value}
    end,
    def default(:col_typmods) do
      {:error, :no_default_value}
    end,
    def default(:col_collations) do
      {:error, :no_default_value}
    end,
    def default(:group_clauses) do
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
