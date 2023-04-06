# credo:disable-for-this-file
defmodule PgQuery.SelectStmt do
  @moduledoc false
  defstruct distinct_clause: [],
            into_clause: nil,
            target_list: [],
            from_clause: [],
            where_clause: nil,
            group_clause: [],
            group_distinct: false,
            having_clause: nil,
            window_clause: [],
            values_lists: [],
            sort_clause: [],
            limit_offset: nil,
            limit_count: nil,
            limit_option: :LIMIT_OPTION_UNDEFINED,
            locking_clause: [],
            with_clause: nil,
            op: :SET_OPERATION_UNDEFINED,
            all: false,
            larg: nil,
            rarg: nil

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
        |> encode_distinct_clause(msg)
        |> encode_into_clause(msg)
        |> encode_target_list(msg)
        |> encode_from_clause(msg)
        |> encode_where_clause(msg)
        |> encode_group_clause(msg)
        |> encode_group_distinct(msg)
        |> encode_having_clause(msg)
        |> encode_window_clause(msg)
        |> encode_values_lists(msg)
        |> encode_sort_clause(msg)
        |> encode_limit_offset(msg)
        |> encode_limit_count(msg)
        |> encode_limit_option(msg)
        |> encode_locking_clause(msg)
        |> encode_with_clause(msg)
        |> encode_op(msg)
        |> encode_all(msg)
        |> encode_larg(msg)
        |> encode_rarg(msg)
      end
    )

    []

    [
      defp encode_distinct_clause(acc, msg) do
        try do
          case msg.distinct_clause do
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
            reraise Protox.EncodingError.new(:distinct_clause, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_into_clause(acc, msg) do
        try do
          if msg.into_clause == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.into_clause)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:into_clause, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_target_list(acc, msg) do
        try do
          case msg.target_list do
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
            reraise Protox.EncodingError.new(:target_list, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_from_clause(acc, msg) do
        try do
          case msg.from_clause do
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
            reraise Protox.EncodingError.new(:from_clause, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_where_clause(acc, msg) do
        try do
          if msg.where_clause == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.where_clause)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:where_clause, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_group_clause(acc, msg) do
        try do
          case msg.group_clause do
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
            reraise Protox.EncodingError.new(:group_clause, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_group_distinct(acc, msg) do
        try do
          if msg.group_distinct == false do
            acc
          else
            [acc, "8", Protox.Encode.encode_bool(msg.group_distinct)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:group_distinct, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_having_clause(acc, msg) do
        try do
          if msg.having_clause == nil do
            acc
          else
            [acc, "B", Protox.Encode.encode_message(msg.having_clause)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:having_clause, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_window_clause(acc, msg) do
        try do
          case msg.window_clause do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "J", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:window_clause, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_values_lists(acc, msg) do
        try do
          case msg.values_lists do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "R", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:values_lists, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_sort_clause(acc, msg) do
        try do
          case msg.sort_clause do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "Z", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sort_clause, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_limit_offset(acc, msg) do
        try do
          if msg.limit_offset == nil do
            acc
          else
            [acc, "b", Protox.Encode.encode_message(msg.limit_offset)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:limit_offset, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_limit_count(acc, msg) do
        try do
          if msg.limit_count == nil do
            acc
          else
            [acc, "j", Protox.Encode.encode_message(msg.limit_count)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:limit_count, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_limit_option(acc, msg) do
        try do
          if msg.limit_option == :LIMIT_OPTION_UNDEFINED do
            acc
          else
            [
              acc,
              "p",
              msg.limit_option |> PgQuery.LimitOption.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:limit_option, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_locking_clause(acc, msg) do
        try do
          case msg.locking_clause do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "z", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:locking_clause, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_with_clause(acc, msg) do
        try do
          if msg.with_clause == nil do
            acc
          else
            [acc, "\x82\x01", Protox.Encode.encode_message(msg.with_clause)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:with_clause, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_op(acc, msg) do
        try do
          if msg.op == :SET_OPERATION_UNDEFINED do
            acc
          else
            [
              acc,
              "\x88\x01",
              msg.op |> PgQuery.SetOperation.encode() |> Protox.Encode.encode_enum()
            ]
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
            [acc, "\x90\x01", Protox.Encode.encode_bool(msg.all)]
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
            [acc, "\x9A\x01", Protox.Encode.encode_message(msg.larg)]
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
            [acc, "\xA2\x01", Protox.Encode.encode_message(msg.rarg)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rarg, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.SelectStmt))
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
              {[distinct_clause: msg.distinct_clause ++ [PgQuery.Node.decode!(delimited)]], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 into_clause:
                   Protox.MergeMessage.merge(
                     msg.into_clause,
                     PgQuery.IntoClause.decode!(delimited)
                   )
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[target_list: msg.target_list ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[from_clause: msg.from_clause ++ [PgQuery.Node.decode!(delimited)]], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 where_clause:
                   Protox.MergeMessage.merge(msg.where_clause, PgQuery.Node.decode!(delimited))
               ], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[group_clause: msg.group_clause ++ [PgQuery.Node.decode!(delimited)]], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[group_distinct: value], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 having_clause:
                   Protox.MergeMessage.merge(msg.having_clause, PgQuery.Node.decode!(delimited))
               ], rest}

            {9, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[window_clause: msg.window_clause ++ [PgQuery.Node.decode!(delimited)]], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[values_lists: msg.values_lists ++ [PgQuery.Node.decode!(delimited)]], rest}

            {11, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[sort_clause: msg.sort_clause ++ [PgQuery.Node.decode!(delimited)]], rest}

            {12, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 limit_offset:
                   Protox.MergeMessage.merge(msg.limit_offset, PgQuery.Node.decode!(delimited))
               ], rest}

            {13, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 limit_count:
                   Protox.MergeMessage.merge(msg.limit_count, PgQuery.Node.decode!(delimited))
               ], rest}

            {14, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.LimitOption)
              {[limit_option: value], rest}

            {15, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[locking_clause: msg.locking_clause ++ [PgQuery.Node.decode!(delimited)]], rest}

            {16, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 with_clause:
                   Protox.MergeMessage.merge(
                     msg.with_clause,
                     PgQuery.WithClause.decode!(delimited)
                   )
               ], rest}

            {17, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.SetOperation)
              {[op: value], rest}

            {18, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[all: value], rest}

            {19, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[larg: Protox.MergeMessage.merge(msg.larg, PgQuery.SelectStmt.decode!(delimited))],
               rest}

            {20, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[rarg: Protox.MergeMessage.merge(msg.rarg, PgQuery.SelectStmt.decode!(delimited))],
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
        PgQuery.SelectStmt,
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
        1 => {:distinct_clause, :unpacked, {:message, PgQuery.Node}},
        2 => {:into_clause, {:scalar, nil}, {:message, PgQuery.IntoClause}},
        3 => {:target_list, :unpacked, {:message, PgQuery.Node}},
        4 => {:from_clause, :unpacked, {:message, PgQuery.Node}},
        5 => {:where_clause, {:scalar, nil}, {:message, PgQuery.Node}},
        6 => {:group_clause, :unpacked, {:message, PgQuery.Node}},
        7 => {:group_distinct, {:scalar, false}, :bool},
        8 => {:having_clause, {:scalar, nil}, {:message, PgQuery.Node}},
        9 => {:window_clause, :unpacked, {:message, PgQuery.Node}},
        10 => {:values_lists, :unpacked, {:message, PgQuery.Node}},
        11 => {:sort_clause, :unpacked, {:message, PgQuery.Node}},
        12 => {:limit_offset, {:scalar, nil}, {:message, PgQuery.Node}},
        13 => {:limit_count, {:scalar, nil}, {:message, PgQuery.Node}},
        14 => {:limit_option, {:scalar, :LIMIT_OPTION_UNDEFINED}, {:enum, PgQuery.LimitOption}},
        15 => {:locking_clause, :unpacked, {:message, PgQuery.Node}},
        16 => {:with_clause, {:scalar, nil}, {:message, PgQuery.WithClause}},
        17 => {:op, {:scalar, :SET_OPERATION_UNDEFINED}, {:enum, PgQuery.SetOperation}},
        18 => {:all, {:scalar, false}, :bool},
        19 => {:larg, {:scalar, nil}, {:message, PgQuery.SelectStmt}},
        20 => {:rarg, {:scalar, nil}, {:message, PgQuery.SelectStmt}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        all: {18, {:scalar, false}, :bool},
        distinct_clause: {1, :unpacked, {:message, PgQuery.Node}},
        from_clause: {4, :unpacked, {:message, PgQuery.Node}},
        group_clause: {6, :unpacked, {:message, PgQuery.Node}},
        group_distinct: {7, {:scalar, false}, :bool},
        having_clause: {8, {:scalar, nil}, {:message, PgQuery.Node}},
        into_clause: {2, {:scalar, nil}, {:message, PgQuery.IntoClause}},
        larg: {19, {:scalar, nil}, {:message, PgQuery.SelectStmt}},
        limit_count: {13, {:scalar, nil}, {:message, PgQuery.Node}},
        limit_offset: {12, {:scalar, nil}, {:message, PgQuery.Node}},
        limit_option: {14, {:scalar, :LIMIT_OPTION_UNDEFINED}, {:enum, PgQuery.LimitOption}},
        locking_clause: {15, :unpacked, {:message, PgQuery.Node}},
        op: {17, {:scalar, :SET_OPERATION_UNDEFINED}, {:enum, PgQuery.SetOperation}},
        rarg: {20, {:scalar, nil}, {:message, PgQuery.SelectStmt}},
        sort_clause: {11, :unpacked, {:message, PgQuery.Node}},
        target_list: {3, :unpacked, {:message, PgQuery.Node}},
        values_lists: {10, :unpacked, {:message, PgQuery.Node}},
        where_clause: {5, {:scalar, nil}, {:message, PgQuery.Node}},
        window_clause: {9, :unpacked, {:message, PgQuery.Node}},
        with_clause: {16, {:scalar, nil}, {:message, PgQuery.WithClause}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "distinctClause",
          kind: :unpacked,
          label: :repeated,
          name: :distinct_clause,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "intoClause",
          kind: {:scalar, nil},
          label: :optional,
          name: :into_clause,
          tag: 2,
          type: {:message, PgQuery.IntoClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "targetList",
          kind: :unpacked,
          label: :repeated,
          name: :target_list,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "fromClause",
          kind: :unpacked,
          label: :repeated,
          name: :from_clause,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "whereClause",
          kind: {:scalar, nil},
          label: :optional,
          name: :where_clause,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "groupClause",
          kind: :unpacked,
          label: :repeated,
          name: :group_clause,
          tag: 6,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "groupDistinct",
          kind: {:scalar, false},
          label: :optional,
          name: :group_distinct,
          tag: 7,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "havingClause",
          kind: {:scalar, nil},
          label: :optional,
          name: :having_clause,
          tag: 8,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "windowClause",
          kind: :unpacked,
          label: :repeated,
          name: :window_clause,
          tag: 9,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "valuesLists",
          kind: :unpacked,
          label: :repeated,
          name: :values_lists,
          tag: 10,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "sortClause",
          kind: :unpacked,
          label: :repeated,
          name: :sort_clause,
          tag: 11,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "limitOffset",
          kind: {:scalar, nil},
          label: :optional,
          name: :limit_offset,
          tag: 12,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "limitCount",
          kind: {:scalar, nil},
          label: :optional,
          name: :limit_count,
          tag: 13,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "limitOption",
          kind: {:scalar, :LIMIT_OPTION_UNDEFINED},
          label: :optional,
          name: :limit_option,
          tag: 14,
          type: {:enum, PgQuery.LimitOption}
        },
        %{
          __struct__: Protox.Field,
          json_name: "lockingClause",
          kind: :unpacked,
          label: :repeated,
          name: :locking_clause,
          tag: 15,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "withClause",
          kind: {:scalar, nil},
          label: :optional,
          name: :with_clause,
          tag: 16,
          type: {:message, PgQuery.WithClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "op",
          kind: {:scalar, :SET_OPERATION_UNDEFINED},
          label: :optional,
          name: :op,
          tag: 17,
          type: {:enum, PgQuery.SetOperation}
        },
        %{
          __struct__: Protox.Field,
          json_name: "all",
          kind: {:scalar, false},
          label: :optional,
          name: :all,
          tag: 18,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "larg",
          kind: {:scalar, nil},
          label: :optional,
          name: :larg,
          tag: 19,
          type: {:message, PgQuery.SelectStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rarg",
          kind: {:scalar, nil},
          label: :optional,
          name: :rarg,
          tag: 20,
          type: {:message, PgQuery.SelectStmt}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:distinct_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "distinctClause",
             kind: :unpacked,
             label: :repeated,
             name: :distinct_clause,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("distinctClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "distinctClause",
             kind: :unpacked,
             label: :repeated,
             name: :distinct_clause,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("distinct_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "distinctClause",
             kind: :unpacked,
             label: :repeated,
             name: :distinct_clause,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:into_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "intoClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :into_clause,
             tag: 2,
             type: {:message, PgQuery.IntoClause}
           }}
        end

        def field_def("intoClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "intoClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :into_clause,
             tag: 2,
             type: {:message, PgQuery.IntoClause}
           }}
        end

        def field_def("into_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "intoClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :into_clause,
             tag: 2,
             type: {:message, PgQuery.IntoClause}
           }}
        end
      ),
      (
        def field_def(:target_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "targetList",
             kind: :unpacked,
             label: :repeated,
             name: :target_list,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("targetList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "targetList",
             kind: :unpacked,
             label: :repeated,
             name: :target_list,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("target_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "targetList",
             kind: :unpacked,
             label: :repeated,
             name: :target_list,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:from_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fromClause",
             kind: :unpacked,
             label: :repeated,
             name: :from_clause,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("fromClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fromClause",
             kind: :unpacked,
             label: :repeated,
             name: :from_clause,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("from_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fromClause",
             kind: :unpacked,
             label: :repeated,
             name: :from_clause,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:where_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "whereClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :where_clause,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("whereClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "whereClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :where_clause,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("where_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "whereClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :where_clause,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:group_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupClause",
             kind: :unpacked,
             label: :repeated,
             name: :group_clause,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("groupClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupClause",
             kind: :unpacked,
             label: :repeated,
             name: :group_clause,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("group_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupClause",
             kind: :unpacked,
             label: :repeated,
             name: :group_clause,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:group_distinct) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupDistinct",
             kind: {:scalar, false},
             label: :optional,
             name: :group_distinct,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("groupDistinct") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupDistinct",
             kind: {:scalar, false},
             label: :optional,
             name: :group_distinct,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("group_distinct") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupDistinct",
             kind: {:scalar, false},
             label: :optional,
             name: :group_distinct,
             tag: 7,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:having_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "havingClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :having_clause,
             tag: 8,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("havingClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "havingClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :having_clause,
             tag: 8,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("having_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "havingClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :having_clause,
             tag: 8,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:window_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "windowClause",
             kind: :unpacked,
             label: :repeated,
             name: :window_clause,
             tag: 9,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("windowClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "windowClause",
             kind: :unpacked,
             label: :repeated,
             name: :window_clause,
             tag: 9,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("window_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "windowClause",
             kind: :unpacked,
             label: :repeated,
             name: :window_clause,
             tag: 9,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:values_lists) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "valuesLists",
             kind: :unpacked,
             label: :repeated,
             name: :values_lists,
             tag: 10,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("valuesLists") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "valuesLists",
             kind: :unpacked,
             label: :repeated,
             name: :values_lists,
             tag: 10,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("values_lists") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "valuesLists",
             kind: :unpacked,
             label: :repeated,
             name: :values_lists,
             tag: 10,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:sort_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sortClause",
             kind: :unpacked,
             label: :repeated,
             name: :sort_clause,
             tag: 11,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("sortClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sortClause",
             kind: :unpacked,
             label: :repeated,
             name: :sort_clause,
             tag: 11,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("sort_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sortClause",
             kind: :unpacked,
             label: :repeated,
             name: :sort_clause,
             tag: 11,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:limit_offset) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "limitOffset",
             kind: {:scalar, nil},
             label: :optional,
             name: :limit_offset,
             tag: 12,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("limitOffset") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "limitOffset",
             kind: {:scalar, nil},
             label: :optional,
             name: :limit_offset,
             tag: 12,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("limit_offset") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "limitOffset",
             kind: {:scalar, nil},
             label: :optional,
             name: :limit_offset,
             tag: 12,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:limit_count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "limitCount",
             kind: {:scalar, nil},
             label: :optional,
             name: :limit_count,
             tag: 13,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("limitCount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "limitCount",
             kind: {:scalar, nil},
             label: :optional,
             name: :limit_count,
             tag: 13,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("limit_count") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "limitCount",
             kind: {:scalar, nil},
             label: :optional,
             name: :limit_count,
             tag: 13,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:limit_option) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "limitOption",
             kind: {:scalar, :LIMIT_OPTION_UNDEFINED},
             label: :optional,
             name: :limit_option,
             tag: 14,
             type: {:enum, PgQuery.LimitOption}
           }}
        end

        def field_def("limitOption") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "limitOption",
             kind: {:scalar, :LIMIT_OPTION_UNDEFINED},
             label: :optional,
             name: :limit_option,
             tag: 14,
             type: {:enum, PgQuery.LimitOption}
           }}
        end

        def field_def("limit_option") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "limitOption",
             kind: {:scalar, :LIMIT_OPTION_UNDEFINED},
             label: :optional,
             name: :limit_option,
             tag: 14,
             type: {:enum, PgQuery.LimitOption}
           }}
        end
      ),
      (
        def field_def(:locking_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lockingClause",
             kind: :unpacked,
             label: :repeated,
             name: :locking_clause,
             tag: 15,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("lockingClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lockingClause",
             kind: :unpacked,
             label: :repeated,
             name: :locking_clause,
             tag: 15,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("locking_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lockingClause",
             kind: :unpacked,
             label: :repeated,
             name: :locking_clause,
             tag: 15,
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
             tag: 16,
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
             tag: 16,
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
             tag: 16,
             type: {:message, PgQuery.WithClause}
           }}
        end
      ),
      (
        def field_def(:op) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "op",
             kind: {:scalar, :SET_OPERATION_UNDEFINED},
             label: :optional,
             name: :op,
             tag: 17,
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
             tag: 17,
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
             tag: 18,
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
             tag: 18,
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
             tag: 19,
             type: {:message, PgQuery.SelectStmt}
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
             tag: 19,
             type: {:message, PgQuery.SelectStmt}
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
             tag: 20,
             type: {:message, PgQuery.SelectStmt}
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
             tag: 20,
             type: {:message, PgQuery.SelectStmt}
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
    def default(:distinct_clause) do
      {:error, :no_default_value}
    end,
    def default(:into_clause) do
      {:ok, nil}
    end,
    def default(:target_list) do
      {:error, :no_default_value}
    end,
    def default(:from_clause) do
      {:error, :no_default_value}
    end,
    def default(:where_clause) do
      {:ok, nil}
    end,
    def default(:group_clause) do
      {:error, :no_default_value}
    end,
    def default(:group_distinct) do
      {:ok, false}
    end,
    def default(:having_clause) do
      {:ok, nil}
    end,
    def default(:window_clause) do
      {:error, :no_default_value}
    end,
    def default(:values_lists) do
      {:error, :no_default_value}
    end,
    def default(:sort_clause) do
      {:error, :no_default_value}
    end,
    def default(:limit_offset) do
      {:ok, nil}
    end,
    def default(:limit_count) do
      {:ok, nil}
    end,
    def default(:limit_option) do
      {:ok, :LIMIT_OPTION_UNDEFINED}
    end,
    def default(:locking_clause) do
      {:error, :no_default_value}
    end,
    def default(:with_clause) do
      {:ok, nil}
    end,
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
