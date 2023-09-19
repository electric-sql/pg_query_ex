# credo:disable-for-this-file
defmodule PgQuery.Query do
  @moduledoc false
  defstruct command_type: :CMD_TYPE_UNDEFINED,
            query_source: :QUERY_SOURCE_UNDEFINED,
            can_set_tag: false,
            utility_stmt: nil,
            result_relation: 0,
            has_aggs: false,
            has_window_funcs: false,
            has_target_srfs: false,
            has_sub_links: false,
            has_distinct_on: false,
            has_recursive: false,
            has_modifying_cte: false,
            has_for_update: false,
            has_row_security: false,
            is_return: false,
            cte_list: [],
            rtable: [],
            jointree: nil,
            merge_action_list: [],
            merge_use_outer_join: false,
            target_list: [],
            override: :OVERRIDING_KIND_UNDEFINED,
            on_conflict: nil,
            returning_list: [],
            group_clause: [],
            group_distinct: false,
            grouping_sets: [],
            having_qual: nil,
            window_clause: [],
            distinct_clause: [],
            sort_clause: [],
            limit_offset: nil,
            limit_count: nil,
            limit_option: :LIMIT_OPTION_UNDEFINED,
            row_marks: [],
            set_operations: nil,
            constraint_deps: [],
            with_check_options: [],
            stmt_location: 0,
            stmt_len: 0

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
        |> encode_command_type(msg)
        |> encode_query_source(msg)
        |> encode_can_set_tag(msg)
        |> encode_utility_stmt(msg)
        |> encode_result_relation(msg)
        |> encode_has_aggs(msg)
        |> encode_has_window_funcs(msg)
        |> encode_has_target_srfs(msg)
        |> encode_has_sub_links(msg)
        |> encode_has_distinct_on(msg)
        |> encode_has_recursive(msg)
        |> encode_has_modifying_cte(msg)
        |> encode_has_for_update(msg)
        |> encode_has_row_security(msg)
        |> encode_is_return(msg)
        |> encode_cte_list(msg)
        |> encode_rtable(msg)
        |> encode_jointree(msg)
        |> encode_merge_action_list(msg)
        |> encode_merge_use_outer_join(msg)
        |> encode_target_list(msg)
        |> encode_override(msg)
        |> encode_on_conflict(msg)
        |> encode_returning_list(msg)
        |> encode_group_clause(msg)
        |> encode_group_distinct(msg)
        |> encode_grouping_sets(msg)
        |> encode_having_qual(msg)
        |> encode_window_clause(msg)
        |> encode_distinct_clause(msg)
        |> encode_sort_clause(msg)
        |> encode_limit_offset(msg)
        |> encode_limit_count(msg)
        |> encode_limit_option(msg)
        |> encode_row_marks(msg)
        |> encode_set_operations(msg)
        |> encode_constraint_deps(msg)
        |> encode_with_check_options(msg)
        |> encode_stmt_location(msg)
        |> encode_stmt_len(msg)
      end
    )

    []

    [
      defp encode_command_type(acc, msg) do
        try do
          if msg.command_type == :CMD_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "\b",
              msg.command_type |> PgQuery.CmdType.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:command_type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_query_source(acc, msg) do
        try do
          if msg.query_source == :QUERY_SOURCE_UNDEFINED do
            acc
          else
            [
              acc,
              "\x10",
              msg.query_source |> PgQuery.QuerySource.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:query_source, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_can_set_tag(acc, msg) do
        try do
          if msg.can_set_tag == false do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_bool(msg.can_set_tag)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:can_set_tag, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_utility_stmt(acc, msg) do
        try do
          if msg.utility_stmt == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.utility_stmt)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:utility_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_result_relation(acc, msg) do
        try do
          if msg.result_relation == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_int32(msg.result_relation)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:result_relation, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_has_aggs(acc, msg) do
        try do
          if msg.has_aggs == false do
            acc
          else
            [acc, "0", Protox.Encode.encode_bool(msg.has_aggs)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:has_aggs, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_has_window_funcs(acc, msg) do
        try do
          if msg.has_window_funcs == false do
            acc
          else
            [acc, "8", Protox.Encode.encode_bool(msg.has_window_funcs)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:has_window_funcs, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_has_target_srfs(acc, msg) do
        try do
          if msg.has_target_srfs == false do
            acc
          else
            [acc, "@", Protox.Encode.encode_bool(msg.has_target_srfs)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:has_target_srfs, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_has_sub_links(acc, msg) do
        try do
          if msg.has_sub_links == false do
            acc
          else
            [acc, "H", Protox.Encode.encode_bool(msg.has_sub_links)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:has_sub_links, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_has_distinct_on(acc, msg) do
        try do
          if msg.has_distinct_on == false do
            acc
          else
            [acc, "P", Protox.Encode.encode_bool(msg.has_distinct_on)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:has_distinct_on, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_has_recursive(acc, msg) do
        try do
          if msg.has_recursive == false do
            acc
          else
            [acc, "X", Protox.Encode.encode_bool(msg.has_recursive)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:has_recursive, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_has_modifying_cte(acc, msg) do
        try do
          if msg.has_modifying_cte == false do
            acc
          else
            [acc, "`", Protox.Encode.encode_bool(msg.has_modifying_cte)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:has_modifying_cte, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_has_for_update(acc, msg) do
        try do
          if msg.has_for_update == false do
            acc
          else
            [acc, "h", Protox.Encode.encode_bool(msg.has_for_update)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:has_for_update, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_has_row_security(acc, msg) do
        try do
          if msg.has_row_security == false do
            acc
          else
            [acc, "p", Protox.Encode.encode_bool(msg.has_row_security)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:has_row_security, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_is_return(acc, msg) do
        try do
          if msg.is_return == false do
            acc
          else
            [acc, "x", Protox.Encode.encode_bool(msg.is_return)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_return, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_cte_list(acc, msg) do
        try do
          case msg.cte_list do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x82\x01", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:cte_list, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rtable(acc, msg) do
        try do
          case msg.rtable do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x8A\x01", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rtable, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_jointree(acc, msg) do
        try do
          if msg.jointree == nil do
            acc
          else
            [acc, "\x92\x01", Protox.Encode.encode_message(msg.jointree)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:jointree, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_merge_action_list(acc, msg) do
        try do
          case msg.merge_action_list do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x9A\x01", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:merge_action_list, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_merge_use_outer_join(acc, msg) do
        try do
          if msg.merge_use_outer_join == false do
            acc
          else
            [acc, "\xA0\x01", Protox.Encode.encode_bool(msg.merge_use_outer_join)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:merge_use_outer_join, "invalid field value"),
                    __STACKTRACE__
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
                  [acc, "\xAA\x01", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:target_list, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_override(acc, msg) do
        try do
          if msg.override == :OVERRIDING_KIND_UNDEFINED do
            acc
          else
            [
              acc,
              "\xB0\x01",
              msg.override |> PgQuery.OverridingKind.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:override, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_on_conflict(acc, msg) do
        try do
          if msg.on_conflict == nil do
            acc
          else
            [acc, "\xBA\x01", Protox.Encode.encode_message(msg.on_conflict)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:on_conflict, "invalid field value"), __STACKTRACE__
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
                  [acc, "\xC2\x01", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:returning_list, "invalid field value"),
                    __STACKTRACE__
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
                  [acc, "\xCA\x01", Protox.Encode.encode_message(value)]
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
            [acc, "\xD0\x01", Protox.Encode.encode_bool(msg.group_distinct)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:group_distinct, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_grouping_sets(acc, msg) do
        try do
          case msg.grouping_sets do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\xDA\x01", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:grouping_sets, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_having_qual(acc, msg) do
        try do
          if msg.having_qual == nil do
            acc
          else
            [acc, "\xE2\x01", Protox.Encode.encode_message(msg.having_qual)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:having_qual, "invalid field value"), __STACKTRACE__
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
                  [acc, "\xEA\x01", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:window_clause, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_distinct_clause(acc, msg) do
        try do
          case msg.distinct_clause do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\xF2\x01", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:distinct_clause, "invalid field value"),
                    __STACKTRACE__
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
                  [acc, "\xFA\x01", Protox.Encode.encode_message(value)]
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
            [acc, "\x82\x02", Protox.Encode.encode_message(msg.limit_offset)]
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
            [acc, "\x8A\x02", Protox.Encode.encode_message(msg.limit_count)]
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
              "\x90\x02",
              msg.limit_option |> PgQuery.LimitOption.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:limit_option, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_row_marks(acc, msg) do
        try do
          case msg.row_marks do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x9A\x02", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:row_marks, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_set_operations(acc, msg) do
        try do
          if msg.set_operations == nil do
            acc
          else
            [acc, "\xA2\x02", Protox.Encode.encode_message(msg.set_operations)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:set_operations, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_constraint_deps(acc, msg) do
        try do
          case msg.constraint_deps do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\xAA\x02", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:constraint_deps, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_with_check_options(acc, msg) do
        try do
          case msg.with_check_options do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\xB2\x02", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:with_check_options, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_stmt_location(acc, msg) do
        try do
          if msg.stmt_location == 0 do
            acc
          else
            [acc, "\xB8\x02", Protox.Encode.encode_int32(msg.stmt_location)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:stmt_location, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_stmt_len(acc, msg) do
        try do
          if msg.stmt_len == 0 do
            acc
          else
            [acc, "\xC0\x02", Protox.Encode.encode_int32(msg.stmt_len)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:stmt_len, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.Query))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.CmdType)
              {[command_type: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.QuerySource)
              {[query_source: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[can_set_tag: value], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 utility_stmt:
                   Protox.MergeMessage.merge(msg.utility_stmt, PgQuery.Node.decode!(delimited))
               ], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[result_relation: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[has_aggs: value], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[has_window_funcs: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[has_target_srfs: value], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[has_sub_links: value], rest}

            {10, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[has_distinct_on: value], rest}

            {11, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[has_recursive: value], rest}

            {12, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[has_modifying_cte: value], rest}

            {13, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[has_for_update: value], rest}

            {14, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[has_row_security: value], rest}

            {15, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_return: value], rest}

            {16, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[cte_list: msg.cte_list ++ [PgQuery.Node.decode!(delimited)]], rest}

            {17, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[rtable: msg.rtable ++ [PgQuery.Node.decode!(delimited)]], rest}

            {18, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 jointree:
                   Protox.MergeMessage.merge(msg.jointree, PgQuery.FromExpr.decode!(delimited))
               ], rest}

            {19, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[merge_action_list: msg.merge_action_list ++ [PgQuery.Node.decode!(delimited)]],
               rest}

            {20, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[merge_use_outer_join: value], rest}

            {21, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[target_list: msg.target_list ++ [PgQuery.Node.decode!(delimited)]], rest}

            {22, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.OverridingKind)
              {[override: value], rest}

            {23, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 on_conflict:
                   Protox.MergeMessage.merge(
                     msg.on_conflict,
                     PgQuery.OnConflictExpr.decode!(delimited)
                   )
               ], rest}

            {24, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[returning_list: msg.returning_list ++ [PgQuery.Node.decode!(delimited)]], rest}

            {25, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[group_clause: msg.group_clause ++ [PgQuery.Node.decode!(delimited)]], rest}

            {26, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[group_distinct: value], rest}

            {27, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[grouping_sets: msg.grouping_sets ++ [PgQuery.Node.decode!(delimited)]], rest}

            {28, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 having_qual:
                   Protox.MergeMessage.merge(msg.having_qual, PgQuery.Node.decode!(delimited))
               ], rest}

            {29, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[window_clause: msg.window_clause ++ [PgQuery.Node.decode!(delimited)]], rest}

            {30, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[distinct_clause: msg.distinct_clause ++ [PgQuery.Node.decode!(delimited)]], rest}

            {31, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[sort_clause: msg.sort_clause ++ [PgQuery.Node.decode!(delimited)]], rest}

            {32, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 limit_offset:
                   Protox.MergeMessage.merge(msg.limit_offset, PgQuery.Node.decode!(delimited))
               ], rest}

            {33, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 limit_count:
                   Protox.MergeMessage.merge(msg.limit_count, PgQuery.Node.decode!(delimited))
               ], rest}

            {34, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.LimitOption)
              {[limit_option: value], rest}

            {35, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[row_marks: msg.row_marks ++ [PgQuery.Node.decode!(delimited)]], rest}

            {36, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 set_operations:
                   Protox.MergeMessage.merge(msg.set_operations, PgQuery.Node.decode!(delimited))
               ], rest}

            {37, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[constraint_deps: msg.constraint_deps ++ [PgQuery.Node.decode!(delimited)]], rest}

            {38, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[with_check_options: msg.with_check_options ++ [PgQuery.Node.decode!(delimited)]],
               rest}

            {39, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[stmt_location: value], rest}

            {40, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[stmt_len: value], rest}

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
        PgQuery.Query,
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
        1 => {:command_type, {:scalar, :CMD_TYPE_UNDEFINED}, {:enum, PgQuery.CmdType}},
        2 => {:query_source, {:scalar, :QUERY_SOURCE_UNDEFINED}, {:enum, PgQuery.QuerySource}},
        3 => {:can_set_tag, {:scalar, false}, :bool},
        4 => {:utility_stmt, {:scalar, nil}, {:message, PgQuery.Node}},
        5 => {:result_relation, {:scalar, 0}, :int32},
        6 => {:has_aggs, {:scalar, false}, :bool},
        7 => {:has_window_funcs, {:scalar, false}, :bool},
        8 => {:has_target_srfs, {:scalar, false}, :bool},
        9 => {:has_sub_links, {:scalar, false}, :bool},
        10 => {:has_distinct_on, {:scalar, false}, :bool},
        11 => {:has_recursive, {:scalar, false}, :bool},
        12 => {:has_modifying_cte, {:scalar, false}, :bool},
        13 => {:has_for_update, {:scalar, false}, :bool},
        14 => {:has_row_security, {:scalar, false}, :bool},
        15 => {:is_return, {:scalar, false}, :bool},
        16 => {:cte_list, :unpacked, {:message, PgQuery.Node}},
        17 => {:rtable, :unpacked, {:message, PgQuery.Node}},
        18 => {:jointree, {:scalar, nil}, {:message, PgQuery.FromExpr}},
        19 => {:merge_action_list, :unpacked, {:message, PgQuery.Node}},
        20 => {:merge_use_outer_join, {:scalar, false}, :bool},
        21 => {:target_list, :unpacked, {:message, PgQuery.Node}},
        22 => {:override, {:scalar, :OVERRIDING_KIND_UNDEFINED}, {:enum, PgQuery.OverridingKind}},
        23 => {:on_conflict, {:scalar, nil}, {:message, PgQuery.OnConflictExpr}},
        24 => {:returning_list, :unpacked, {:message, PgQuery.Node}},
        25 => {:group_clause, :unpacked, {:message, PgQuery.Node}},
        26 => {:group_distinct, {:scalar, false}, :bool},
        27 => {:grouping_sets, :unpacked, {:message, PgQuery.Node}},
        28 => {:having_qual, {:scalar, nil}, {:message, PgQuery.Node}},
        29 => {:window_clause, :unpacked, {:message, PgQuery.Node}},
        30 => {:distinct_clause, :unpacked, {:message, PgQuery.Node}},
        31 => {:sort_clause, :unpacked, {:message, PgQuery.Node}},
        32 => {:limit_offset, {:scalar, nil}, {:message, PgQuery.Node}},
        33 => {:limit_count, {:scalar, nil}, {:message, PgQuery.Node}},
        34 => {:limit_option, {:scalar, :LIMIT_OPTION_UNDEFINED}, {:enum, PgQuery.LimitOption}},
        35 => {:row_marks, :unpacked, {:message, PgQuery.Node}},
        36 => {:set_operations, {:scalar, nil}, {:message, PgQuery.Node}},
        37 => {:constraint_deps, :unpacked, {:message, PgQuery.Node}},
        38 => {:with_check_options, :unpacked, {:message, PgQuery.Node}},
        39 => {:stmt_location, {:scalar, 0}, :int32},
        40 => {:stmt_len, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        can_set_tag: {3, {:scalar, false}, :bool},
        command_type: {1, {:scalar, :CMD_TYPE_UNDEFINED}, {:enum, PgQuery.CmdType}},
        constraint_deps: {37, :unpacked, {:message, PgQuery.Node}},
        cte_list: {16, :unpacked, {:message, PgQuery.Node}},
        distinct_clause: {30, :unpacked, {:message, PgQuery.Node}},
        group_clause: {25, :unpacked, {:message, PgQuery.Node}},
        group_distinct: {26, {:scalar, false}, :bool},
        grouping_sets: {27, :unpacked, {:message, PgQuery.Node}},
        has_aggs: {6, {:scalar, false}, :bool},
        has_distinct_on: {10, {:scalar, false}, :bool},
        has_for_update: {13, {:scalar, false}, :bool},
        has_modifying_cte: {12, {:scalar, false}, :bool},
        has_recursive: {11, {:scalar, false}, :bool},
        has_row_security: {14, {:scalar, false}, :bool},
        has_sub_links: {9, {:scalar, false}, :bool},
        has_target_srfs: {8, {:scalar, false}, :bool},
        has_window_funcs: {7, {:scalar, false}, :bool},
        having_qual: {28, {:scalar, nil}, {:message, PgQuery.Node}},
        is_return: {15, {:scalar, false}, :bool},
        jointree: {18, {:scalar, nil}, {:message, PgQuery.FromExpr}},
        limit_count: {33, {:scalar, nil}, {:message, PgQuery.Node}},
        limit_offset: {32, {:scalar, nil}, {:message, PgQuery.Node}},
        limit_option: {34, {:scalar, :LIMIT_OPTION_UNDEFINED}, {:enum, PgQuery.LimitOption}},
        merge_action_list: {19, :unpacked, {:message, PgQuery.Node}},
        merge_use_outer_join: {20, {:scalar, false}, :bool},
        on_conflict: {23, {:scalar, nil}, {:message, PgQuery.OnConflictExpr}},
        override: {22, {:scalar, :OVERRIDING_KIND_UNDEFINED}, {:enum, PgQuery.OverridingKind}},
        query_source: {2, {:scalar, :QUERY_SOURCE_UNDEFINED}, {:enum, PgQuery.QuerySource}},
        result_relation: {5, {:scalar, 0}, :int32},
        returning_list: {24, :unpacked, {:message, PgQuery.Node}},
        row_marks: {35, :unpacked, {:message, PgQuery.Node}},
        rtable: {17, :unpacked, {:message, PgQuery.Node}},
        set_operations: {36, {:scalar, nil}, {:message, PgQuery.Node}},
        sort_clause: {31, :unpacked, {:message, PgQuery.Node}},
        stmt_len: {40, {:scalar, 0}, :int32},
        stmt_location: {39, {:scalar, 0}, :int32},
        target_list: {21, :unpacked, {:message, PgQuery.Node}},
        utility_stmt: {4, {:scalar, nil}, {:message, PgQuery.Node}},
        window_clause: {29, :unpacked, {:message, PgQuery.Node}},
        with_check_options: {38, :unpacked, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "commandType",
          kind: {:scalar, :CMD_TYPE_UNDEFINED},
          label: :optional,
          name: :command_type,
          tag: 1,
          type: {:enum, PgQuery.CmdType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "querySource",
          kind: {:scalar, :QUERY_SOURCE_UNDEFINED},
          label: :optional,
          name: :query_source,
          tag: 2,
          type: {:enum, PgQuery.QuerySource}
        },
        %{
          __struct__: Protox.Field,
          json_name: "canSetTag",
          kind: {:scalar, false},
          label: :optional,
          name: :can_set_tag,
          tag: 3,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "utilityStmt",
          kind: {:scalar, nil},
          label: :optional,
          name: :utility_stmt,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "resultRelation",
          kind: {:scalar, 0},
          label: :optional,
          name: :result_relation,
          tag: 5,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "hasAggs",
          kind: {:scalar, false},
          label: :optional,
          name: :has_aggs,
          tag: 6,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "hasWindowFuncs",
          kind: {:scalar, false},
          label: :optional,
          name: :has_window_funcs,
          tag: 7,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "hasTargetSrfs",
          kind: {:scalar, false},
          label: :optional,
          name: :has_target_srfs,
          tag: 8,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "hasSubLinks",
          kind: {:scalar, false},
          label: :optional,
          name: :has_sub_links,
          tag: 9,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "hasDistinctOn",
          kind: {:scalar, false},
          label: :optional,
          name: :has_distinct_on,
          tag: 10,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "hasRecursive",
          kind: {:scalar, false},
          label: :optional,
          name: :has_recursive,
          tag: 11,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "hasModifyingCte",
          kind: {:scalar, false},
          label: :optional,
          name: :has_modifying_cte,
          tag: 12,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "hasForUpdate",
          kind: {:scalar, false},
          label: :optional,
          name: :has_for_update,
          tag: 13,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "hasRowSecurity",
          kind: {:scalar, false},
          label: :optional,
          name: :has_row_security,
          tag: 14,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "isReturn",
          kind: {:scalar, false},
          label: :optional,
          name: :is_return,
          tag: 15,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "cteList",
          kind: :unpacked,
          label: :repeated,
          name: :cte_list,
          tag: 16,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rtable",
          kind: :unpacked,
          label: :repeated,
          name: :rtable,
          tag: 17,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "jointree",
          kind: {:scalar, nil},
          label: :optional,
          name: :jointree,
          tag: 18,
          type: {:message, PgQuery.FromExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "mergeActionList",
          kind: :unpacked,
          label: :repeated,
          name: :merge_action_list,
          tag: 19,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "mergeUseOuterJoin",
          kind: {:scalar, false},
          label: :optional,
          name: :merge_use_outer_join,
          tag: 20,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "targetList",
          kind: :unpacked,
          label: :repeated,
          name: :target_list,
          tag: 21,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "override",
          kind: {:scalar, :OVERRIDING_KIND_UNDEFINED},
          label: :optional,
          name: :override,
          tag: 22,
          type: {:enum, PgQuery.OverridingKind}
        },
        %{
          __struct__: Protox.Field,
          json_name: "onConflict",
          kind: {:scalar, nil},
          label: :optional,
          name: :on_conflict,
          tag: 23,
          type: {:message, PgQuery.OnConflictExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "returningList",
          kind: :unpacked,
          label: :repeated,
          name: :returning_list,
          tag: 24,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "groupClause",
          kind: :unpacked,
          label: :repeated,
          name: :group_clause,
          tag: 25,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "groupDistinct",
          kind: {:scalar, false},
          label: :optional,
          name: :group_distinct,
          tag: 26,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "groupingSets",
          kind: :unpacked,
          label: :repeated,
          name: :grouping_sets,
          tag: 27,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "havingQual",
          kind: {:scalar, nil},
          label: :optional,
          name: :having_qual,
          tag: 28,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "windowClause",
          kind: :unpacked,
          label: :repeated,
          name: :window_clause,
          tag: 29,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "distinctClause",
          kind: :unpacked,
          label: :repeated,
          name: :distinct_clause,
          tag: 30,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "sortClause",
          kind: :unpacked,
          label: :repeated,
          name: :sort_clause,
          tag: 31,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "limitOffset",
          kind: {:scalar, nil},
          label: :optional,
          name: :limit_offset,
          tag: 32,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "limitCount",
          kind: {:scalar, nil},
          label: :optional,
          name: :limit_count,
          tag: 33,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "limitOption",
          kind: {:scalar, :LIMIT_OPTION_UNDEFINED},
          label: :optional,
          name: :limit_option,
          tag: 34,
          type: {:enum, PgQuery.LimitOption}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rowMarks",
          kind: :unpacked,
          label: :repeated,
          name: :row_marks,
          tag: 35,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "setOperations",
          kind: {:scalar, nil},
          label: :optional,
          name: :set_operations,
          tag: 36,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "constraintDeps",
          kind: :unpacked,
          label: :repeated,
          name: :constraint_deps,
          tag: 37,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "withCheckOptions",
          kind: :unpacked,
          label: :repeated,
          name: :with_check_options,
          tag: 38,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "stmtLocation",
          kind: {:scalar, 0},
          label: :optional,
          name: :stmt_location,
          tag: 39,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "stmtLen",
          kind: {:scalar, 0},
          label: :optional,
          name: :stmt_len,
          tag: 40,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:command_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commandType",
             kind: {:scalar, :CMD_TYPE_UNDEFINED},
             label: :optional,
             name: :command_type,
             tag: 1,
             type: {:enum, PgQuery.CmdType}
           }}
        end

        def field_def("commandType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commandType",
             kind: {:scalar, :CMD_TYPE_UNDEFINED},
             label: :optional,
             name: :command_type,
             tag: 1,
             type: {:enum, PgQuery.CmdType}
           }}
        end

        def field_def("command_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commandType",
             kind: {:scalar, :CMD_TYPE_UNDEFINED},
             label: :optional,
             name: :command_type,
             tag: 1,
             type: {:enum, PgQuery.CmdType}
           }}
        end
      ),
      (
        def field_def(:query_source) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "querySource",
             kind: {:scalar, :QUERY_SOURCE_UNDEFINED},
             label: :optional,
             name: :query_source,
             tag: 2,
             type: {:enum, PgQuery.QuerySource}
           }}
        end

        def field_def("querySource") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "querySource",
             kind: {:scalar, :QUERY_SOURCE_UNDEFINED},
             label: :optional,
             name: :query_source,
             tag: 2,
             type: {:enum, PgQuery.QuerySource}
           }}
        end

        def field_def("query_source") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "querySource",
             kind: {:scalar, :QUERY_SOURCE_UNDEFINED},
             label: :optional,
             name: :query_source,
             tag: 2,
             type: {:enum, PgQuery.QuerySource}
           }}
        end
      ),
      (
        def field_def(:can_set_tag) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "canSetTag",
             kind: {:scalar, false},
             label: :optional,
             name: :can_set_tag,
             tag: 3,
             type: :bool
           }}
        end

        def field_def("canSetTag") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "canSetTag",
             kind: {:scalar, false},
             label: :optional,
             name: :can_set_tag,
             tag: 3,
             type: :bool
           }}
        end

        def field_def("can_set_tag") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "canSetTag",
             kind: {:scalar, false},
             label: :optional,
             name: :can_set_tag,
             tag: 3,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:utility_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "utilityStmt",
             kind: {:scalar, nil},
             label: :optional,
             name: :utility_stmt,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("utilityStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "utilityStmt",
             kind: {:scalar, nil},
             label: :optional,
             name: :utility_stmt,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("utility_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "utilityStmt",
             kind: {:scalar, nil},
             label: :optional,
             name: :utility_stmt,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:result_relation) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resultRelation",
             kind: {:scalar, 0},
             label: :optional,
             name: :result_relation,
             tag: 5,
             type: :int32
           }}
        end

        def field_def("resultRelation") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resultRelation",
             kind: {:scalar, 0},
             label: :optional,
             name: :result_relation,
             tag: 5,
             type: :int32
           }}
        end

        def field_def("result_relation") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resultRelation",
             kind: {:scalar, 0},
             label: :optional,
             name: :result_relation,
             tag: 5,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:has_aggs) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasAggs",
             kind: {:scalar, false},
             label: :optional,
             name: :has_aggs,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("hasAggs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasAggs",
             kind: {:scalar, false},
             label: :optional,
             name: :has_aggs,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("has_aggs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasAggs",
             kind: {:scalar, false},
             label: :optional,
             name: :has_aggs,
             tag: 6,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:has_window_funcs) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasWindowFuncs",
             kind: {:scalar, false},
             label: :optional,
             name: :has_window_funcs,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("hasWindowFuncs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasWindowFuncs",
             kind: {:scalar, false},
             label: :optional,
             name: :has_window_funcs,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("has_window_funcs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasWindowFuncs",
             kind: {:scalar, false},
             label: :optional,
             name: :has_window_funcs,
             tag: 7,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:has_target_srfs) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasTargetSrfs",
             kind: {:scalar, false},
             label: :optional,
             name: :has_target_srfs,
             tag: 8,
             type: :bool
           }}
        end

        def field_def("hasTargetSrfs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasTargetSrfs",
             kind: {:scalar, false},
             label: :optional,
             name: :has_target_srfs,
             tag: 8,
             type: :bool
           }}
        end

        def field_def("has_target_srfs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasTargetSrfs",
             kind: {:scalar, false},
             label: :optional,
             name: :has_target_srfs,
             tag: 8,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:has_sub_links) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasSubLinks",
             kind: {:scalar, false},
             label: :optional,
             name: :has_sub_links,
             tag: 9,
             type: :bool
           }}
        end

        def field_def("hasSubLinks") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasSubLinks",
             kind: {:scalar, false},
             label: :optional,
             name: :has_sub_links,
             tag: 9,
             type: :bool
           }}
        end

        def field_def("has_sub_links") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasSubLinks",
             kind: {:scalar, false},
             label: :optional,
             name: :has_sub_links,
             tag: 9,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:has_distinct_on) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasDistinctOn",
             kind: {:scalar, false},
             label: :optional,
             name: :has_distinct_on,
             tag: 10,
             type: :bool
           }}
        end

        def field_def("hasDistinctOn") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasDistinctOn",
             kind: {:scalar, false},
             label: :optional,
             name: :has_distinct_on,
             tag: 10,
             type: :bool
           }}
        end

        def field_def("has_distinct_on") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasDistinctOn",
             kind: {:scalar, false},
             label: :optional,
             name: :has_distinct_on,
             tag: 10,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:has_recursive) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasRecursive",
             kind: {:scalar, false},
             label: :optional,
             name: :has_recursive,
             tag: 11,
             type: :bool
           }}
        end

        def field_def("hasRecursive") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasRecursive",
             kind: {:scalar, false},
             label: :optional,
             name: :has_recursive,
             tag: 11,
             type: :bool
           }}
        end

        def field_def("has_recursive") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasRecursive",
             kind: {:scalar, false},
             label: :optional,
             name: :has_recursive,
             tag: 11,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:has_modifying_cte) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasModifyingCte",
             kind: {:scalar, false},
             label: :optional,
             name: :has_modifying_cte,
             tag: 12,
             type: :bool
           }}
        end

        def field_def("hasModifyingCte") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasModifyingCte",
             kind: {:scalar, false},
             label: :optional,
             name: :has_modifying_cte,
             tag: 12,
             type: :bool
           }}
        end

        def field_def("has_modifying_cte") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasModifyingCte",
             kind: {:scalar, false},
             label: :optional,
             name: :has_modifying_cte,
             tag: 12,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:has_for_update) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasForUpdate",
             kind: {:scalar, false},
             label: :optional,
             name: :has_for_update,
             tag: 13,
             type: :bool
           }}
        end

        def field_def("hasForUpdate") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasForUpdate",
             kind: {:scalar, false},
             label: :optional,
             name: :has_for_update,
             tag: 13,
             type: :bool
           }}
        end

        def field_def("has_for_update") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasForUpdate",
             kind: {:scalar, false},
             label: :optional,
             name: :has_for_update,
             tag: 13,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:has_row_security) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasRowSecurity",
             kind: {:scalar, false},
             label: :optional,
             name: :has_row_security,
             tag: 14,
             type: :bool
           }}
        end

        def field_def("hasRowSecurity") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasRowSecurity",
             kind: {:scalar, false},
             label: :optional,
             name: :has_row_security,
             tag: 14,
             type: :bool
           }}
        end

        def field_def("has_row_security") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasRowSecurity",
             kind: {:scalar, false},
             label: :optional,
             name: :has_row_security,
             tag: 14,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:is_return) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isReturn",
             kind: {:scalar, false},
             label: :optional,
             name: :is_return,
             tag: 15,
             type: :bool
           }}
        end

        def field_def("isReturn") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isReturn",
             kind: {:scalar, false},
             label: :optional,
             name: :is_return,
             tag: 15,
             type: :bool
           }}
        end

        def field_def("is_return") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isReturn",
             kind: {:scalar, false},
             label: :optional,
             name: :is_return,
             tag: 15,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:cte_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cteList",
             kind: :unpacked,
             label: :repeated,
             name: :cte_list,
             tag: 16,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("cteList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cteList",
             kind: :unpacked,
             label: :repeated,
             name: :cte_list,
             tag: 16,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("cte_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cteList",
             kind: :unpacked,
             label: :repeated,
             name: :cte_list,
             tag: 16,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:rtable) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rtable",
             kind: :unpacked,
             label: :repeated,
             name: :rtable,
             tag: 17,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("rtable") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rtable",
             kind: :unpacked,
             label: :repeated,
             name: :rtable,
             tag: 17,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:jointree) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "jointree",
             kind: {:scalar, nil},
             label: :optional,
             name: :jointree,
             tag: 18,
             type: {:message, PgQuery.FromExpr}
           }}
        end

        def field_def("jointree") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "jointree",
             kind: {:scalar, nil},
             label: :optional,
             name: :jointree,
             tag: 18,
             type: {:message, PgQuery.FromExpr}
           }}
        end

        []
      ),
      (
        def field_def(:merge_action_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mergeActionList",
             kind: :unpacked,
             label: :repeated,
             name: :merge_action_list,
             tag: 19,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("mergeActionList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mergeActionList",
             kind: :unpacked,
             label: :repeated,
             name: :merge_action_list,
             tag: 19,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("merge_action_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mergeActionList",
             kind: :unpacked,
             label: :repeated,
             name: :merge_action_list,
             tag: 19,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:merge_use_outer_join) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mergeUseOuterJoin",
             kind: {:scalar, false},
             label: :optional,
             name: :merge_use_outer_join,
             tag: 20,
             type: :bool
           }}
        end

        def field_def("mergeUseOuterJoin") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mergeUseOuterJoin",
             kind: {:scalar, false},
             label: :optional,
             name: :merge_use_outer_join,
             tag: 20,
             type: :bool
           }}
        end

        def field_def("merge_use_outer_join") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mergeUseOuterJoin",
             kind: {:scalar, false},
             label: :optional,
             name: :merge_use_outer_join,
             tag: 20,
             type: :bool
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
             tag: 21,
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
             tag: 21,
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
             tag: 21,
             type: {:message, PgQuery.Node}
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
             tag: 22,
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
             tag: 22,
             type: {:enum, PgQuery.OverridingKind}
           }}
        end

        []
      ),
      (
        def field_def(:on_conflict) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onConflict",
             kind: {:scalar, nil},
             label: :optional,
             name: :on_conflict,
             tag: 23,
             type: {:message, PgQuery.OnConflictExpr}
           }}
        end

        def field_def("onConflict") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onConflict",
             kind: {:scalar, nil},
             label: :optional,
             name: :on_conflict,
             tag: 23,
             type: {:message, PgQuery.OnConflictExpr}
           }}
        end

        def field_def("on_conflict") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onConflict",
             kind: {:scalar, nil},
             label: :optional,
             name: :on_conflict,
             tag: 23,
             type: {:message, PgQuery.OnConflictExpr}
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
             tag: 24,
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
             tag: 24,
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
             tag: 24,
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
             tag: 25,
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
             tag: 25,
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
             tag: 25,
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
             tag: 26,
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
             tag: 26,
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
             tag: 26,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:grouping_sets) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupingSets",
             kind: :unpacked,
             label: :repeated,
             name: :grouping_sets,
             tag: 27,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("groupingSets") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupingSets",
             kind: :unpacked,
             label: :repeated,
             name: :grouping_sets,
             tag: 27,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("grouping_sets") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupingSets",
             kind: :unpacked,
             label: :repeated,
             name: :grouping_sets,
             tag: 27,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:having_qual) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "havingQual",
             kind: {:scalar, nil},
             label: :optional,
             name: :having_qual,
             tag: 28,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("havingQual") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "havingQual",
             kind: {:scalar, nil},
             label: :optional,
             name: :having_qual,
             tag: 28,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("having_qual") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "havingQual",
             kind: {:scalar, nil},
             label: :optional,
             name: :having_qual,
             tag: 28,
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
             tag: 29,
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
             tag: 29,
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
             tag: 29,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:distinct_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "distinctClause",
             kind: :unpacked,
             label: :repeated,
             name: :distinct_clause,
             tag: 30,
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
             tag: 30,
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
             tag: 30,
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
             tag: 31,
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
             tag: 31,
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
             tag: 31,
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
             tag: 32,
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
             tag: 32,
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
             tag: 32,
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
             tag: 33,
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
             tag: 33,
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
             tag: 33,
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
             tag: 34,
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
             tag: 34,
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
             tag: 34,
             type: {:enum, PgQuery.LimitOption}
           }}
        end
      ),
      (
        def field_def(:row_marks) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowMarks",
             kind: :unpacked,
             label: :repeated,
             name: :row_marks,
             tag: 35,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("rowMarks") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowMarks",
             kind: :unpacked,
             label: :repeated,
             name: :row_marks,
             tag: 35,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("row_marks") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowMarks",
             kind: :unpacked,
             label: :repeated,
             name: :row_marks,
             tag: 35,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:set_operations) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "setOperations",
             kind: {:scalar, nil},
             label: :optional,
             name: :set_operations,
             tag: 36,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("setOperations") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "setOperations",
             kind: {:scalar, nil},
             label: :optional,
             name: :set_operations,
             tag: 36,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("set_operations") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "setOperations",
             kind: {:scalar, nil},
             label: :optional,
             name: :set_operations,
             tag: 36,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:constraint_deps) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "constraintDeps",
             kind: :unpacked,
             label: :repeated,
             name: :constraint_deps,
             tag: 37,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("constraintDeps") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "constraintDeps",
             kind: :unpacked,
             label: :repeated,
             name: :constraint_deps,
             tag: 37,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("constraint_deps") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "constraintDeps",
             kind: :unpacked,
             label: :repeated,
             name: :constraint_deps,
             tag: 37,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:with_check_options) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "withCheckOptions",
             kind: :unpacked,
             label: :repeated,
             name: :with_check_options,
             tag: 38,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("withCheckOptions") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "withCheckOptions",
             kind: :unpacked,
             label: :repeated,
             name: :with_check_options,
             tag: 38,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("with_check_options") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "withCheckOptions",
             kind: :unpacked,
             label: :repeated,
             name: :with_check_options,
             tag: 38,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:stmt_location) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "stmtLocation",
             kind: {:scalar, 0},
             label: :optional,
             name: :stmt_location,
             tag: 39,
             type: :int32
           }}
        end

        def field_def("stmtLocation") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "stmtLocation",
             kind: {:scalar, 0},
             label: :optional,
             name: :stmt_location,
             tag: 39,
             type: :int32
           }}
        end

        def field_def("stmt_location") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "stmtLocation",
             kind: {:scalar, 0},
             label: :optional,
             name: :stmt_location,
             tag: 39,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:stmt_len) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "stmtLen",
             kind: {:scalar, 0},
             label: :optional,
             name: :stmt_len,
             tag: 40,
             type: :int32
           }}
        end

        def field_def("stmtLen") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "stmtLen",
             kind: {:scalar, 0},
             label: :optional,
             name: :stmt_len,
             tag: 40,
             type: :int32
           }}
        end

        def field_def("stmt_len") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "stmtLen",
             kind: {:scalar, 0},
             label: :optional,
             name: :stmt_len,
             tag: 40,
             type: :int32
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
    def default(:command_type) do
      {:ok, :CMD_TYPE_UNDEFINED}
    end,
    def default(:query_source) do
      {:ok, :QUERY_SOURCE_UNDEFINED}
    end,
    def default(:can_set_tag) do
      {:ok, false}
    end,
    def default(:utility_stmt) do
      {:ok, nil}
    end,
    def default(:result_relation) do
      {:ok, 0}
    end,
    def default(:has_aggs) do
      {:ok, false}
    end,
    def default(:has_window_funcs) do
      {:ok, false}
    end,
    def default(:has_target_srfs) do
      {:ok, false}
    end,
    def default(:has_sub_links) do
      {:ok, false}
    end,
    def default(:has_distinct_on) do
      {:ok, false}
    end,
    def default(:has_recursive) do
      {:ok, false}
    end,
    def default(:has_modifying_cte) do
      {:ok, false}
    end,
    def default(:has_for_update) do
      {:ok, false}
    end,
    def default(:has_row_security) do
      {:ok, false}
    end,
    def default(:is_return) do
      {:ok, false}
    end,
    def default(:cte_list) do
      {:error, :no_default_value}
    end,
    def default(:rtable) do
      {:error, :no_default_value}
    end,
    def default(:jointree) do
      {:ok, nil}
    end,
    def default(:merge_action_list) do
      {:error, :no_default_value}
    end,
    def default(:merge_use_outer_join) do
      {:ok, false}
    end,
    def default(:target_list) do
      {:error, :no_default_value}
    end,
    def default(:override) do
      {:ok, :OVERRIDING_KIND_UNDEFINED}
    end,
    def default(:on_conflict) do
      {:ok, nil}
    end,
    def default(:returning_list) do
      {:error, :no_default_value}
    end,
    def default(:group_clause) do
      {:error, :no_default_value}
    end,
    def default(:group_distinct) do
      {:ok, false}
    end,
    def default(:grouping_sets) do
      {:error, :no_default_value}
    end,
    def default(:having_qual) do
      {:ok, nil}
    end,
    def default(:window_clause) do
      {:error, :no_default_value}
    end,
    def default(:distinct_clause) do
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
    def default(:row_marks) do
      {:error, :no_default_value}
    end,
    def default(:set_operations) do
      {:ok, nil}
    end,
    def default(:constraint_deps) do
      {:error, :no_default_value}
    end,
    def default(:with_check_options) do
      {:error, :no_default_value}
    end,
    def default(:stmt_location) do
      {:ok, 0}
    end,
    def default(:stmt_len) do
      {:ok, 0}
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
