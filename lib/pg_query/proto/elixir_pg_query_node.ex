# credo:disable-for-this-file
defmodule PgQuery.Node do
  @moduledoc false
  defstruct node: nil

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
        [] |> encode_node(msg)
      end
    )

    [
      defp encode_node(acc, msg) do
        case msg.node do
          nil ->
            acc

          {:alias, _field_value} ->
            encode_alias(acc, msg)

          {:range_var, _field_value} ->
            encode_range_var(acc, msg)

          {:table_func, _field_value} ->
            encode_table_func(acc, msg)

          {:var, _field_value} ->
            encode_var(acc, msg)

          {:param, _field_value} ->
            encode_param(acc, msg)

          {:aggref, _field_value} ->
            encode_aggref(acc, msg)

          {:grouping_func, _field_value} ->
            encode_grouping_func(acc, msg)

          {:window_func, _field_value} ->
            encode_window_func(acc, msg)

          {:subscripting_ref, _field_value} ->
            encode_subscripting_ref(acc, msg)

          {:func_expr, _field_value} ->
            encode_func_expr(acc, msg)

          {:named_arg_expr, _field_value} ->
            encode_named_arg_expr(acc, msg)

          {:op_expr, _field_value} ->
            encode_op_expr(acc, msg)

          {:distinct_expr, _field_value} ->
            encode_distinct_expr(acc, msg)

          {:null_if_expr, _field_value} ->
            encode_null_if_expr(acc, msg)

          {:scalar_array_op_expr, _field_value} ->
            encode_scalar_array_op_expr(acc, msg)

          {:bool_expr, _field_value} ->
            encode_bool_expr(acc, msg)

          {:sub_link, _field_value} ->
            encode_sub_link(acc, msg)

          {:sub_plan, _field_value} ->
            encode_sub_plan(acc, msg)

          {:alternative_sub_plan, _field_value} ->
            encode_alternative_sub_plan(acc, msg)

          {:field_select, _field_value} ->
            encode_field_select(acc, msg)

          {:field_store, _field_value} ->
            encode_field_store(acc, msg)

          {:relabel_type, _field_value} ->
            encode_relabel_type(acc, msg)

          {:coerce_via_io, _field_value} ->
            encode_coerce_via_io(acc, msg)

          {:array_coerce_expr, _field_value} ->
            encode_array_coerce_expr(acc, msg)

          {:convert_rowtype_expr, _field_value} ->
            encode_convert_rowtype_expr(acc, msg)

          {:collate_expr, _field_value} ->
            encode_collate_expr(acc, msg)

          {:case_expr, _field_value} ->
            encode_case_expr(acc, msg)

          {:case_when, _field_value} ->
            encode_case_when(acc, msg)

          {:case_test_expr, _field_value} ->
            encode_case_test_expr(acc, msg)

          {:array_expr, _field_value} ->
            encode_array_expr(acc, msg)

          {:row_expr, _field_value} ->
            encode_row_expr(acc, msg)

          {:row_compare_expr, _field_value} ->
            encode_row_compare_expr(acc, msg)

          {:coalesce_expr, _field_value} ->
            encode_coalesce_expr(acc, msg)

          {:min_max_expr, _field_value} ->
            encode_min_max_expr(acc, msg)

          {:sqlvalue_function, _field_value} ->
            encode_sqlvalue_function(acc, msg)

          {:xml_expr, _field_value} ->
            encode_xml_expr(acc, msg)

          {:null_test, _field_value} ->
            encode_null_test(acc, msg)

          {:boolean_test, _field_value} ->
            encode_boolean_test(acc, msg)

          {:coerce_to_domain, _field_value} ->
            encode_coerce_to_domain(acc, msg)

          {:coerce_to_domain_value, _field_value} ->
            encode_coerce_to_domain_value(acc, msg)

          {:set_to_default, _field_value} ->
            encode_set_to_default(acc, msg)

          {:current_of_expr, _field_value} ->
            encode_current_of_expr(acc, msg)

          {:next_value_expr, _field_value} ->
            encode_next_value_expr(acc, msg)

          {:inference_elem, _field_value} ->
            encode_inference_elem(acc, msg)

          {:target_entry, _field_value} ->
            encode_target_entry(acc, msg)

          {:range_tbl_ref, _field_value} ->
            encode_range_tbl_ref(acc, msg)

          {:join_expr, _field_value} ->
            encode_join_expr(acc, msg)

          {:from_expr, _field_value} ->
            encode_from_expr(acc, msg)

          {:on_conflict_expr, _field_value} ->
            encode_on_conflict_expr(acc, msg)

          {:into_clause, _field_value} ->
            encode_into_clause(acc, msg)

          {:merge_action, _field_value} ->
            encode_merge_action(acc, msg)

          {:raw_stmt, _field_value} ->
            encode_raw_stmt(acc, msg)

          {:query, _field_value} ->
            encode_query(acc, msg)

          {:insert_stmt, _field_value} ->
            encode_insert_stmt(acc, msg)

          {:delete_stmt, _field_value} ->
            encode_delete_stmt(acc, msg)

          {:update_stmt, _field_value} ->
            encode_update_stmt(acc, msg)

          {:merge_stmt, _field_value} ->
            encode_merge_stmt(acc, msg)

          {:select_stmt, _field_value} ->
            encode_select_stmt(acc, msg)

          {:return_stmt, _field_value} ->
            encode_return_stmt(acc, msg)

          {:plassign_stmt, _field_value} ->
            encode_plassign_stmt(acc, msg)

          {:alter_table_stmt, _field_value} ->
            encode_alter_table_stmt(acc, msg)

          {:alter_table_cmd, _field_value} ->
            encode_alter_table_cmd(acc, msg)

          {:alter_domain_stmt, _field_value} ->
            encode_alter_domain_stmt(acc, msg)

          {:set_operation_stmt, _field_value} ->
            encode_set_operation_stmt(acc, msg)

          {:grant_stmt, _field_value} ->
            encode_grant_stmt(acc, msg)

          {:grant_role_stmt, _field_value} ->
            encode_grant_role_stmt(acc, msg)

          {:alter_default_privileges_stmt, _field_value} ->
            encode_alter_default_privileges_stmt(acc, msg)

          {:close_portal_stmt, _field_value} ->
            encode_close_portal_stmt(acc, msg)

          {:cluster_stmt, _field_value} ->
            encode_cluster_stmt(acc, msg)

          {:copy_stmt, _field_value} ->
            encode_copy_stmt(acc, msg)

          {:create_stmt, _field_value} ->
            encode_create_stmt(acc, msg)

          {:define_stmt, _field_value} ->
            encode_define_stmt(acc, msg)

          {:drop_stmt, _field_value} ->
            encode_drop_stmt(acc, msg)

          {:truncate_stmt, _field_value} ->
            encode_truncate_stmt(acc, msg)

          {:comment_stmt, _field_value} ->
            encode_comment_stmt(acc, msg)

          {:fetch_stmt, _field_value} ->
            encode_fetch_stmt(acc, msg)

          {:index_stmt, _field_value} ->
            encode_index_stmt(acc, msg)

          {:create_function_stmt, _field_value} ->
            encode_create_function_stmt(acc, msg)

          {:alter_function_stmt, _field_value} ->
            encode_alter_function_stmt(acc, msg)

          {:do_stmt, _field_value} ->
            encode_do_stmt(acc, msg)

          {:rename_stmt, _field_value} ->
            encode_rename_stmt(acc, msg)

          {:rule_stmt, _field_value} ->
            encode_rule_stmt(acc, msg)

          {:notify_stmt, _field_value} ->
            encode_notify_stmt(acc, msg)

          {:listen_stmt, _field_value} ->
            encode_listen_stmt(acc, msg)

          {:unlisten_stmt, _field_value} ->
            encode_unlisten_stmt(acc, msg)

          {:transaction_stmt, _field_value} ->
            encode_transaction_stmt(acc, msg)

          {:view_stmt, _field_value} ->
            encode_view_stmt(acc, msg)

          {:load_stmt, _field_value} ->
            encode_load_stmt(acc, msg)

          {:create_domain_stmt, _field_value} ->
            encode_create_domain_stmt(acc, msg)

          {:createdb_stmt, _field_value} ->
            encode_createdb_stmt(acc, msg)

          {:dropdb_stmt, _field_value} ->
            encode_dropdb_stmt(acc, msg)

          {:vacuum_stmt, _field_value} ->
            encode_vacuum_stmt(acc, msg)

          {:explain_stmt, _field_value} ->
            encode_explain_stmt(acc, msg)

          {:create_table_as_stmt, _field_value} ->
            encode_create_table_as_stmt(acc, msg)

          {:create_seq_stmt, _field_value} ->
            encode_create_seq_stmt(acc, msg)

          {:alter_seq_stmt, _field_value} ->
            encode_alter_seq_stmt(acc, msg)

          {:variable_set_stmt, _field_value} ->
            encode_variable_set_stmt(acc, msg)

          {:variable_show_stmt, _field_value} ->
            encode_variable_show_stmt(acc, msg)

          {:discard_stmt, _field_value} ->
            encode_discard_stmt(acc, msg)

          {:create_trig_stmt, _field_value} ->
            encode_create_trig_stmt(acc, msg)

          {:create_plang_stmt, _field_value} ->
            encode_create_plang_stmt(acc, msg)

          {:create_role_stmt, _field_value} ->
            encode_create_role_stmt(acc, msg)

          {:alter_role_stmt, _field_value} ->
            encode_alter_role_stmt(acc, msg)

          {:drop_role_stmt, _field_value} ->
            encode_drop_role_stmt(acc, msg)

          {:lock_stmt, _field_value} ->
            encode_lock_stmt(acc, msg)

          {:constraints_set_stmt, _field_value} ->
            encode_constraints_set_stmt(acc, msg)

          {:reindex_stmt, _field_value} ->
            encode_reindex_stmt(acc, msg)

          {:check_point_stmt, _field_value} ->
            encode_check_point_stmt(acc, msg)

          {:create_schema_stmt, _field_value} ->
            encode_create_schema_stmt(acc, msg)

          {:alter_database_stmt, _field_value} ->
            encode_alter_database_stmt(acc, msg)

          {:alter_database_refresh_coll_stmt, _field_value} ->
            encode_alter_database_refresh_coll_stmt(acc, msg)

          {:alter_database_set_stmt, _field_value} ->
            encode_alter_database_set_stmt(acc, msg)

          {:alter_role_set_stmt, _field_value} ->
            encode_alter_role_set_stmt(acc, msg)

          {:create_conversion_stmt, _field_value} ->
            encode_create_conversion_stmt(acc, msg)

          {:create_cast_stmt, _field_value} ->
            encode_create_cast_stmt(acc, msg)

          {:create_op_class_stmt, _field_value} ->
            encode_create_op_class_stmt(acc, msg)

          {:create_op_family_stmt, _field_value} ->
            encode_create_op_family_stmt(acc, msg)

          {:alter_op_family_stmt, _field_value} ->
            encode_alter_op_family_stmt(acc, msg)

          {:prepare_stmt, _field_value} ->
            encode_prepare_stmt(acc, msg)

          {:execute_stmt, _field_value} ->
            encode_execute_stmt(acc, msg)

          {:deallocate_stmt, _field_value} ->
            encode_deallocate_stmt(acc, msg)

          {:declare_cursor_stmt, _field_value} ->
            encode_declare_cursor_stmt(acc, msg)

          {:create_table_space_stmt, _field_value} ->
            encode_create_table_space_stmt(acc, msg)

          {:drop_table_space_stmt, _field_value} ->
            encode_drop_table_space_stmt(acc, msg)

          {:alter_object_depends_stmt, _field_value} ->
            encode_alter_object_depends_stmt(acc, msg)

          {:alter_object_schema_stmt, _field_value} ->
            encode_alter_object_schema_stmt(acc, msg)

          {:alter_owner_stmt, _field_value} ->
            encode_alter_owner_stmt(acc, msg)

          {:alter_operator_stmt, _field_value} ->
            encode_alter_operator_stmt(acc, msg)

          {:alter_type_stmt, _field_value} ->
            encode_alter_type_stmt(acc, msg)

          {:drop_owned_stmt, _field_value} ->
            encode_drop_owned_stmt(acc, msg)

          {:reassign_owned_stmt, _field_value} ->
            encode_reassign_owned_stmt(acc, msg)

          {:composite_type_stmt, _field_value} ->
            encode_composite_type_stmt(acc, msg)

          {:create_enum_stmt, _field_value} ->
            encode_create_enum_stmt(acc, msg)

          {:create_range_stmt, _field_value} ->
            encode_create_range_stmt(acc, msg)

          {:alter_enum_stmt, _field_value} ->
            encode_alter_enum_stmt(acc, msg)

          {:alter_tsdictionary_stmt, _field_value} ->
            encode_alter_tsdictionary_stmt(acc, msg)

          {:alter_tsconfiguration_stmt, _field_value} ->
            encode_alter_tsconfiguration_stmt(acc, msg)

          {:create_fdw_stmt, _field_value} ->
            encode_create_fdw_stmt(acc, msg)

          {:alter_fdw_stmt, _field_value} ->
            encode_alter_fdw_stmt(acc, msg)

          {:create_foreign_server_stmt, _field_value} ->
            encode_create_foreign_server_stmt(acc, msg)

          {:alter_foreign_server_stmt, _field_value} ->
            encode_alter_foreign_server_stmt(acc, msg)

          {:create_user_mapping_stmt, _field_value} ->
            encode_create_user_mapping_stmt(acc, msg)

          {:alter_user_mapping_stmt, _field_value} ->
            encode_alter_user_mapping_stmt(acc, msg)

          {:drop_user_mapping_stmt, _field_value} ->
            encode_drop_user_mapping_stmt(acc, msg)

          {:alter_table_space_options_stmt, _field_value} ->
            encode_alter_table_space_options_stmt(acc, msg)

          {:alter_table_move_all_stmt, _field_value} ->
            encode_alter_table_move_all_stmt(acc, msg)

          {:sec_label_stmt, _field_value} ->
            encode_sec_label_stmt(acc, msg)

          {:create_foreign_table_stmt, _field_value} ->
            encode_create_foreign_table_stmt(acc, msg)

          {:import_foreign_schema_stmt, _field_value} ->
            encode_import_foreign_schema_stmt(acc, msg)

          {:create_extension_stmt, _field_value} ->
            encode_create_extension_stmt(acc, msg)

          {:alter_extension_stmt, _field_value} ->
            encode_alter_extension_stmt(acc, msg)

          {:alter_extension_contents_stmt, _field_value} ->
            encode_alter_extension_contents_stmt(acc, msg)

          {:create_event_trig_stmt, _field_value} ->
            encode_create_event_trig_stmt(acc, msg)

          {:alter_event_trig_stmt, _field_value} ->
            encode_alter_event_trig_stmt(acc, msg)

          {:refresh_mat_view_stmt, _field_value} ->
            encode_refresh_mat_view_stmt(acc, msg)

          {:replica_identity_stmt, _field_value} ->
            encode_replica_identity_stmt(acc, msg)

          {:alter_system_stmt, _field_value} ->
            encode_alter_system_stmt(acc, msg)

          {:create_policy_stmt, _field_value} ->
            encode_create_policy_stmt(acc, msg)

          {:alter_policy_stmt, _field_value} ->
            encode_alter_policy_stmt(acc, msg)

          {:create_transform_stmt, _field_value} ->
            encode_create_transform_stmt(acc, msg)

          {:create_am_stmt, _field_value} ->
            encode_create_am_stmt(acc, msg)

          {:create_publication_stmt, _field_value} ->
            encode_create_publication_stmt(acc, msg)

          {:alter_publication_stmt, _field_value} ->
            encode_alter_publication_stmt(acc, msg)

          {:create_subscription_stmt, _field_value} ->
            encode_create_subscription_stmt(acc, msg)

          {:alter_subscription_stmt, _field_value} ->
            encode_alter_subscription_stmt(acc, msg)

          {:drop_subscription_stmt, _field_value} ->
            encode_drop_subscription_stmt(acc, msg)

          {:create_stats_stmt, _field_value} ->
            encode_create_stats_stmt(acc, msg)

          {:alter_collation_stmt, _field_value} ->
            encode_alter_collation_stmt(acc, msg)

          {:call_stmt, _field_value} ->
            encode_call_stmt(acc, msg)

          {:alter_stats_stmt, _field_value} ->
            encode_alter_stats_stmt(acc, msg)

          {:a_expr, _field_value} ->
            encode_a_expr(acc, msg)

          {:column_ref, _field_value} ->
            encode_column_ref(acc, msg)

          {:param_ref, _field_value} ->
            encode_param_ref(acc, msg)

          {:func_call, _field_value} ->
            encode_func_call(acc, msg)

          {:a_star, _field_value} ->
            encode_a_star(acc, msg)

          {:a_indices, _field_value} ->
            encode_a_indices(acc, msg)

          {:a_indirection, _field_value} ->
            encode_a_indirection(acc, msg)

          {:a_array_expr, _field_value} ->
            encode_a_array_expr(acc, msg)

          {:res_target, _field_value} ->
            encode_res_target(acc, msg)

          {:multi_assign_ref, _field_value} ->
            encode_multi_assign_ref(acc, msg)

          {:type_cast, _field_value} ->
            encode_type_cast(acc, msg)

          {:collate_clause, _field_value} ->
            encode_collate_clause(acc, msg)

          {:sort_by, _field_value} ->
            encode_sort_by(acc, msg)

          {:window_def, _field_value} ->
            encode_window_def(acc, msg)

          {:range_subselect, _field_value} ->
            encode_range_subselect(acc, msg)

          {:range_function, _field_value} ->
            encode_range_function(acc, msg)

          {:range_table_sample, _field_value} ->
            encode_range_table_sample(acc, msg)

          {:range_table_func, _field_value} ->
            encode_range_table_func(acc, msg)

          {:range_table_func_col, _field_value} ->
            encode_range_table_func_col(acc, msg)

          {:type_name, _field_value} ->
            encode_type_name(acc, msg)

          {:column_def, _field_value} ->
            encode_column_def(acc, msg)

          {:index_elem, _field_value} ->
            encode_index_elem(acc, msg)

          {:stats_elem, _field_value} ->
            encode_stats_elem(acc, msg)

          {:constraint, _field_value} ->
            encode_constraint(acc, msg)

          {:def_elem, _field_value} ->
            encode_def_elem(acc, msg)

          {:range_tbl_entry, _field_value} ->
            encode_range_tbl_entry(acc, msg)

          {:range_tbl_function, _field_value} ->
            encode_range_tbl_function(acc, msg)

          {:table_sample_clause, _field_value} ->
            encode_table_sample_clause(acc, msg)

          {:with_check_option, _field_value} ->
            encode_with_check_option(acc, msg)

          {:sort_group_clause, _field_value} ->
            encode_sort_group_clause(acc, msg)

          {:grouping_set, _field_value} ->
            encode_grouping_set(acc, msg)

          {:window_clause, _field_value} ->
            encode_window_clause(acc, msg)

          {:object_with_args, _field_value} ->
            encode_object_with_args(acc, msg)

          {:access_priv, _field_value} ->
            encode_access_priv(acc, msg)

          {:create_op_class_item, _field_value} ->
            encode_create_op_class_item(acc, msg)

          {:table_like_clause, _field_value} ->
            encode_table_like_clause(acc, msg)

          {:function_parameter, _field_value} ->
            encode_function_parameter(acc, msg)

          {:locking_clause, _field_value} ->
            encode_locking_clause(acc, msg)

          {:row_mark_clause, _field_value} ->
            encode_row_mark_clause(acc, msg)

          {:xml_serialize, _field_value} ->
            encode_xml_serialize(acc, msg)

          {:with_clause, _field_value} ->
            encode_with_clause(acc, msg)

          {:infer_clause, _field_value} ->
            encode_infer_clause(acc, msg)

          {:on_conflict_clause, _field_value} ->
            encode_on_conflict_clause(acc, msg)

          {:ctesearch_clause, _field_value} ->
            encode_ctesearch_clause(acc, msg)

          {:ctecycle_clause, _field_value} ->
            encode_ctecycle_clause(acc, msg)

          {:common_table_expr, _field_value} ->
            encode_common_table_expr(acc, msg)

          {:merge_when_clause, _field_value} ->
            encode_merge_when_clause(acc, msg)

          {:role_spec, _field_value} ->
            encode_role_spec(acc, msg)

          {:trigger_transition, _field_value} ->
            encode_trigger_transition(acc, msg)

          {:partition_elem, _field_value} ->
            encode_partition_elem(acc, msg)

          {:partition_spec, _field_value} ->
            encode_partition_spec(acc, msg)

          {:partition_bound_spec, _field_value} ->
            encode_partition_bound_spec(acc, msg)

          {:partition_range_datum, _field_value} ->
            encode_partition_range_datum(acc, msg)

          {:partition_cmd, _field_value} ->
            encode_partition_cmd(acc, msg)

          {:vacuum_relation, _field_value} ->
            encode_vacuum_relation(acc, msg)

          {:publication_obj_spec, _field_value} ->
            encode_publication_obj_spec(acc, msg)

          {:publication_table, _field_value} ->
            encode_publication_table(acc, msg)

          {:inline_code_block, _field_value} ->
            encode_inline_code_block(acc, msg)

          {:call_context, _field_value} ->
            encode_call_context(acc, msg)

          {:integer, _field_value} ->
            encode_integer(acc, msg)

          {:float, _field_value} ->
            encode_float(acc, msg)

          {:boolean, _field_value} ->
            encode_boolean(acc, msg)

          {:string, _field_value} ->
            encode_string(acc, msg)

          {:bit_string, _field_value} ->
            encode_bit_string(acc, msg)

          {:list, _field_value} ->
            encode_list(acc, msg)

          {:int_list, _field_value} ->
            encode_int_list(acc, msg)

          {:oid_list, _field_value} ->
            encode_oid_list(acc, msg)

          {:a_const, _field_value} ->
            encode_a_const(acc, msg)
        end
      end
    ]

    [
      defp encode_alias(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\n", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alias, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_range_var(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x12", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:range_var, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_table_func(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x1A", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:table_func, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_var(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\"", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:var, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_param(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "*", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:param, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_aggref(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "2", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:aggref, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_grouping_func(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, ":", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:grouping_func, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_window_func(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "B", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:window_func, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_subscripting_ref(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "J", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:subscripting_ref, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_func_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "R", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:func_expr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_named_arg_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "Z", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:named_arg_expr, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_op_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "b", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:op_expr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_distinct_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "j", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:distinct_expr, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_null_if_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "r", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:null_if_expr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_scalar_array_op_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "z", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:scalar_array_op_expr, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_bool_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x82\x01", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:bool_expr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_sub_link(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x8A\x01", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sub_link, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_sub_plan(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x92\x01", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sub_plan, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_alternative_sub_plan(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x9A\x01", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alternative_sub_plan, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_field_select(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xA2\x01", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:field_select, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_field_store(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xAA\x01", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:field_store, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_relabel_type(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xB2\x01", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:relabel_type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_coerce_via_io(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xBA\x01", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:coerce_via_io, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_array_coerce_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xC2\x01", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:array_coerce_expr, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_convert_rowtype_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xCA\x01", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:convert_rowtype_expr, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_collate_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xD2\x01", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:collate_expr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_case_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xDA\x01", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:case_expr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_case_when(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xE2\x01", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:case_when, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_case_test_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xEA\x01", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:case_test_expr, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_array_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xF2\x01", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:array_expr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_row_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xFA\x01", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:row_expr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_row_compare_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x82\x02", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:row_compare_expr, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_coalesce_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x8A\x02", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:coalesce_expr, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_min_max_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x92\x02", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:min_max_expr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_sqlvalue_function(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x9A\x02", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sqlvalue_function, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_xml_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xA2\x02", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:xml_expr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_null_test(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xAA\x02", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:null_test, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_boolean_test(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xB2\x02", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:boolean_test, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_coerce_to_domain(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xBA\x02", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:coerce_to_domain, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_coerce_to_domain_value(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xC2\x02", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:coerce_to_domain_value, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_set_to_default(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xCA\x02", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:set_to_default, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_current_of_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xD2\x02", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:current_of_expr, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_next_value_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xDA\x02", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:next_value_expr, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_inference_elem(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xE2\x02", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:inference_elem, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_target_entry(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xEA\x02", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:target_entry, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_range_tbl_ref(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xF2\x02", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:range_tbl_ref, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_join_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xFA\x02", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:join_expr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_from_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x82\x03", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:from_expr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_on_conflict_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x8A\x03", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:on_conflict_expr, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_into_clause(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x92\x03", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:into_clause, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_merge_action(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x9A\x03", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:merge_action, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_raw_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xA2\x03", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:raw_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_query(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xAA\x03", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:query, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_insert_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xB2\x03", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:insert_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_delete_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xBA\x03", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:delete_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_update_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xC2\x03", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:update_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_merge_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xCA\x03", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:merge_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_select_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xD2\x03", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:select_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_return_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xDA\x03", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:return_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_plassign_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xE2\x03", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:plassign_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_table_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xEA\x03", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_table_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_table_cmd(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xF2\x03", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_table_cmd, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_domain_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xFA\x03", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_domain_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_set_operation_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x82\x04", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:set_operation_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_grant_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x8A\x04", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:grant_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_grant_role_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x92\x04", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:grant_role_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_default_privileges_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x9A\x04", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(
                      :alter_default_privileges_stmt,
                      "invalid field value"
                    ),
                    __STACKTRACE__
        end
      end,
      defp encode_close_portal_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xA2\x04", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:close_portal_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_cluster_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xAA\x04", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:cluster_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_copy_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xB2\x04", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:copy_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_create_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xBA\x04", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_define_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xC2\x04", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:define_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_drop_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xCA\x04", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:drop_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_truncate_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xD2\x04", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:truncate_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_comment_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xDA\x04", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:comment_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_fetch_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xE2\x04", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:fetch_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_index_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xEA\x04", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:index_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_create_function_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xF2\x04", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_function_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_function_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xFA\x04", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_function_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_do_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x82\x05", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:do_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rename_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x8A\x05", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rename_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rule_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x92\x05", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rule_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_notify_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x9A\x05", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:notify_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_listen_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xA2\x05", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:listen_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_unlisten_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xAA\x05", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:unlisten_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_transaction_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xB2\x05", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:transaction_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_view_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xBA\x05", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:view_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_load_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xC2\x05", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:load_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_create_domain_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xCA\x05", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_domain_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_createdb_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xD2\x05", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:createdb_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_dropdb_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xDA\x05", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:dropdb_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_vacuum_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xE2\x05", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:vacuum_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_explain_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xEA\x05", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:explain_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_create_table_as_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xF2\x05", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_table_as_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_seq_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xFA\x05", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_seq_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_seq_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x82\x06", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_seq_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_variable_set_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x8A\x06", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:variable_set_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_variable_show_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x92\x06", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:variable_show_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_discard_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x9A\x06", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:discard_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_create_trig_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xA2\x06", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_trig_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_plang_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xAA\x06", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_plang_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_role_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xB2\x06", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_role_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_role_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xBA\x06", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_role_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_drop_role_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xC2\x06", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:drop_role_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_lock_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xCA\x06", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:lock_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_constraints_set_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xD2\x06", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:constraints_set_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_reindex_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xDA\x06", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:reindex_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_check_point_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xE2\x06", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:check_point_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_schema_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xEA\x06", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_schema_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_database_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xF2\x06", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_database_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_database_refresh_coll_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xFA\x06", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(
                      :alter_database_refresh_coll_stmt,
                      "invalid field value"
                    ),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_database_set_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x82\a", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_database_set_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_role_set_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x8A\a", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_role_set_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_conversion_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x92\a", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_conversion_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_cast_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x9A\a", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_cast_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_op_class_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xA2\a", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_op_class_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_op_family_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xAA\a", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_op_family_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_op_family_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xB2\a", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_op_family_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_prepare_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xBA\a", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:prepare_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_execute_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xC2\a", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:execute_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_deallocate_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xCA\a", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:deallocate_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_declare_cursor_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xD2\a", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:declare_cursor_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_table_space_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xDA\a", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_table_space_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_drop_table_space_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xE2\a", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:drop_table_space_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_object_depends_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xEA\a", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_object_depends_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_object_schema_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xF2\a", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_object_schema_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_owner_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xFA\a", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_owner_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_operator_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x82\b", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_operator_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_type_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x8A\b", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_type_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_drop_owned_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x92\b", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:drop_owned_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_reassign_owned_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x9A\b", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:reassign_owned_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_composite_type_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xA2\b", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:composite_type_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_enum_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xAA\b", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_enum_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_range_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xB2\b", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_range_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_enum_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xBA\b", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_enum_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_tsdictionary_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xC2\b", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_tsdictionary_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_tsconfiguration_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xCA\b", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_tsconfiguration_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_fdw_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xD2\b", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_fdw_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_fdw_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xDA\b", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_fdw_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_foreign_server_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xE2\b", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_foreign_server_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_foreign_server_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xEA\b", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_foreign_server_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_user_mapping_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xF2\b", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_user_mapping_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_user_mapping_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xFA\b", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_user_mapping_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_drop_user_mapping_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x82\t", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:drop_user_mapping_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_table_space_options_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x8A\t", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(
                      :alter_table_space_options_stmt,
                      "invalid field value"
                    ),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_table_move_all_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x92\t", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_table_move_all_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_sec_label_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x9A\t", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sec_label_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_foreign_table_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xA2\t", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_foreign_table_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_import_foreign_schema_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xAA\t", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:import_foreign_schema_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_extension_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xB2\t", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_extension_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_extension_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xBA\t", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_extension_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_extension_contents_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xC2\t", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(
                      :alter_extension_contents_stmt,
                      "invalid field value"
                    ),
                    __STACKTRACE__
        end
      end,
      defp encode_create_event_trig_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xCA\t", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_event_trig_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_event_trig_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xD2\t", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_event_trig_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_refresh_mat_view_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xDA\t", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:refresh_mat_view_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_replica_identity_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xE2\t", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:replica_identity_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_system_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xEA\t", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_system_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_policy_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xF2\t", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_policy_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_policy_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xFA\t", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_policy_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_transform_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x82\n", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_transform_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_am_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x8A\n", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_am_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_publication_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x92\n", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_publication_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_publication_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x9A\n", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_publication_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_subscription_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xA2\n", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_subscription_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_subscription_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xAA\n", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_subscription_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_drop_subscription_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xB2\n", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:drop_subscription_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_stats_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xBA\n", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_stats_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_alter_collation_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xC2\n", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_collation_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_call_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xCA\n", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:call_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_alter_stats_stmt(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xD2\n", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alter_stats_stmt, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_a_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xDA\n", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:a_expr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_column_ref(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xE2\n", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:column_ref, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_param_ref(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xEA\n", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:param_ref, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_func_call(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xF2\n", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:func_call, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_a_star(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xFA\n", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:a_star, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_a_indices(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x82\v", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:a_indices, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_a_indirection(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x8A\v", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:a_indirection, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_a_array_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x92\v", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:a_array_expr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_res_target(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x9A\v", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:res_target, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_multi_assign_ref(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xA2\v", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:multi_assign_ref, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_type_cast(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xAA\v", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:type_cast, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_collate_clause(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xB2\v", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:collate_clause, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_sort_by(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xBA\v", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sort_by, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_window_def(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xC2\v", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:window_def, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_range_subselect(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xCA\v", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:range_subselect, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_range_function(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xD2\v", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:range_function, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_range_table_sample(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xDA\v", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:range_table_sample, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_range_table_func(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xE2\v", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:range_table_func, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_range_table_func_col(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xEA\v", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:range_table_func_col, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_type_name(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xF2\v", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:type_name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_column_def(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xFA\v", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:column_def, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_index_elem(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x82\f", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:index_elem, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_stats_elem(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x8A\f", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:stats_elem, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_constraint(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x92\f", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:constraint, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_def_elem(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x9A\f", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:def_elem, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_range_tbl_entry(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xA2\f", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:range_tbl_entry, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_range_tbl_function(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xAA\f", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:range_tbl_function, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_table_sample_clause(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xB2\f", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:table_sample_clause, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_with_check_option(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xBA\f", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:with_check_option, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_sort_group_clause(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xC2\f", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sort_group_clause, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_grouping_set(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xCA\f", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:grouping_set, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_window_clause(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xD2\f", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:window_clause, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_object_with_args(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xDA\f", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:object_with_args, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_access_priv(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xE2\f", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:access_priv, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_create_op_class_item(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xEA\f", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_op_class_item, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_table_like_clause(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xF2\f", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:table_like_clause, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_function_parameter(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xFA\f", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:function_parameter, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_locking_clause(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x82\r", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:locking_clause, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_row_mark_clause(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x8A\r", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:row_mark_clause, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_xml_serialize(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x92\r", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:xml_serialize, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_with_clause(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x9A\r", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:with_clause, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_infer_clause(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xA2\r", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:infer_clause, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_on_conflict_clause(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xAA\r", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:on_conflict_clause, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_ctesearch_clause(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xB2\r", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ctesearch_clause, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_ctecycle_clause(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xBA\r", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ctecycle_clause, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_common_table_expr(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xC2\r", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:common_table_expr, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_merge_when_clause(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xCA\r", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:merge_when_clause, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_role_spec(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xD2\r", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:role_spec, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_trigger_transition(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xDA\r", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:trigger_transition, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_partition_elem(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xE2\r", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:partition_elem, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_partition_spec(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xEA\r", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:partition_spec, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_partition_bound_spec(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xF2\r", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:partition_bound_spec, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_partition_range_datum(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xFA\r", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:partition_range_datum, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_partition_cmd(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x82\x0E", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:partition_cmd, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_vacuum_relation(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x8A\x0E", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:vacuum_relation, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_publication_obj_spec(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x92\x0E", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:publication_obj_spec, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_publication_table(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\x9A\x0E", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:publication_table, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_inline_code_block(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xA2\x0E", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:inline_code_block, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_call_context(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xAA\x0E", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:call_context, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_integer(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xB2\x0E", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:integer, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_float(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xBA\x0E", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:float, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_boolean(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xC2\x0E", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:boolean, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_string(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xCA\x0E", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:string, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_bit_string(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xD2\x0E", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:bit_string, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_list(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xDA\x0E", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:list, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_int_list(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xE2\x0E", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:int_list, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_oid_list(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xEA\x0E", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:oid_list, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_a_const(acc, msg) do
        try do
          {_, child_field_value} = msg.node
          [acc, "\xF2\x0E", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:a_const, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.Node))
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
                 case msg.node do
                   {:alias, previous_value} ->
                     {:node,
                      {:alias,
                       Protox.MergeMessage.merge(previous_value, PgQuery.Alias.decode!(delimited))}}

                   _ ->
                     {:node, {:alias, PgQuery.Alias.decode!(delimited)}}
                 end
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:range_var, previous_value} ->
                     {:node,
                      {:range_var,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.RangeVar.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:range_var, PgQuery.RangeVar.decode!(delimited)}}
                 end
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:table_func, previous_value} ->
                     {:node,
                      {:table_func,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.TableFunc.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:table_func, PgQuery.TableFunc.decode!(delimited)}}
                 end
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:var, previous_value} ->
                     {:node,
                      {:var,
                       Protox.MergeMessage.merge(previous_value, PgQuery.Var.decode!(delimited))}}

                   _ ->
                     {:node, {:var, PgQuery.Var.decode!(delimited)}}
                 end
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:param, previous_value} ->
                     {:node,
                      {:param,
                       Protox.MergeMessage.merge(previous_value, PgQuery.Param.decode!(delimited))}}

                   _ ->
                     {:node, {:param, PgQuery.Param.decode!(delimited)}}
                 end
               ], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:aggref, previous_value} ->
                     {:node,
                      {:aggref,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.Aggref.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:aggref, PgQuery.Aggref.decode!(delimited)}}
                 end
               ], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:grouping_func, previous_value} ->
                     {:node,
                      {:grouping_func,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.GroupingFunc.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:grouping_func, PgQuery.GroupingFunc.decode!(delimited)}}
                 end
               ], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:window_func, previous_value} ->
                     {:node,
                      {:window_func,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.WindowFunc.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:window_func, PgQuery.WindowFunc.decode!(delimited)}}
                 end
               ], rest}

            {9, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:subscripting_ref, previous_value} ->
                     {:node,
                      {:subscripting_ref,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.SubscriptingRef.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:subscripting_ref, PgQuery.SubscriptingRef.decode!(delimited)}}
                 end
               ], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:func_expr, previous_value} ->
                     {:node,
                      {:func_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.FuncExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:func_expr, PgQuery.FuncExpr.decode!(delimited)}}
                 end
               ], rest}

            {11, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:named_arg_expr, previous_value} ->
                     {:node,
                      {:named_arg_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.NamedArgExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:named_arg_expr, PgQuery.NamedArgExpr.decode!(delimited)}}
                 end
               ], rest}

            {12, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:op_expr, previous_value} ->
                     {:node,
                      {:op_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.OpExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:op_expr, PgQuery.OpExpr.decode!(delimited)}}
                 end
               ], rest}

            {13, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:distinct_expr, previous_value} ->
                     {:node,
                      {:distinct_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.DistinctExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:distinct_expr, PgQuery.DistinctExpr.decode!(delimited)}}
                 end
               ], rest}

            {14, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:null_if_expr, previous_value} ->
                     {:node,
                      {:null_if_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.NullIfExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:null_if_expr, PgQuery.NullIfExpr.decode!(delimited)}}
                 end
               ], rest}

            {15, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:scalar_array_op_expr, previous_value} ->
                     {:node,
                      {:scalar_array_op_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.ScalarArrayOpExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:scalar_array_op_expr, PgQuery.ScalarArrayOpExpr.decode!(delimited)}}
                 end
               ], rest}

            {16, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:bool_expr, previous_value} ->
                     {:node,
                      {:bool_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.BoolExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:bool_expr, PgQuery.BoolExpr.decode!(delimited)}}
                 end
               ], rest}

            {17, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:sub_link, previous_value} ->
                     {:node,
                      {:sub_link,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.SubLink.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:sub_link, PgQuery.SubLink.decode!(delimited)}}
                 end
               ], rest}

            {18, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:sub_plan, previous_value} ->
                     {:node,
                      {:sub_plan,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.SubPlan.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:sub_plan, PgQuery.SubPlan.decode!(delimited)}}
                 end
               ], rest}

            {19, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alternative_sub_plan, previous_value} ->
                     {:node,
                      {:alternative_sub_plan,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlternativeSubPlan.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:alternative_sub_plan, PgQuery.AlternativeSubPlan.decode!(delimited)}}
                 end
               ], rest}

            {20, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:field_select, previous_value} ->
                     {:node,
                      {:field_select,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.FieldSelect.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:field_select, PgQuery.FieldSelect.decode!(delimited)}}
                 end
               ], rest}

            {21, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:field_store, previous_value} ->
                     {:node,
                      {:field_store,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.FieldStore.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:field_store, PgQuery.FieldStore.decode!(delimited)}}
                 end
               ], rest}

            {22, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:relabel_type, previous_value} ->
                     {:node,
                      {:relabel_type,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.RelabelType.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:relabel_type, PgQuery.RelabelType.decode!(delimited)}}
                 end
               ], rest}

            {23, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:coerce_via_io, previous_value} ->
                     {:node,
                      {:coerce_via_io,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CoerceViaIO.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:coerce_via_io, PgQuery.CoerceViaIO.decode!(delimited)}}
                 end
               ], rest}

            {24, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:array_coerce_expr, previous_value} ->
                     {:node,
                      {:array_coerce_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.ArrayCoerceExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:array_coerce_expr, PgQuery.ArrayCoerceExpr.decode!(delimited)}}
                 end
               ], rest}

            {25, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:convert_rowtype_expr, previous_value} ->
                     {:node,
                      {:convert_rowtype_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.ConvertRowtypeExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:convert_rowtype_expr, PgQuery.ConvertRowtypeExpr.decode!(delimited)}}
                 end
               ], rest}

            {26, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:collate_expr, previous_value} ->
                     {:node,
                      {:collate_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CollateExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:collate_expr, PgQuery.CollateExpr.decode!(delimited)}}
                 end
               ], rest}

            {27, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:case_expr, previous_value} ->
                     {:node,
                      {:case_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CaseExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:case_expr, PgQuery.CaseExpr.decode!(delimited)}}
                 end
               ], rest}

            {28, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:case_when, previous_value} ->
                     {:node,
                      {:case_when,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CaseWhen.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:case_when, PgQuery.CaseWhen.decode!(delimited)}}
                 end
               ], rest}

            {29, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:case_test_expr, previous_value} ->
                     {:node,
                      {:case_test_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CaseTestExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:case_test_expr, PgQuery.CaseTestExpr.decode!(delimited)}}
                 end
               ], rest}

            {30, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:array_expr, previous_value} ->
                     {:node,
                      {:array_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.ArrayExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:array_expr, PgQuery.ArrayExpr.decode!(delimited)}}
                 end
               ], rest}

            {31, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:row_expr, previous_value} ->
                     {:node,
                      {:row_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.RowExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:row_expr, PgQuery.RowExpr.decode!(delimited)}}
                 end
               ], rest}

            {32, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:row_compare_expr, previous_value} ->
                     {:node,
                      {:row_compare_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.RowCompareExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:row_compare_expr, PgQuery.RowCompareExpr.decode!(delimited)}}
                 end
               ], rest}

            {33, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:coalesce_expr, previous_value} ->
                     {:node,
                      {:coalesce_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CoalesceExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:coalesce_expr, PgQuery.CoalesceExpr.decode!(delimited)}}
                 end
               ], rest}

            {34, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:min_max_expr, previous_value} ->
                     {:node,
                      {:min_max_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.MinMaxExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:min_max_expr, PgQuery.MinMaxExpr.decode!(delimited)}}
                 end
               ], rest}

            {35, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:sqlvalue_function, previous_value} ->
                     {:node,
                      {:sqlvalue_function,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.SQLValueFunction.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:sqlvalue_function, PgQuery.SQLValueFunction.decode!(delimited)}}
                 end
               ], rest}

            {36, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:xml_expr, previous_value} ->
                     {:node,
                      {:xml_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.XmlExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:xml_expr, PgQuery.XmlExpr.decode!(delimited)}}
                 end
               ], rest}

            {37, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:null_test, previous_value} ->
                     {:node,
                      {:null_test,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.NullTest.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:null_test, PgQuery.NullTest.decode!(delimited)}}
                 end
               ], rest}

            {38, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:boolean_test, previous_value} ->
                     {:node,
                      {:boolean_test,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.BooleanTest.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:boolean_test, PgQuery.BooleanTest.decode!(delimited)}}
                 end
               ], rest}

            {39, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:coerce_to_domain, previous_value} ->
                     {:node,
                      {:coerce_to_domain,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CoerceToDomain.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:coerce_to_domain, PgQuery.CoerceToDomain.decode!(delimited)}}
                 end
               ], rest}

            {40, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:coerce_to_domain_value, previous_value} ->
                     {:node,
                      {:coerce_to_domain_value,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CoerceToDomainValue.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:coerce_to_domain_value, PgQuery.CoerceToDomainValue.decode!(delimited)}}
                 end
               ], rest}

            {41, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:set_to_default, previous_value} ->
                     {:node,
                      {:set_to_default,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.SetToDefault.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:set_to_default, PgQuery.SetToDefault.decode!(delimited)}}
                 end
               ], rest}

            {42, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:current_of_expr, previous_value} ->
                     {:node,
                      {:current_of_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CurrentOfExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:current_of_expr, PgQuery.CurrentOfExpr.decode!(delimited)}}
                 end
               ], rest}

            {43, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:next_value_expr, previous_value} ->
                     {:node,
                      {:next_value_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.NextValueExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:next_value_expr, PgQuery.NextValueExpr.decode!(delimited)}}
                 end
               ], rest}

            {44, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:inference_elem, previous_value} ->
                     {:node,
                      {:inference_elem,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.InferenceElem.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:inference_elem, PgQuery.InferenceElem.decode!(delimited)}}
                 end
               ], rest}

            {45, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:target_entry, previous_value} ->
                     {:node,
                      {:target_entry,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.TargetEntry.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:target_entry, PgQuery.TargetEntry.decode!(delimited)}}
                 end
               ], rest}

            {46, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:range_tbl_ref, previous_value} ->
                     {:node,
                      {:range_tbl_ref,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.RangeTblRef.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:range_tbl_ref, PgQuery.RangeTblRef.decode!(delimited)}}
                 end
               ], rest}

            {47, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:join_expr, previous_value} ->
                     {:node,
                      {:join_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.JoinExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:join_expr, PgQuery.JoinExpr.decode!(delimited)}}
                 end
               ], rest}

            {48, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:from_expr, previous_value} ->
                     {:node,
                      {:from_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.FromExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:from_expr, PgQuery.FromExpr.decode!(delimited)}}
                 end
               ], rest}

            {49, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:on_conflict_expr, previous_value} ->
                     {:node,
                      {:on_conflict_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.OnConflictExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:on_conflict_expr, PgQuery.OnConflictExpr.decode!(delimited)}}
                 end
               ], rest}

            {50, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:into_clause, previous_value} ->
                     {:node,
                      {:into_clause,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.IntoClause.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:into_clause, PgQuery.IntoClause.decode!(delimited)}}
                 end
               ], rest}

            {51, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:merge_action, previous_value} ->
                     {:node,
                      {:merge_action,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.MergeAction.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:merge_action, PgQuery.MergeAction.decode!(delimited)}}
                 end
               ], rest}

            {52, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:raw_stmt, previous_value} ->
                     {:node,
                      {:raw_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.RawStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:raw_stmt, PgQuery.RawStmt.decode!(delimited)}}
                 end
               ], rest}

            {53, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:query, previous_value} ->
                     {:node,
                      {:query,
                       Protox.MergeMessage.merge(previous_value, PgQuery.Query.decode!(delimited))}}

                   _ ->
                     {:node, {:query, PgQuery.Query.decode!(delimited)}}
                 end
               ], rest}

            {54, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:insert_stmt, previous_value} ->
                     {:node,
                      {:insert_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.InsertStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:insert_stmt, PgQuery.InsertStmt.decode!(delimited)}}
                 end
               ], rest}

            {55, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:delete_stmt, previous_value} ->
                     {:node,
                      {:delete_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.DeleteStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:delete_stmt, PgQuery.DeleteStmt.decode!(delimited)}}
                 end
               ], rest}

            {56, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:update_stmt, previous_value} ->
                     {:node,
                      {:update_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.UpdateStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:update_stmt, PgQuery.UpdateStmt.decode!(delimited)}}
                 end
               ], rest}

            {57, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:merge_stmt, previous_value} ->
                     {:node,
                      {:merge_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.MergeStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:merge_stmt, PgQuery.MergeStmt.decode!(delimited)}}
                 end
               ], rest}

            {58, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:select_stmt, previous_value} ->
                     {:node,
                      {:select_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.SelectStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:select_stmt, PgQuery.SelectStmt.decode!(delimited)}}
                 end
               ], rest}

            {59, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:return_stmt, previous_value} ->
                     {:node,
                      {:return_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.ReturnStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:return_stmt, PgQuery.ReturnStmt.decode!(delimited)}}
                 end
               ], rest}

            {60, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:plassign_stmt, previous_value} ->
                     {:node,
                      {:plassign_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.PLAssignStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:plassign_stmt, PgQuery.PLAssignStmt.decode!(delimited)}}
                 end
               ], rest}

            {61, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_table_stmt, previous_value} ->
                     {:node,
                      {:alter_table_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterTableStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:alter_table_stmt, PgQuery.AlterTableStmt.decode!(delimited)}}
                 end
               ], rest}

            {62, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_table_cmd, previous_value} ->
                     {:node,
                      {:alter_table_cmd,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterTableCmd.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:alter_table_cmd, PgQuery.AlterTableCmd.decode!(delimited)}}
                 end
               ], rest}

            {63, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_domain_stmt, previous_value} ->
                     {:node,
                      {:alter_domain_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterDomainStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:alter_domain_stmt, PgQuery.AlterDomainStmt.decode!(delimited)}}
                 end
               ], rest}

            {64, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:set_operation_stmt, previous_value} ->
                     {:node,
                      {:set_operation_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.SetOperationStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:set_operation_stmt, PgQuery.SetOperationStmt.decode!(delimited)}}
                 end
               ], rest}

            {65, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:grant_stmt, previous_value} ->
                     {:node,
                      {:grant_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.GrantStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:grant_stmt, PgQuery.GrantStmt.decode!(delimited)}}
                 end
               ], rest}

            {66, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:grant_role_stmt, previous_value} ->
                     {:node,
                      {:grant_role_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.GrantRoleStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:grant_role_stmt, PgQuery.GrantRoleStmt.decode!(delimited)}}
                 end
               ], rest}

            {67, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_default_privileges_stmt, previous_value} ->
                     {:node,
                      {:alter_default_privileges_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterDefaultPrivilegesStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:alter_default_privileges_stmt,
                       PgQuery.AlterDefaultPrivilegesStmt.decode!(delimited)}}
                 end
               ], rest}

            {68, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:close_portal_stmt, previous_value} ->
                     {:node,
                      {:close_portal_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.ClosePortalStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:close_portal_stmt, PgQuery.ClosePortalStmt.decode!(delimited)}}
                 end
               ], rest}

            {69, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:cluster_stmt, previous_value} ->
                     {:node,
                      {:cluster_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.ClusterStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:cluster_stmt, PgQuery.ClusterStmt.decode!(delimited)}}
                 end
               ], rest}

            {70, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:copy_stmt, previous_value} ->
                     {:node,
                      {:copy_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CopyStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:copy_stmt, PgQuery.CopyStmt.decode!(delimited)}}
                 end
               ], rest}

            {71, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_stmt, previous_value} ->
                     {:node,
                      {:create_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:create_stmt, PgQuery.CreateStmt.decode!(delimited)}}
                 end
               ], rest}

            {72, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:define_stmt, previous_value} ->
                     {:node,
                      {:define_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.DefineStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:define_stmt, PgQuery.DefineStmt.decode!(delimited)}}
                 end
               ], rest}

            {73, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:drop_stmt, previous_value} ->
                     {:node,
                      {:drop_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.DropStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:drop_stmt, PgQuery.DropStmt.decode!(delimited)}}
                 end
               ], rest}

            {74, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:truncate_stmt, previous_value} ->
                     {:node,
                      {:truncate_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.TruncateStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:truncate_stmt, PgQuery.TruncateStmt.decode!(delimited)}}
                 end
               ], rest}

            {75, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:comment_stmt, previous_value} ->
                     {:node,
                      {:comment_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CommentStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:comment_stmt, PgQuery.CommentStmt.decode!(delimited)}}
                 end
               ], rest}

            {76, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:fetch_stmt, previous_value} ->
                     {:node,
                      {:fetch_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.FetchStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:fetch_stmt, PgQuery.FetchStmt.decode!(delimited)}}
                 end
               ], rest}

            {77, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:index_stmt, previous_value} ->
                     {:node,
                      {:index_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.IndexStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:index_stmt, PgQuery.IndexStmt.decode!(delimited)}}
                 end
               ], rest}

            {78, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_function_stmt, previous_value} ->
                     {:node,
                      {:create_function_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateFunctionStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:create_function_stmt, PgQuery.CreateFunctionStmt.decode!(delimited)}}
                 end
               ], rest}

            {79, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_function_stmt, previous_value} ->
                     {:node,
                      {:alter_function_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterFunctionStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:alter_function_stmt, PgQuery.AlterFunctionStmt.decode!(delimited)}}
                 end
               ], rest}

            {80, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:do_stmt, previous_value} ->
                     {:node,
                      {:do_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.DoStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:do_stmt, PgQuery.DoStmt.decode!(delimited)}}
                 end
               ], rest}

            {81, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:rename_stmt, previous_value} ->
                     {:node,
                      {:rename_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.RenameStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:rename_stmt, PgQuery.RenameStmt.decode!(delimited)}}
                 end
               ], rest}

            {82, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:rule_stmt, previous_value} ->
                     {:node,
                      {:rule_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.RuleStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:rule_stmt, PgQuery.RuleStmt.decode!(delimited)}}
                 end
               ], rest}

            {83, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:notify_stmt, previous_value} ->
                     {:node,
                      {:notify_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.NotifyStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:notify_stmt, PgQuery.NotifyStmt.decode!(delimited)}}
                 end
               ], rest}

            {84, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:listen_stmt, previous_value} ->
                     {:node,
                      {:listen_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.ListenStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:listen_stmt, PgQuery.ListenStmt.decode!(delimited)}}
                 end
               ], rest}

            {85, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:unlisten_stmt, previous_value} ->
                     {:node,
                      {:unlisten_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.UnlistenStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:unlisten_stmt, PgQuery.UnlistenStmt.decode!(delimited)}}
                 end
               ], rest}

            {86, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:transaction_stmt, previous_value} ->
                     {:node,
                      {:transaction_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.TransactionStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:transaction_stmt, PgQuery.TransactionStmt.decode!(delimited)}}
                 end
               ], rest}

            {87, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:view_stmt, previous_value} ->
                     {:node,
                      {:view_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.ViewStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:view_stmt, PgQuery.ViewStmt.decode!(delimited)}}
                 end
               ], rest}

            {88, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:load_stmt, previous_value} ->
                     {:node,
                      {:load_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.LoadStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:load_stmt, PgQuery.LoadStmt.decode!(delimited)}}
                 end
               ], rest}

            {89, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_domain_stmt, previous_value} ->
                     {:node,
                      {:create_domain_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateDomainStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:create_domain_stmt, PgQuery.CreateDomainStmt.decode!(delimited)}}
                 end
               ], rest}

            {90, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:createdb_stmt, previous_value} ->
                     {:node,
                      {:createdb_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreatedbStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:createdb_stmt, PgQuery.CreatedbStmt.decode!(delimited)}}
                 end
               ], rest}

            {91, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:dropdb_stmt, previous_value} ->
                     {:node,
                      {:dropdb_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.DropdbStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:dropdb_stmt, PgQuery.DropdbStmt.decode!(delimited)}}
                 end
               ], rest}

            {92, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:vacuum_stmt, previous_value} ->
                     {:node,
                      {:vacuum_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.VacuumStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:vacuum_stmt, PgQuery.VacuumStmt.decode!(delimited)}}
                 end
               ], rest}

            {93, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:explain_stmt, previous_value} ->
                     {:node,
                      {:explain_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.ExplainStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:explain_stmt, PgQuery.ExplainStmt.decode!(delimited)}}
                 end
               ], rest}

            {94, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_table_as_stmt, previous_value} ->
                     {:node,
                      {:create_table_as_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateTableAsStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:create_table_as_stmt, PgQuery.CreateTableAsStmt.decode!(delimited)}}
                 end
               ], rest}

            {95, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_seq_stmt, previous_value} ->
                     {:node,
                      {:create_seq_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateSeqStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:create_seq_stmt, PgQuery.CreateSeqStmt.decode!(delimited)}}
                 end
               ], rest}

            {96, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_seq_stmt, previous_value} ->
                     {:node,
                      {:alter_seq_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterSeqStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:alter_seq_stmt, PgQuery.AlterSeqStmt.decode!(delimited)}}
                 end
               ], rest}

            {97, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:variable_set_stmt, previous_value} ->
                     {:node,
                      {:variable_set_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.VariableSetStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:variable_set_stmt, PgQuery.VariableSetStmt.decode!(delimited)}}
                 end
               ], rest}

            {98, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:variable_show_stmt, previous_value} ->
                     {:node,
                      {:variable_show_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.VariableShowStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:variable_show_stmt, PgQuery.VariableShowStmt.decode!(delimited)}}
                 end
               ], rest}

            {99, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:discard_stmt, previous_value} ->
                     {:node,
                      {:discard_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.DiscardStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:discard_stmt, PgQuery.DiscardStmt.decode!(delimited)}}
                 end
               ], rest}

            {100, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_trig_stmt, previous_value} ->
                     {:node,
                      {:create_trig_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateTrigStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:create_trig_stmt, PgQuery.CreateTrigStmt.decode!(delimited)}}
                 end
               ], rest}

            {101, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_plang_stmt, previous_value} ->
                     {:node,
                      {:create_plang_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreatePLangStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:create_plang_stmt, PgQuery.CreatePLangStmt.decode!(delimited)}}
                 end
               ], rest}

            {102, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_role_stmt, previous_value} ->
                     {:node,
                      {:create_role_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateRoleStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:create_role_stmt, PgQuery.CreateRoleStmt.decode!(delimited)}}
                 end
               ], rest}

            {103, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_role_stmt, previous_value} ->
                     {:node,
                      {:alter_role_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterRoleStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:alter_role_stmt, PgQuery.AlterRoleStmt.decode!(delimited)}}
                 end
               ], rest}

            {104, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:drop_role_stmt, previous_value} ->
                     {:node,
                      {:drop_role_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.DropRoleStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:drop_role_stmt, PgQuery.DropRoleStmt.decode!(delimited)}}
                 end
               ], rest}

            {105, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:lock_stmt, previous_value} ->
                     {:node,
                      {:lock_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.LockStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:lock_stmt, PgQuery.LockStmt.decode!(delimited)}}
                 end
               ], rest}

            {106, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:constraints_set_stmt, previous_value} ->
                     {:node,
                      {:constraints_set_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.ConstraintsSetStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:constraints_set_stmt, PgQuery.ConstraintsSetStmt.decode!(delimited)}}
                 end
               ], rest}

            {107, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:reindex_stmt, previous_value} ->
                     {:node,
                      {:reindex_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.ReindexStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:reindex_stmt, PgQuery.ReindexStmt.decode!(delimited)}}
                 end
               ], rest}

            {108, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:check_point_stmt, previous_value} ->
                     {:node,
                      {:check_point_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CheckPointStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:check_point_stmt, PgQuery.CheckPointStmt.decode!(delimited)}}
                 end
               ], rest}

            {109, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_schema_stmt, previous_value} ->
                     {:node,
                      {:create_schema_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateSchemaStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:create_schema_stmt, PgQuery.CreateSchemaStmt.decode!(delimited)}}
                 end
               ], rest}

            {110, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_database_stmt, previous_value} ->
                     {:node,
                      {:alter_database_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterDatabaseStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:alter_database_stmt, PgQuery.AlterDatabaseStmt.decode!(delimited)}}
                 end
               ], rest}

            {111, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_database_refresh_coll_stmt, previous_value} ->
                     {:node,
                      {:alter_database_refresh_coll_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterDatabaseRefreshCollStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:alter_database_refresh_coll_stmt,
                       PgQuery.AlterDatabaseRefreshCollStmt.decode!(delimited)}}
                 end
               ], rest}

            {112, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_database_set_stmt, previous_value} ->
                     {:node,
                      {:alter_database_set_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterDatabaseSetStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:alter_database_set_stmt, PgQuery.AlterDatabaseSetStmt.decode!(delimited)}}
                 end
               ], rest}

            {113, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_role_set_stmt, previous_value} ->
                     {:node,
                      {:alter_role_set_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterRoleSetStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:alter_role_set_stmt, PgQuery.AlterRoleSetStmt.decode!(delimited)}}
                 end
               ], rest}

            {114, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_conversion_stmt, previous_value} ->
                     {:node,
                      {:create_conversion_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateConversionStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:create_conversion_stmt, PgQuery.CreateConversionStmt.decode!(delimited)}}
                 end
               ], rest}

            {115, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_cast_stmt, previous_value} ->
                     {:node,
                      {:create_cast_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateCastStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:create_cast_stmt, PgQuery.CreateCastStmt.decode!(delimited)}}
                 end
               ], rest}

            {116, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_op_class_stmt, previous_value} ->
                     {:node,
                      {:create_op_class_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateOpClassStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:create_op_class_stmt, PgQuery.CreateOpClassStmt.decode!(delimited)}}
                 end
               ], rest}

            {117, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_op_family_stmt, previous_value} ->
                     {:node,
                      {:create_op_family_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateOpFamilyStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:create_op_family_stmt, PgQuery.CreateOpFamilyStmt.decode!(delimited)}}
                 end
               ], rest}

            {118, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_op_family_stmt, previous_value} ->
                     {:node,
                      {:alter_op_family_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterOpFamilyStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:alter_op_family_stmt, PgQuery.AlterOpFamilyStmt.decode!(delimited)}}
                 end
               ], rest}

            {119, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:prepare_stmt, previous_value} ->
                     {:node,
                      {:prepare_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.PrepareStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:prepare_stmt, PgQuery.PrepareStmt.decode!(delimited)}}
                 end
               ], rest}

            {120, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:execute_stmt, previous_value} ->
                     {:node,
                      {:execute_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.ExecuteStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:execute_stmt, PgQuery.ExecuteStmt.decode!(delimited)}}
                 end
               ], rest}

            {121, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:deallocate_stmt, previous_value} ->
                     {:node,
                      {:deallocate_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.DeallocateStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:deallocate_stmt, PgQuery.DeallocateStmt.decode!(delimited)}}
                 end
               ], rest}

            {122, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:declare_cursor_stmt, previous_value} ->
                     {:node,
                      {:declare_cursor_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.DeclareCursorStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:declare_cursor_stmt, PgQuery.DeclareCursorStmt.decode!(delimited)}}
                 end
               ], rest}

            {123, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_table_space_stmt, previous_value} ->
                     {:node,
                      {:create_table_space_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateTableSpaceStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:create_table_space_stmt, PgQuery.CreateTableSpaceStmt.decode!(delimited)}}
                 end
               ], rest}

            {124, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:drop_table_space_stmt, previous_value} ->
                     {:node,
                      {:drop_table_space_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.DropTableSpaceStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:drop_table_space_stmt, PgQuery.DropTableSpaceStmt.decode!(delimited)}}
                 end
               ], rest}

            {125, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_object_depends_stmt, previous_value} ->
                     {:node,
                      {:alter_object_depends_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterObjectDependsStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:alter_object_depends_stmt,
                       PgQuery.AlterObjectDependsStmt.decode!(delimited)}}
                 end
               ], rest}

            {126, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_object_schema_stmt, previous_value} ->
                     {:node,
                      {:alter_object_schema_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterObjectSchemaStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:alter_object_schema_stmt,
                       PgQuery.AlterObjectSchemaStmt.decode!(delimited)}}
                 end
               ], rest}

            {127, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_owner_stmt, previous_value} ->
                     {:node,
                      {:alter_owner_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterOwnerStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:alter_owner_stmt, PgQuery.AlterOwnerStmt.decode!(delimited)}}
                 end
               ], rest}

            {128, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_operator_stmt, previous_value} ->
                     {:node,
                      {:alter_operator_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterOperatorStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:alter_operator_stmt, PgQuery.AlterOperatorStmt.decode!(delimited)}}
                 end
               ], rest}

            {129, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_type_stmt, previous_value} ->
                     {:node,
                      {:alter_type_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterTypeStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:alter_type_stmt, PgQuery.AlterTypeStmt.decode!(delimited)}}
                 end
               ], rest}

            {130, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:drop_owned_stmt, previous_value} ->
                     {:node,
                      {:drop_owned_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.DropOwnedStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:drop_owned_stmt, PgQuery.DropOwnedStmt.decode!(delimited)}}
                 end
               ], rest}

            {131, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:reassign_owned_stmt, previous_value} ->
                     {:node,
                      {:reassign_owned_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.ReassignOwnedStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:reassign_owned_stmt, PgQuery.ReassignOwnedStmt.decode!(delimited)}}
                 end
               ], rest}

            {132, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:composite_type_stmt, previous_value} ->
                     {:node,
                      {:composite_type_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CompositeTypeStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:composite_type_stmt, PgQuery.CompositeTypeStmt.decode!(delimited)}}
                 end
               ], rest}

            {133, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_enum_stmt, previous_value} ->
                     {:node,
                      {:create_enum_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateEnumStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:create_enum_stmt, PgQuery.CreateEnumStmt.decode!(delimited)}}
                 end
               ], rest}

            {134, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_range_stmt, previous_value} ->
                     {:node,
                      {:create_range_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateRangeStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:create_range_stmt, PgQuery.CreateRangeStmt.decode!(delimited)}}
                 end
               ], rest}

            {135, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_enum_stmt, previous_value} ->
                     {:node,
                      {:alter_enum_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterEnumStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:alter_enum_stmt, PgQuery.AlterEnumStmt.decode!(delimited)}}
                 end
               ], rest}

            {136, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_tsdictionary_stmt, previous_value} ->
                     {:node,
                      {:alter_tsdictionary_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterTSDictionaryStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:alter_tsdictionary_stmt, PgQuery.AlterTSDictionaryStmt.decode!(delimited)}}
                 end
               ], rest}

            {137, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_tsconfiguration_stmt, previous_value} ->
                     {:node,
                      {:alter_tsconfiguration_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterTSConfigurationStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:alter_tsconfiguration_stmt,
                       PgQuery.AlterTSConfigurationStmt.decode!(delimited)}}
                 end
               ], rest}

            {138, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_fdw_stmt, previous_value} ->
                     {:node,
                      {:create_fdw_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateFdwStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:create_fdw_stmt, PgQuery.CreateFdwStmt.decode!(delimited)}}
                 end
               ], rest}

            {139, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_fdw_stmt, previous_value} ->
                     {:node,
                      {:alter_fdw_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterFdwStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:alter_fdw_stmt, PgQuery.AlterFdwStmt.decode!(delimited)}}
                 end
               ], rest}

            {140, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_foreign_server_stmt, previous_value} ->
                     {:node,
                      {:create_foreign_server_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateForeignServerStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:create_foreign_server_stmt,
                       PgQuery.CreateForeignServerStmt.decode!(delimited)}}
                 end
               ], rest}

            {141, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_foreign_server_stmt, previous_value} ->
                     {:node,
                      {:alter_foreign_server_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterForeignServerStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:alter_foreign_server_stmt,
                       PgQuery.AlterForeignServerStmt.decode!(delimited)}}
                 end
               ], rest}

            {142, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_user_mapping_stmt, previous_value} ->
                     {:node,
                      {:create_user_mapping_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateUserMappingStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:create_user_mapping_stmt,
                       PgQuery.CreateUserMappingStmt.decode!(delimited)}}
                 end
               ], rest}

            {143, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_user_mapping_stmt, previous_value} ->
                     {:node,
                      {:alter_user_mapping_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterUserMappingStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:alter_user_mapping_stmt, PgQuery.AlterUserMappingStmt.decode!(delimited)}}
                 end
               ], rest}

            {144, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:drop_user_mapping_stmt, previous_value} ->
                     {:node,
                      {:drop_user_mapping_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.DropUserMappingStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:drop_user_mapping_stmt, PgQuery.DropUserMappingStmt.decode!(delimited)}}
                 end
               ], rest}

            {145, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_table_space_options_stmt, previous_value} ->
                     {:node,
                      {:alter_table_space_options_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterTableSpaceOptionsStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:alter_table_space_options_stmt,
                       PgQuery.AlterTableSpaceOptionsStmt.decode!(delimited)}}
                 end
               ], rest}

            {146, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_table_move_all_stmt, previous_value} ->
                     {:node,
                      {:alter_table_move_all_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterTableMoveAllStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:alter_table_move_all_stmt,
                       PgQuery.AlterTableMoveAllStmt.decode!(delimited)}}
                 end
               ], rest}

            {147, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:sec_label_stmt, previous_value} ->
                     {:node,
                      {:sec_label_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.SecLabelStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:sec_label_stmt, PgQuery.SecLabelStmt.decode!(delimited)}}
                 end
               ], rest}

            {148, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_foreign_table_stmt, previous_value} ->
                     {:node,
                      {:create_foreign_table_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateForeignTableStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:create_foreign_table_stmt,
                       PgQuery.CreateForeignTableStmt.decode!(delimited)}}
                 end
               ], rest}

            {149, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:import_foreign_schema_stmt, previous_value} ->
                     {:node,
                      {:import_foreign_schema_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.ImportForeignSchemaStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:import_foreign_schema_stmt,
                       PgQuery.ImportForeignSchemaStmt.decode!(delimited)}}
                 end
               ], rest}

            {150, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_extension_stmt, previous_value} ->
                     {:node,
                      {:create_extension_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateExtensionStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:create_extension_stmt, PgQuery.CreateExtensionStmt.decode!(delimited)}}
                 end
               ], rest}

            {151, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_extension_stmt, previous_value} ->
                     {:node,
                      {:alter_extension_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterExtensionStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:alter_extension_stmt, PgQuery.AlterExtensionStmt.decode!(delimited)}}
                 end
               ], rest}

            {152, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_extension_contents_stmt, previous_value} ->
                     {:node,
                      {:alter_extension_contents_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterExtensionContentsStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:alter_extension_contents_stmt,
                       PgQuery.AlterExtensionContentsStmt.decode!(delimited)}}
                 end
               ], rest}

            {153, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_event_trig_stmt, previous_value} ->
                     {:node,
                      {:create_event_trig_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateEventTrigStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:create_event_trig_stmt, PgQuery.CreateEventTrigStmt.decode!(delimited)}}
                 end
               ], rest}

            {154, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_event_trig_stmt, previous_value} ->
                     {:node,
                      {:alter_event_trig_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterEventTrigStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:alter_event_trig_stmt, PgQuery.AlterEventTrigStmt.decode!(delimited)}}
                 end
               ], rest}

            {155, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:refresh_mat_view_stmt, previous_value} ->
                     {:node,
                      {:refresh_mat_view_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.RefreshMatViewStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:refresh_mat_view_stmt, PgQuery.RefreshMatViewStmt.decode!(delimited)}}
                 end
               ], rest}

            {156, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:replica_identity_stmt, previous_value} ->
                     {:node,
                      {:replica_identity_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.ReplicaIdentityStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:replica_identity_stmt, PgQuery.ReplicaIdentityStmt.decode!(delimited)}}
                 end
               ], rest}

            {157, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_system_stmt, previous_value} ->
                     {:node,
                      {:alter_system_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterSystemStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:alter_system_stmt, PgQuery.AlterSystemStmt.decode!(delimited)}}
                 end
               ], rest}

            {158, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_policy_stmt, previous_value} ->
                     {:node,
                      {:create_policy_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreatePolicyStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:create_policy_stmt, PgQuery.CreatePolicyStmt.decode!(delimited)}}
                 end
               ], rest}

            {159, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_policy_stmt, previous_value} ->
                     {:node,
                      {:alter_policy_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterPolicyStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:alter_policy_stmt, PgQuery.AlterPolicyStmt.decode!(delimited)}}
                 end
               ], rest}

            {160, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_transform_stmt, previous_value} ->
                     {:node,
                      {:create_transform_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateTransformStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:create_transform_stmt, PgQuery.CreateTransformStmt.decode!(delimited)}}
                 end
               ], rest}

            {161, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_am_stmt, previous_value} ->
                     {:node,
                      {:create_am_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateAmStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:create_am_stmt, PgQuery.CreateAmStmt.decode!(delimited)}}
                 end
               ], rest}

            {162, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_publication_stmt, previous_value} ->
                     {:node,
                      {:create_publication_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreatePublicationStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:create_publication_stmt, PgQuery.CreatePublicationStmt.decode!(delimited)}}
                 end
               ], rest}

            {163, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_publication_stmt, previous_value} ->
                     {:node,
                      {:alter_publication_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterPublicationStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:alter_publication_stmt, PgQuery.AlterPublicationStmt.decode!(delimited)}}
                 end
               ], rest}

            {164, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_subscription_stmt, previous_value} ->
                     {:node,
                      {:create_subscription_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateSubscriptionStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:create_subscription_stmt,
                       PgQuery.CreateSubscriptionStmt.decode!(delimited)}}
                 end
               ], rest}

            {165, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_subscription_stmt, previous_value} ->
                     {:node,
                      {:alter_subscription_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterSubscriptionStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:alter_subscription_stmt, PgQuery.AlterSubscriptionStmt.decode!(delimited)}}
                 end
               ], rest}

            {166, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:drop_subscription_stmt, previous_value} ->
                     {:node,
                      {:drop_subscription_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.DropSubscriptionStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:drop_subscription_stmt, PgQuery.DropSubscriptionStmt.decode!(delimited)}}
                 end
               ], rest}

            {167, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_stats_stmt, previous_value} ->
                     {:node,
                      {:create_stats_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateStatsStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:create_stats_stmt, PgQuery.CreateStatsStmt.decode!(delimited)}}
                 end
               ], rest}

            {168, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_collation_stmt, previous_value} ->
                     {:node,
                      {:alter_collation_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterCollationStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:alter_collation_stmt, PgQuery.AlterCollationStmt.decode!(delimited)}}
                 end
               ], rest}

            {169, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:call_stmt, previous_value} ->
                     {:node,
                      {:call_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CallStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:call_stmt, PgQuery.CallStmt.decode!(delimited)}}
                 end
               ], rest}

            {170, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:alter_stats_stmt, previous_value} ->
                     {:node,
                      {:alter_stats_stmt,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AlterStatsStmt.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:alter_stats_stmt, PgQuery.AlterStatsStmt.decode!(delimited)}}
                 end
               ], rest}

            {171, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:a_expr, previous_value} ->
                     {:node,
                      {:a_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.A_Expr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:a_expr, PgQuery.A_Expr.decode!(delimited)}}
                 end
               ], rest}

            {172, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:column_ref, previous_value} ->
                     {:node,
                      {:column_ref,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.ColumnRef.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:column_ref, PgQuery.ColumnRef.decode!(delimited)}}
                 end
               ], rest}

            {173, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:param_ref, previous_value} ->
                     {:node,
                      {:param_ref,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.ParamRef.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:param_ref, PgQuery.ParamRef.decode!(delimited)}}
                 end
               ], rest}

            {174, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:func_call, previous_value} ->
                     {:node,
                      {:func_call,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.FuncCall.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:func_call, PgQuery.FuncCall.decode!(delimited)}}
                 end
               ], rest}

            {175, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:a_star, previous_value} ->
                     {:node,
                      {:a_star,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.A_Star.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:a_star, PgQuery.A_Star.decode!(delimited)}}
                 end
               ], rest}

            {176, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:a_indices, previous_value} ->
                     {:node,
                      {:a_indices,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.A_Indices.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:a_indices, PgQuery.A_Indices.decode!(delimited)}}
                 end
               ], rest}

            {177, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:a_indirection, previous_value} ->
                     {:node,
                      {:a_indirection,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.A_Indirection.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:a_indirection, PgQuery.A_Indirection.decode!(delimited)}}
                 end
               ], rest}

            {178, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:a_array_expr, previous_value} ->
                     {:node,
                      {:a_array_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.A_ArrayExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:a_array_expr, PgQuery.A_ArrayExpr.decode!(delimited)}}
                 end
               ], rest}

            {179, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:res_target, previous_value} ->
                     {:node,
                      {:res_target,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.ResTarget.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:res_target, PgQuery.ResTarget.decode!(delimited)}}
                 end
               ], rest}

            {180, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:multi_assign_ref, previous_value} ->
                     {:node,
                      {:multi_assign_ref,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.MultiAssignRef.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:multi_assign_ref, PgQuery.MultiAssignRef.decode!(delimited)}}
                 end
               ], rest}

            {181, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:type_cast, previous_value} ->
                     {:node,
                      {:type_cast,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.TypeCast.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:type_cast, PgQuery.TypeCast.decode!(delimited)}}
                 end
               ], rest}

            {182, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:collate_clause, previous_value} ->
                     {:node,
                      {:collate_clause,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CollateClause.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:collate_clause, PgQuery.CollateClause.decode!(delimited)}}
                 end
               ], rest}

            {183, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:sort_by, previous_value} ->
                     {:node,
                      {:sort_by,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.SortBy.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:sort_by, PgQuery.SortBy.decode!(delimited)}}
                 end
               ], rest}

            {184, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:window_def, previous_value} ->
                     {:node,
                      {:window_def,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.WindowDef.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:window_def, PgQuery.WindowDef.decode!(delimited)}}
                 end
               ], rest}

            {185, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:range_subselect, previous_value} ->
                     {:node,
                      {:range_subselect,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.RangeSubselect.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:range_subselect, PgQuery.RangeSubselect.decode!(delimited)}}
                 end
               ], rest}

            {186, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:range_function, previous_value} ->
                     {:node,
                      {:range_function,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.RangeFunction.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:range_function, PgQuery.RangeFunction.decode!(delimited)}}
                 end
               ], rest}

            {187, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:range_table_sample, previous_value} ->
                     {:node,
                      {:range_table_sample,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.RangeTableSample.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:range_table_sample, PgQuery.RangeTableSample.decode!(delimited)}}
                 end
               ], rest}

            {188, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:range_table_func, previous_value} ->
                     {:node,
                      {:range_table_func,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.RangeTableFunc.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:range_table_func, PgQuery.RangeTableFunc.decode!(delimited)}}
                 end
               ], rest}

            {189, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:range_table_func_col, previous_value} ->
                     {:node,
                      {:range_table_func_col,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.RangeTableFuncCol.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:range_table_func_col, PgQuery.RangeTableFuncCol.decode!(delimited)}}
                 end
               ], rest}

            {190, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:type_name, previous_value} ->
                     {:node,
                      {:type_name,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.TypeName.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:type_name, PgQuery.TypeName.decode!(delimited)}}
                 end
               ], rest}

            {191, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:column_def, previous_value} ->
                     {:node,
                      {:column_def,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.ColumnDef.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:column_def, PgQuery.ColumnDef.decode!(delimited)}}
                 end
               ], rest}

            {192, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:index_elem, previous_value} ->
                     {:node,
                      {:index_elem,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.IndexElem.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:index_elem, PgQuery.IndexElem.decode!(delimited)}}
                 end
               ], rest}

            {193, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:stats_elem, previous_value} ->
                     {:node,
                      {:stats_elem,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.StatsElem.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:stats_elem, PgQuery.StatsElem.decode!(delimited)}}
                 end
               ], rest}

            {194, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:constraint, previous_value} ->
                     {:node,
                      {:constraint,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.Constraint.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:constraint, PgQuery.Constraint.decode!(delimited)}}
                 end
               ], rest}

            {195, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:def_elem, previous_value} ->
                     {:node,
                      {:def_elem,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.DefElem.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:def_elem, PgQuery.DefElem.decode!(delimited)}}
                 end
               ], rest}

            {196, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:range_tbl_entry, previous_value} ->
                     {:node,
                      {:range_tbl_entry,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.RangeTblEntry.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:range_tbl_entry, PgQuery.RangeTblEntry.decode!(delimited)}}
                 end
               ], rest}

            {197, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:range_tbl_function, previous_value} ->
                     {:node,
                      {:range_tbl_function,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.RangeTblFunction.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:range_tbl_function, PgQuery.RangeTblFunction.decode!(delimited)}}
                 end
               ], rest}

            {198, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:table_sample_clause, previous_value} ->
                     {:node,
                      {:table_sample_clause,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.TableSampleClause.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:table_sample_clause, PgQuery.TableSampleClause.decode!(delimited)}}
                 end
               ], rest}

            {199, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:with_check_option, previous_value} ->
                     {:node,
                      {:with_check_option,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.WithCheckOption.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:with_check_option, PgQuery.WithCheckOption.decode!(delimited)}}
                 end
               ], rest}

            {200, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:sort_group_clause, previous_value} ->
                     {:node,
                      {:sort_group_clause,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.SortGroupClause.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:sort_group_clause, PgQuery.SortGroupClause.decode!(delimited)}}
                 end
               ], rest}

            {201, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:grouping_set, previous_value} ->
                     {:node,
                      {:grouping_set,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.GroupingSet.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:grouping_set, PgQuery.GroupingSet.decode!(delimited)}}
                 end
               ], rest}

            {202, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:window_clause, previous_value} ->
                     {:node,
                      {:window_clause,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.WindowClause.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:window_clause, PgQuery.WindowClause.decode!(delimited)}}
                 end
               ], rest}

            {203, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:object_with_args, previous_value} ->
                     {:node,
                      {:object_with_args,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.ObjectWithArgs.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:object_with_args, PgQuery.ObjectWithArgs.decode!(delimited)}}
                 end
               ], rest}

            {204, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:access_priv, previous_value} ->
                     {:node,
                      {:access_priv,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.AccessPriv.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:access_priv, PgQuery.AccessPriv.decode!(delimited)}}
                 end
               ], rest}

            {205, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:create_op_class_item, previous_value} ->
                     {:node,
                      {:create_op_class_item,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CreateOpClassItem.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:create_op_class_item, PgQuery.CreateOpClassItem.decode!(delimited)}}
                 end
               ], rest}

            {206, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:table_like_clause, previous_value} ->
                     {:node,
                      {:table_like_clause,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.TableLikeClause.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:table_like_clause, PgQuery.TableLikeClause.decode!(delimited)}}
                 end
               ], rest}

            {207, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:function_parameter, previous_value} ->
                     {:node,
                      {:function_parameter,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.FunctionParameter.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:function_parameter, PgQuery.FunctionParameter.decode!(delimited)}}
                 end
               ], rest}

            {208, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:locking_clause, previous_value} ->
                     {:node,
                      {:locking_clause,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.LockingClause.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:locking_clause, PgQuery.LockingClause.decode!(delimited)}}
                 end
               ], rest}

            {209, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:row_mark_clause, previous_value} ->
                     {:node,
                      {:row_mark_clause,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.RowMarkClause.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:row_mark_clause, PgQuery.RowMarkClause.decode!(delimited)}}
                 end
               ], rest}

            {210, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:xml_serialize, previous_value} ->
                     {:node,
                      {:xml_serialize,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.XmlSerialize.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:xml_serialize, PgQuery.XmlSerialize.decode!(delimited)}}
                 end
               ], rest}

            {211, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:with_clause, previous_value} ->
                     {:node,
                      {:with_clause,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.WithClause.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:with_clause, PgQuery.WithClause.decode!(delimited)}}
                 end
               ], rest}

            {212, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:infer_clause, previous_value} ->
                     {:node,
                      {:infer_clause,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.InferClause.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:infer_clause, PgQuery.InferClause.decode!(delimited)}}
                 end
               ], rest}

            {213, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:on_conflict_clause, previous_value} ->
                     {:node,
                      {:on_conflict_clause,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.OnConflictClause.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:on_conflict_clause, PgQuery.OnConflictClause.decode!(delimited)}}
                 end
               ], rest}

            {214, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:ctesearch_clause, previous_value} ->
                     {:node,
                      {:ctesearch_clause,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CTESearchClause.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:ctesearch_clause, PgQuery.CTESearchClause.decode!(delimited)}}
                 end
               ], rest}

            {215, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:ctecycle_clause, previous_value} ->
                     {:node,
                      {:ctecycle_clause,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CTECycleClause.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:ctecycle_clause, PgQuery.CTECycleClause.decode!(delimited)}}
                 end
               ], rest}

            {216, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:common_table_expr, previous_value} ->
                     {:node,
                      {:common_table_expr,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CommonTableExpr.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:common_table_expr, PgQuery.CommonTableExpr.decode!(delimited)}}
                 end
               ], rest}

            {217, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:merge_when_clause, previous_value} ->
                     {:node,
                      {:merge_when_clause,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.MergeWhenClause.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:merge_when_clause, PgQuery.MergeWhenClause.decode!(delimited)}}
                 end
               ], rest}

            {218, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:role_spec, previous_value} ->
                     {:node,
                      {:role_spec,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.RoleSpec.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:role_spec, PgQuery.RoleSpec.decode!(delimited)}}
                 end
               ], rest}

            {219, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:trigger_transition, previous_value} ->
                     {:node,
                      {:trigger_transition,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.TriggerTransition.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:trigger_transition, PgQuery.TriggerTransition.decode!(delimited)}}
                 end
               ], rest}

            {220, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:partition_elem, previous_value} ->
                     {:node,
                      {:partition_elem,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.PartitionElem.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:partition_elem, PgQuery.PartitionElem.decode!(delimited)}}
                 end
               ], rest}

            {221, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:partition_spec, previous_value} ->
                     {:node,
                      {:partition_spec,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.PartitionSpec.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:partition_spec, PgQuery.PartitionSpec.decode!(delimited)}}
                 end
               ], rest}

            {222, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:partition_bound_spec, previous_value} ->
                     {:node,
                      {:partition_bound_spec,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.PartitionBoundSpec.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:partition_bound_spec, PgQuery.PartitionBoundSpec.decode!(delimited)}}
                 end
               ], rest}

            {223, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:partition_range_datum, previous_value} ->
                     {:node,
                      {:partition_range_datum,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.PartitionRangeDatum.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:partition_range_datum, PgQuery.PartitionRangeDatum.decode!(delimited)}}
                 end
               ], rest}

            {224, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:partition_cmd, previous_value} ->
                     {:node,
                      {:partition_cmd,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.PartitionCmd.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:partition_cmd, PgQuery.PartitionCmd.decode!(delimited)}}
                 end
               ], rest}

            {225, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:vacuum_relation, previous_value} ->
                     {:node,
                      {:vacuum_relation,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.VacuumRelation.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:vacuum_relation, PgQuery.VacuumRelation.decode!(delimited)}}
                 end
               ], rest}

            {226, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:publication_obj_spec, previous_value} ->
                     {:node,
                      {:publication_obj_spec,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.PublicationObjSpec.decode!(delimited)
                       )}}

                   _ ->
                     {:node,
                      {:publication_obj_spec, PgQuery.PublicationObjSpec.decode!(delimited)}}
                 end
               ], rest}

            {227, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:publication_table, previous_value} ->
                     {:node,
                      {:publication_table,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.PublicationTable.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:publication_table, PgQuery.PublicationTable.decode!(delimited)}}
                 end
               ], rest}

            {228, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:inline_code_block, previous_value} ->
                     {:node,
                      {:inline_code_block,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.InlineCodeBlock.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:inline_code_block, PgQuery.InlineCodeBlock.decode!(delimited)}}
                 end
               ], rest}

            {229, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:call_context, previous_value} ->
                     {:node,
                      {:call_context,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.CallContext.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:call_context, PgQuery.CallContext.decode!(delimited)}}
                 end
               ], rest}

            {230, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:integer, previous_value} ->
                     {:node,
                      {:integer,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.Integer.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:integer, PgQuery.Integer.decode!(delimited)}}
                 end
               ], rest}

            {231, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:float, previous_value} ->
                     {:node,
                      {:float,
                       Protox.MergeMessage.merge(previous_value, PgQuery.Float.decode!(delimited))}}

                   _ ->
                     {:node, {:float, PgQuery.Float.decode!(delimited)}}
                 end
               ], rest}

            {232, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:boolean, previous_value} ->
                     {:node,
                      {:boolean,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.Boolean.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:boolean, PgQuery.Boolean.decode!(delimited)}}
                 end
               ], rest}

            {233, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:string, previous_value} ->
                     {:node,
                      {:string,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.String.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:string, PgQuery.String.decode!(delimited)}}
                 end
               ], rest}

            {234, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:bit_string, previous_value} ->
                     {:node,
                      {:bit_string,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.BitString.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:bit_string, PgQuery.BitString.decode!(delimited)}}
                 end
               ], rest}

            {235, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:list, previous_value} ->
                     {:node,
                      {:list,
                       Protox.MergeMessage.merge(previous_value, PgQuery.List.decode!(delimited))}}

                   _ ->
                     {:node, {:list, PgQuery.List.decode!(delimited)}}
                 end
               ], rest}

            {236, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:int_list, previous_value} ->
                     {:node,
                      {:int_list,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.IntList.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:int_list, PgQuery.IntList.decode!(delimited)}}
                 end
               ], rest}

            {237, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:oid_list, previous_value} ->
                     {:node,
                      {:oid_list,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.OidList.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:oid_list, PgQuery.OidList.decode!(delimited)}}
                 end
               ], rest}

            {238, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.node do
                   {:a_const, previous_value} ->
                     {:node,
                      {:a_const,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.A_Const.decode!(delimited)
                       )}}

                   _ ->
                     {:node, {:a_const, PgQuery.A_Const.decode!(delimited)}}
                 end
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
        PgQuery.Node,
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
        33 => {:coalesce_expr, {:oneof, :node}, {:message, PgQuery.CoalesceExpr}},
        168 => {:alter_collation_stmt, {:oneof, :node}, {:message, PgQuery.AlterCollationStmt}},
        117 => {:create_op_family_stmt, {:oneof, :node}, {:message, PgQuery.CreateOpFamilyStmt}},
        175 => {:a_star, {:oneof, :node}, {:message, PgQuery.A_Star}},
        219 => {:trigger_transition, {:oneof, :node}, {:message, PgQuery.TriggerTransition}},
        12 => {:op_expr, {:oneof, :node}, {:message, PgQuery.OpExpr}},
        192 => {:index_elem, {:oneof, :node}, {:message, PgQuery.IndexElem}},
        188 => {:range_table_func, {:oneof, :node}, {:message, PgQuery.RangeTableFunc}},
        157 => {:alter_system_stmt, {:oneof, :node}, {:message, PgQuery.AlterSystemStmt}},
        132 => {:composite_type_stmt, {:oneof, :node}, {:message, PgQuery.CompositeTypeStmt}},
        73 => {:drop_stmt, {:oneof, :node}, {:message, PgQuery.DropStmt}},
        44 => {:inference_elem, {:oneof, :node}, {:message, PgQuery.InferenceElem}},
        183 => {:sort_by, {:oneof, :node}, {:message, PgQuery.SortBy}},
        124 => {:drop_table_space_stmt, {:oneof, :node}, {:message, PgQuery.DropTableSpaceStmt}},
        170 => {:alter_stats_stmt, {:oneof, :node}, {:message, PgQuery.AlterStatsStmt}},
        23 => {:coerce_via_io, {:oneof, :node}, {:message, PgQuery.CoerceViaIO}},
        29 => {:case_test_expr, {:oneof, :node}, {:message, PgQuery.CaseTestExpr}},
        47 => {:join_expr, {:oneof, :node}, {:message, PgQuery.JoinExpr}},
        89 => {:create_domain_stmt, {:oneof, :node}, {:message, PgQuery.CreateDomainStmt}},
        203 => {:object_with_args, {:oneof, :node}, {:message, PgQuery.ObjectWithArgs}},
        61 => {:alter_table_stmt, {:oneof, :node}, {:message, PgQuery.AlterTableStmt}},
        30 => {:array_expr, {:oneof, :node}, {:message, PgQuery.ArrayExpr}},
        43 => {:next_value_expr, {:oneof, :node}, {:message, PgQuery.NextValueExpr}},
        163 =>
          {:alter_publication_stmt, {:oneof, :node}, {:message, PgQuery.AlterPublicationStmt}},
        39 => {:coerce_to_domain, {:oneof, :node}, {:message, PgQuery.CoerceToDomain}},
        131 => {:reassign_owned_stmt, {:oneof, :node}, {:message, PgQuery.ReassignOwnedStmt}},
        45 => {:target_entry, {:oneof, :node}, {:message, PgQuery.TargetEntry}},
        235 => {:list, {:oneof, :node}, {:message, PgQuery.List}},
        48 => {:from_expr, {:oneof, :node}, {:message, PgQuery.FromExpr}},
        145 =>
          {:alter_table_space_options_stmt, {:oneof, :node},
           {:message, PgQuery.AlterTableSpaceOptionsStmt}},
        171 => {:a_expr, {:oneof, :node}, {:message, PgQuery.A_Expr}},
        197 => {:range_tbl_function, {:oneof, :node}, {:message, PgQuery.RangeTblFunction}},
        57 => {:merge_stmt, {:oneof, :node}, {:message, PgQuery.MergeStmt}},
        143 =>
          {:alter_user_mapping_stmt, {:oneof, :node}, {:message, PgQuery.AlterUserMappingStmt}},
        237 => {:oid_list, {:oneof, :node}, {:message, PgQuery.OidList}},
        221 => {:partition_spec, {:oneof, :node}, {:message, PgQuery.PartitionSpec}},
        113 => {:alter_role_set_stmt, {:oneof, :node}, {:message, PgQuery.AlterRoleSetStmt}},
        225 => {:vacuum_relation, {:oneof, :node}, {:message, PgQuery.VacuumRelation}},
        26 => {:collate_expr, {:oneof, :node}, {:message, PgQuery.CollateExpr}},
        69 => {:cluster_stmt, {:oneof, :node}, {:message, PgQuery.ClusterStmt}},
        88 => {:load_stmt, {:oneof, :node}, {:message, PgQuery.LoadStmt}},
        191 => {:column_def, {:oneof, :node}, {:message, PgQuery.ColumnDef}},
        166 =>
          {:drop_subscription_stmt, {:oneof, :node}, {:message, PgQuery.DropSubscriptionStmt}},
        144 =>
          {:drop_user_mapping_stmt, {:oneof, :node}, {:message, PgQuery.DropUserMappingStmt}},
        209 => {:row_mark_clause, {:oneof, :node}, {:message, PgQuery.RowMarkClause}},
        141 =>
          {:alter_foreign_server_stmt, {:oneof, :node},
           {:message, PgQuery.AlterForeignServerStmt}},
        216 => {:common_table_expr, {:oneof, :node}, {:message, PgQuery.CommonTableExpr}},
        152 =>
          {:alter_extension_contents_stmt, {:oneof, :node},
           {:message, PgQuery.AlterExtensionContentsStmt}},
        63 => {:alter_domain_stmt, {:oneof, :node}, {:message, PgQuery.AlterDomainStmt}},
        165 =>
          {:alter_subscription_stmt, {:oneof, :node}, {:message, PgQuery.AlterSubscriptionStmt}},
        100 => {:create_trig_stmt, {:oneof, :node}, {:message, PgQuery.CreateTrigStmt}},
        71 => {:create_stmt, {:oneof, :node}, {:message, PgQuery.CreateStmt}},
        133 => {:create_enum_stmt, {:oneof, :node}, {:message, PgQuery.CreateEnumStmt}},
        46 => {:range_tbl_ref, {:oneof, :node}, {:message, PgQuery.RangeTblRef}},
        31 => {:row_expr, {:oneof, :node}, {:message, PgQuery.RowExpr}},
        229 => {:call_context, {:oneof, :node}, {:message, PgQuery.CallContext}},
        158 => {:create_policy_stmt, {:oneof, :node}, {:message, PgQuery.CreatePolicyStmt}},
        167 => {:create_stats_stmt, {:oneof, :node}, {:message, PgQuery.CreateStatsStmt}},
        98 => {:variable_show_stmt, {:oneof, :node}, {:message, PgQuery.VariableShowStmt}},
        81 => {:rename_stmt, {:oneof, :node}, {:message, PgQuery.RenameStmt}},
        11 => {:named_arg_expr, {:oneof, :node}, {:message, PgQuery.NamedArgExpr}},
        37 => {:null_test, {:oneof, :node}, {:message, PgQuery.NullTest}},
        153 =>
          {:create_event_trig_stmt, {:oneof, :node}, {:message, PgQuery.CreateEventTrigStmt}},
        193 => {:stats_elem, {:oneof, :node}, {:message, PgQuery.StatsElem}},
        9 => {:subscripting_ref, {:oneof, :node}, {:message, PgQuery.SubscriptingRef}},
        76 => {:fetch_stmt, {:oneof, :node}, {:message, PgQuery.FetchStmt}},
        173 => {:param_ref, {:oneof, :node}, {:message, PgQuery.ParamRef}},
        32 => {:row_compare_expr, {:oneof, :node}, {:message, PgQuery.RowCompareExpr}},
        184 => {:window_def, {:oneof, :node}, {:message, PgQuery.WindowDef}},
        34 => {:min_max_expr, {:oneof, :node}, {:message, PgQuery.MinMaxExpr}},
        232 => {:boolean, {:oneof, :node}, {:message, PgQuery.Boolean}},
        238 => {:a_const, {:oneof, :node}, {:message, PgQuery.A_Const}},
        25 => {:convert_rowtype_expr, {:oneof, :node}, {:message, PgQuery.ConvertRowtypeExpr}},
        28 => {:case_when, {:oneof, :node}, {:message, PgQuery.CaseWhen}},
        199 => {:with_check_option, {:oneof, :node}, {:message, PgQuery.WithCheckOption}},
        195 => {:def_elem, {:oneof, :node}, {:message, PgQuery.DefElem}},
        222 => {:partition_bound_spec, {:oneof, :node}, {:message, PgQuery.PartitionBoundSpec}},
        211 => {:with_clause, {:oneof, :node}, {:message, PgQuery.WithClause}},
        206 => {:table_like_clause, {:oneof, :node}, {:message, PgQuery.TableLikeClause}},
        85 => {:unlisten_stmt, {:oneof, :node}, {:message, PgQuery.UnlistenStmt}},
        213 => {:on_conflict_clause, {:oneof, :node}, {:message, PgQuery.OnConflictClause}},
        91 => {:dropdb_stmt, {:oneof, :node}, {:message, PgQuery.DropdbStmt}},
        224 => {:partition_cmd, {:oneof, :node}, {:message, PgQuery.PartitionCmd}},
        120 => {:execute_stmt, {:oneof, :node}, {:message, PgQuery.ExecuteStmt}},
        230 => {:integer, {:oneof, :node}, {:message, PgQuery.Integer}},
        64 => {:set_operation_stmt, {:oneof, :node}, {:message, PgQuery.SetOperationStmt}},
        194 => {:constraint, {:oneof, :node}, {:message, PgQuery.Constraint}},
        146 =>
          {:alter_table_move_all_stmt, {:oneof, :node}, {:message, PgQuery.AlterTableMoveAllStmt}},
        6 => {:aggref, {:oneof, :node}, {:message, PgQuery.Aggref}},
        223 => {:partition_range_datum, {:oneof, :node}, {:message, PgQuery.PartitionRangeDatum}},
        236 => {:int_list, {:oneof, :node}, {:message, PgQuery.IntList}},
        109 => {:create_schema_stmt, {:oneof, :node}, {:message, PgQuery.CreateSchemaStmt}},
        180 => {:multi_assign_ref, {:oneof, :node}, {:message, PgQuery.MultiAssignRef}},
        72 => {:define_stmt, {:oneof, :node}, {:message, PgQuery.DefineStmt}},
        110 => {:alter_database_stmt, {:oneof, :node}, {:message, PgQuery.AlterDatabaseStmt}},
        68 => {:close_portal_stmt, {:oneof, :node}, {:message, PgQuery.ClosePortalStmt}},
        212 => {:infer_clause, {:oneof, :node}, {:message, PgQuery.InferClause}},
        86 => {:transaction_stmt, {:oneof, :node}, {:message, PgQuery.TransactionStmt}},
        116 => {:create_op_class_stmt, {:oneof, :node}, {:message, PgQuery.CreateOpClassStmt}},
        51 => {:merge_action, {:oneof, :node}, {:message, PgQuery.MergeAction}},
        80 => {:do_stmt, {:oneof, :node}, {:message, PgQuery.DoStmt}},
        38 => {:boolean_test, {:oneof, :node}, {:message, PgQuery.BooleanTest}},
        218 => {:role_spec, {:oneof, :node}, {:message, PgQuery.RoleSpec}},
        137 =>
          {:alter_tsconfiguration_stmt, {:oneof, :node},
           {:message, PgQuery.AlterTSConfigurationStmt}},
        126 =>
          {:alter_object_schema_stmt, {:oneof, :node}, {:message, PgQuery.AlterObjectSchemaStmt}},
        13 => {:distinct_expr, {:oneof, :node}, {:message, PgQuery.DistinctExpr}},
        59 => {:return_stmt, {:oneof, :node}, {:message, PgQuery.ReturnStmt}},
        40 => {:coerce_to_domain_value, {:oneof, :node}, {:message, PgQuery.CoerceToDomainValue}},
        123 =>
          {:create_table_space_stmt, {:oneof, :node}, {:message, PgQuery.CreateTableSpaceStmt}},
        77 => {:index_stmt, {:oneof, :node}, {:message, PgQuery.IndexStmt}},
        95 => {:create_seq_stmt, {:oneof, :node}, {:message, PgQuery.CreateSeqStmt}},
        130 => {:drop_owned_stmt, {:oneof, :node}, {:message, PgQuery.DropOwnedStmt}},
        41 => {:set_to_default, {:oneof, :node}, {:message, PgQuery.SetToDefault}},
        214 => {:ctesearch_clause, {:oneof, :node}, {:message, PgQuery.CTESearchClause}},
        20 => {:field_select, {:oneof, :node}, {:message, PgQuery.FieldSelect}},
        78 => {:create_function_stmt, {:oneof, :node}, {:message, PgQuery.CreateFunctionStmt}},
        174 => {:func_call, {:oneof, :node}, {:message, PgQuery.FuncCall}},
        215 => {:ctecycle_clause, {:oneof, :node}, {:message, PgQuery.CTECycleClause}},
        15 => {:scalar_array_op_expr, {:oneof, :node}, {:message, PgQuery.ScalarArrayOpExpr}},
        147 => {:sec_label_stmt, {:oneof, :node}, {:message, PgQuery.SecLabelStmt}},
        14 => {:null_if_expr, {:oneof, :node}, {:message, PgQuery.NullIfExpr}},
        187 => {:range_table_sample, {:oneof, :node}, {:message, PgQuery.RangeTableSample}},
        108 => {:check_point_stmt, {:oneof, :node}, {:message, PgQuery.CheckPointStmt}},
        60 => {:plassign_stmt, {:oneof, :node}, {:message, PgQuery.PLAssignStmt}},
        2 => {:range_var, {:oneof, :node}, {:message, PgQuery.RangeVar}},
        162 =>
          {:create_publication_stmt, {:oneof, :node}, {:message, PgQuery.CreatePublicationStmt}},
        103 => {:alter_role_stmt, {:oneof, :node}, {:message, PgQuery.AlterRoleStmt}},
        7 => {:grouping_func, {:oneof, :node}, {:message, PgQuery.GroupingFunc}},
        233 => {:string, {:oneof, :node}, {:message, PgQuery.String}},
        122 => {:declare_cursor_stmt, {:oneof, :node}, {:message, PgQuery.DeclareCursorStmt}},
        140 =>
          {:create_foreign_server_stmt, {:oneof, :node},
           {:message, PgQuery.CreateForeignServerStmt}},
        176 => {:a_indices, {:oneof, :node}, {:message, PgQuery.A_Indices}},
        83 => {:notify_stmt, {:oneof, :node}, {:message, PgQuery.NotifyStmt}},
        74 => {:truncate_stmt, {:oneof, :node}, {:message, PgQuery.TruncateStmt}},
        139 => {:alter_fdw_stmt, {:oneof, :node}, {:message, PgQuery.AlterFdwStmt}},
        99 => {:discard_stmt, {:oneof, :node}, {:message, PgQuery.DiscardStmt}},
        112 =>
          {:alter_database_set_stmt, {:oneof, :node}, {:message, PgQuery.AlterDatabaseSetStmt}},
        196 => {:range_tbl_entry, {:oneof, :node}, {:message, PgQuery.RangeTblEntry}},
        1 => {:alias, {:oneof, :node}, {:message, PgQuery.Alias}},
        207 => {:function_parameter, {:oneof, :node}, {:message, PgQuery.FunctionParameter}},
        97 => {:variable_set_stmt, {:oneof, :node}, {:message, PgQuery.VariableSetStmt}},
        149 =>
          {:import_foreign_schema_stmt, {:oneof, :node},
           {:message, PgQuery.ImportForeignSchemaStmt}},
        104 => {:drop_role_stmt, {:oneof, :node}, {:message, PgQuery.DropRoleStmt}},
        8 => {:window_func, {:oneof, :node}, {:message, PgQuery.WindowFunc}},
        134 => {:create_range_stmt, {:oneof, :node}, {:message, PgQuery.CreateRangeStmt}},
        198 => {:table_sample_clause, {:oneof, :node}, {:message, PgQuery.TableSampleClause}},
        186 => {:range_function, {:oneof, :node}, {:message, PgQuery.RangeFunction}},
        3 => {:table_func, {:oneof, :node}, {:message, PgQuery.TableFunc}},
        75 => {:comment_stmt, {:oneof, :node}, {:message, PgQuery.CommentStmt}},
        90 => {:createdb_stmt, {:oneof, :node}, {:message, PgQuery.CreatedbStmt}},
        154 => {:alter_event_trig_stmt, {:oneof, :node}, {:message, PgQuery.AlterEventTrigStmt}},
        151 => {:alter_extension_stmt, {:oneof, :node}, {:message, PgQuery.AlterExtensionStmt}},
        58 => {:select_stmt, {:oneof, :node}, {:message, PgQuery.SelectStmt}},
        135 => {:alter_enum_stmt, {:oneof, :node}, {:message, PgQuery.AlterEnumStmt}},
        55 => {:delete_stmt, {:oneof, :node}, {:message, PgQuery.DeleteStmt}},
        181 => {:type_cast, {:oneof, :node}, {:message, PgQuery.TypeCast}},
        228 => {:inline_code_block, {:oneof, :node}, {:message, PgQuery.InlineCodeBlock}},
        189 => {:range_table_func_col, {:oneof, :node}, {:message, PgQuery.RangeTableFuncCol}},
        17 => {:sub_link, {:oneof, :node}, {:message, PgQuery.SubLink}},
        22 => {:relabel_type, {:oneof, :node}, {:message, PgQuery.RelabelType}},
        52 => {:raw_stmt, {:oneof, :node}, {:message, PgQuery.RawStmt}},
        111 =>
          {:alter_database_refresh_coll_stmt, {:oneof, :node},
           {:message, PgQuery.AlterDatabaseRefreshCollStmt}},
        220 => {:partition_elem, {:oneof, :node}, {:message, PgQuery.PartitionElem}},
        178 => {:a_array_expr, {:oneof, :node}, {:message, PgQuery.A_ArrayExpr}},
        155 => {:refresh_mat_view_stmt, {:oneof, :node}, {:message, PgQuery.RefreshMatViewStmt}},
        87 => {:view_stmt, {:oneof, :node}, {:message, PgQuery.ViewStmt}},
        204 => {:access_priv, {:oneof, :node}, {:message, PgQuery.AccessPriv}},
        217 => {:merge_when_clause, {:oneof, :node}, {:message, PgQuery.MergeWhenClause}},
        190 => {:type_name, {:oneof, :node}, {:message, PgQuery.TypeName}},
        21 => {:field_store, {:oneof, :node}, {:message, PgQuery.FieldStore}},
        96 => {:alter_seq_stmt, {:oneof, :node}, {:message, PgQuery.AlterSeqStmt}},
        200 => {:sort_group_clause, {:oneof, :node}, {:message, PgQuery.SortGroupClause}},
        4 => {:var, {:oneof, :node}, {:message, PgQuery.Var}},
        128 => {:alter_operator_stmt, {:oneof, :node}, {:message, PgQuery.AlterOperatorStmt}},
        159 => {:alter_policy_stmt, {:oneof, :node}, {:message, PgQuery.AlterPolicyStmt}},
        169 => {:call_stmt, {:oneof, :node}, {:message, PgQuery.CallStmt}},
        119 => {:prepare_stmt, {:oneof, :node}, {:message, PgQuery.PrepareStmt}},
        148 =>
          {:create_foreign_table_stmt, {:oneof, :node},
           {:message, PgQuery.CreateForeignTableStmt}},
        82 => {:rule_stmt, {:oneof, :node}, {:message, PgQuery.RuleStmt}},
        36 => {:xml_expr, {:oneof, :node}, {:message, PgQuery.XmlExpr}},
        177 => {:a_indirection, {:oneof, :node}, {:message, PgQuery.A_Indirection}},
        138 => {:create_fdw_stmt, {:oneof, :node}, {:message, PgQuery.CreateFdwStmt}},
        53 => {:query, {:oneof, :node}, {:message, PgQuery.Query}},
        50 => {:into_clause, {:oneof, :node}, {:message, PgQuery.IntoClause}},
        66 => {:grant_role_stmt, {:oneof, :node}, {:message, PgQuery.GrantRoleStmt}},
        24 => {:array_coerce_expr, {:oneof, :node}, {:message, PgQuery.ArrayCoerceExpr}},
        10 => {:func_expr, {:oneof, :node}, {:message, PgQuery.FuncExpr}},
        150 => {:create_extension_stmt, {:oneof, :node}, {:message, PgQuery.CreateExtensionStmt}},
        35 => {:sqlvalue_function, {:oneof, :node}, {:message, PgQuery.SQLValueFunction}},
        70 => {:copy_stmt, {:oneof, :node}, {:message, PgQuery.CopyStmt}},
        56 => {:update_stmt, {:oneof, :node}, {:message, PgQuery.UpdateStmt}},
        161 => {:create_am_stmt, {:oneof, :node}, {:message, PgQuery.CreateAmStmt}},
        179 => {:res_target, {:oneof, :node}, {:message, PgQuery.ResTarget}},
        102 => {:create_role_stmt, {:oneof, :node}, {:message, PgQuery.CreateRoleStmt}},
        142 =>
          {:create_user_mapping_stmt, {:oneof, :node}, {:message, PgQuery.CreateUserMappingStmt}},
        62 => {:alter_table_cmd, {:oneof, :node}, {:message, PgQuery.AlterTableCmd}},
        105 => {:lock_stmt, {:oneof, :node}, {:message, PgQuery.LockStmt}},
        127 => {:alter_owner_stmt, {:oneof, :node}, {:message, PgQuery.AlterOwnerStmt}},
        121 => {:deallocate_stmt, {:oneof, :node}, {:message, PgQuery.DeallocateStmt}},
        49 => {:on_conflict_expr, {:oneof, :node}, {:message, PgQuery.OnConflictExpr}},
        125 =>
          {:alter_object_depends_stmt, {:oneof, :node},
           {:message, PgQuery.AlterObjectDependsStmt}},
        160 => {:create_transform_stmt, {:oneof, :node}, {:message, PgQuery.CreateTransformStmt}},
        27 => {:case_expr, {:oneof, :node}, {:message, PgQuery.CaseExpr}},
        84 => {:listen_stmt, {:oneof, :node}, {:message, PgQuery.ListenStmt}},
        94 => {:create_table_as_stmt, {:oneof, :node}, {:message, PgQuery.CreateTableAsStmt}},
        201 => {:grouping_set, {:oneof, :node}, {:message, PgQuery.GroupingSet}},
        208 => {:locking_clause, {:oneof, :node}, {:message, PgQuery.LockingClause}},
        185 => {:range_subselect, {:oneof, :node}, {:message, PgQuery.RangeSubselect}},
        92 => {:vacuum_stmt, {:oneof, :node}, {:message, PgQuery.VacuumStmt}},
        42 => {:current_of_expr, {:oneof, :node}, {:message, PgQuery.CurrentOfExpr}},
        19 => {:alternative_sub_plan, {:oneof, :node}, {:message, PgQuery.AlternativeSubPlan}},
        67 =>
          {:alter_default_privileges_stmt, {:oneof, :node},
           {:message, PgQuery.AlterDefaultPrivilegesStmt}},
        93 => {:explain_stmt, {:oneof, :node}, {:message, PgQuery.ExplainStmt}},
        234 => {:bit_string, {:oneof, :node}, {:message, PgQuery.BitString}},
        106 => {:constraints_set_stmt, {:oneof, :node}, {:message, PgQuery.ConstraintsSetStmt}},
        65 => {:grant_stmt, {:oneof, :node}, {:message, PgQuery.GrantStmt}},
        101 => {:create_plang_stmt, {:oneof, :node}, {:message, PgQuery.CreatePLangStmt}},
        182 => {:collate_clause, {:oneof, :node}, {:message, PgQuery.CollateClause}},
        156 => {:replica_identity_stmt, {:oneof, :node}, {:message, PgQuery.ReplicaIdentityStmt}},
        231 => {:float, {:oneof, :node}, {:message, PgQuery.Float}},
        202 => {:window_clause, {:oneof, :node}, {:message, PgQuery.WindowClause}},
        129 => {:alter_type_stmt, {:oneof, :node}, {:message, PgQuery.AlterTypeStmt}},
        114 =>
          {:create_conversion_stmt, {:oneof, :node}, {:message, PgQuery.CreateConversionStmt}},
        118 => {:alter_op_family_stmt, {:oneof, :node}, {:message, PgQuery.AlterOpFamilyStmt}},
        5 => {:param, {:oneof, :node}, {:message, PgQuery.Param}},
        54 => {:insert_stmt, {:oneof, :node}, {:message, PgQuery.InsertStmt}},
        18 => {:sub_plan, {:oneof, :node}, {:message, PgQuery.SubPlan}},
        210 => {:xml_serialize, {:oneof, :node}, {:message, PgQuery.XmlSerialize}},
        205 => {:create_op_class_item, {:oneof, :node}, {:message, PgQuery.CreateOpClassItem}},
        79 => {:alter_function_stmt, {:oneof, :node}, {:message, PgQuery.AlterFunctionStmt}},
        136 =>
          {:alter_tsdictionary_stmt, {:oneof, :node}, {:message, PgQuery.AlterTSDictionaryStmt}},
        172 => {:column_ref, {:oneof, :node}, {:message, PgQuery.ColumnRef}},
        227 => {:publication_table, {:oneof, :node}, {:message, PgQuery.PublicationTable}},
        115 => {:create_cast_stmt, {:oneof, :node}, {:message, PgQuery.CreateCastStmt}},
        107 => {:reindex_stmt, {:oneof, :node}, {:message, PgQuery.ReindexStmt}},
        164 =>
          {:create_subscription_stmt, {:oneof, :node}, {:message, PgQuery.CreateSubscriptionStmt}},
        226 => {:publication_obj_spec, {:oneof, :node}, {:message, PgQuery.PublicationObjSpec}},
        16 => {:bool_expr, {:oneof, :node}, {:message, PgQuery.BoolExpr}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        vacuum_stmt: {92, {:oneof, :node}, {:message, PgQuery.VacuumStmt}},
        alternative_sub_plan: {19, {:oneof, :node}, {:message, PgQuery.AlternativeSubPlan}},
        create_domain_stmt: {89, {:oneof, :node}, {:message, PgQuery.CreateDomainStmt}},
        float: {231, {:oneof, :node}, {:message, PgQuery.Float}},
        grant_role_stmt: {66, {:oneof, :node}, {:message, PgQuery.GrantRoleStmt}},
        func_expr: {10, {:oneof, :node}, {:message, PgQuery.FuncExpr}},
        with_check_option: {199, {:oneof, :node}, {:message, PgQuery.WithCheckOption}},
        xml_serialize: {210, {:oneof, :node}, {:message, PgQuery.XmlSerialize}},
        case_when: {28, {:oneof, :node}, {:message, PgQuery.CaseWhen}},
        inline_code_block: {228, {:oneof, :node}, {:message, PgQuery.InlineCodeBlock}},
        create_stmt: {71, {:oneof, :node}, {:message, PgQuery.CreateStmt}},
        alter_op_family_stmt: {118, {:oneof, :node}, {:message, PgQuery.AlterOpFamilyStmt}},
        create_range_stmt: {134, {:oneof, :node}, {:message, PgQuery.CreateRangeStmt}},
        create_seq_stmt: {95, {:oneof, :node}, {:message, PgQuery.CreateSeqStmt}},
        range_table_func_col: {189, {:oneof, :node}, {:message, PgQuery.RangeTableFuncCol}},
        locking_clause: {208, {:oneof, :node}, {:message, PgQuery.LockingClause}},
        convert_rowtype_expr: {25, {:oneof, :node}, {:message, PgQuery.ConvertRowtypeExpr}},
        createdb_stmt: {90, {:oneof, :node}, {:message, PgQuery.CreatedbStmt}},
        create_foreign_server_stmt:
          {140, {:oneof, :node}, {:message, PgQuery.CreateForeignServerStmt}},
        constraint: {194, {:oneof, :node}, {:message, PgQuery.Constraint}},
        rule_stmt: {82, {:oneof, :node}, {:message, PgQuery.RuleStmt}},
        var: {4, {:oneof, :node}, {:message, PgQuery.Var}},
        create_op_family_stmt: {117, {:oneof, :node}, {:message, PgQuery.CreateOpFamilyStmt}},
        create_publication_stmt:
          {162, {:oneof, :node}, {:message, PgQuery.CreatePublicationStmt}},
        prepare_stmt: {119, {:oneof, :node}, {:message, PgQuery.PrepareStmt}},
        alter_database_refresh_coll_stmt:
          {111, {:oneof, :node}, {:message, PgQuery.AlterDatabaseRefreshCollStmt}},
        alter_user_mapping_stmt: {143, {:oneof, :node}, {:message, PgQuery.AlterUserMappingStmt}},
        case_expr: {27, {:oneof, :node}, {:message, PgQuery.CaseExpr}},
        merge_stmt: {57, {:oneof, :node}, {:message, PgQuery.MergeStmt}},
        create_foreign_table_stmt:
          {148, {:oneof, :node}, {:message, PgQuery.CreateForeignTableStmt}},
        alter_table_space_options_stmt:
          {145, {:oneof, :node}, {:message, PgQuery.AlterTableSpaceOptionsStmt}},
        integer: {230, {:oneof, :node}, {:message, PgQuery.Integer}},
        alter_function_stmt: {79, {:oneof, :node}, {:message, PgQuery.AlterFunctionStmt}},
        drop_role_stmt: {104, {:oneof, :node}, {:message, PgQuery.DropRoleStmt}},
        alter_object_depends_stmt:
          {125, {:oneof, :node}, {:message, PgQuery.AlterObjectDependsStmt}},
        field_select: {20, {:oneof, :node}, {:message, PgQuery.FieldSelect}},
        view_stmt: {87, {:oneof, :node}, {:message, PgQuery.ViewStmt}},
        sort_by: {183, {:oneof, :node}, {:message, PgQuery.SortBy}},
        create_function_stmt: {78, {:oneof, :node}, {:message, PgQuery.CreateFunctionStmt}},
        publication_table: {227, {:oneof, :node}, {:message, PgQuery.PublicationTable}},
        stats_elem: {193, {:oneof, :node}, {:message, PgQuery.StatsElem}},
        alter_collation_stmt: {168, {:oneof, :node}, {:message, PgQuery.AlterCollationStmt}},
        coalesce_expr: {33, {:oneof, :node}, {:message, PgQuery.CoalesceExpr}},
        infer_clause: {212, {:oneof, :node}, {:message, PgQuery.InferClause}},
        array_coerce_expr: {24, {:oneof, :node}, {:message, PgQuery.ArrayCoerceExpr}},
        coerce_to_domain: {39, {:oneof, :node}, {:message, PgQuery.CoerceToDomain}},
        table_like_clause: {206, {:oneof, :node}, {:message, PgQuery.TableLikeClause}},
        create_event_trig_stmt: {153, {:oneof, :node}, {:message, PgQuery.CreateEventTrigStmt}},
        distinct_expr: {13, {:oneof, :node}, {:message, PgQuery.DistinctExpr}},
        on_conflict_expr: {49, {:oneof, :node}, {:message, PgQuery.OnConflictExpr}},
        create_trig_stmt: {100, {:oneof, :node}, {:message, PgQuery.CreateTrigStmt}},
        alter_default_privileges_stmt:
          {67, {:oneof, :node}, {:message, PgQuery.AlterDefaultPrivilegesStmt}},
        variable_show_stmt: {98, {:oneof, :node}, {:message, PgQuery.VariableShowStmt}},
        create_schema_stmt: {109, {:oneof, :node}, {:message, PgQuery.CreateSchemaStmt}},
        range_function: {186, {:oneof, :node}, {:message, PgQuery.RangeFunction}},
        execute_stmt: {120, {:oneof, :node}, {:message, PgQuery.ExecuteStmt}},
        select_stmt: {58, {:oneof, :node}, {:message, PgQuery.SelectStmt}},
        collate_clause: {182, {:oneof, :node}, {:message, PgQuery.CollateClause}},
        insert_stmt: {54, {:oneof, :node}, {:message, PgQuery.InsertStmt}},
        type_cast: {181, {:oneof, :node}, {:message, PgQuery.TypeCast}},
        alter_object_schema_stmt:
          {126, {:oneof, :node}, {:message, PgQuery.AlterObjectSchemaStmt}},
        access_priv: {204, {:oneof, :node}, {:message, PgQuery.AccessPriv}},
        def_elem: {195, {:oneof, :node}, {:message, PgQuery.DefElem}},
        create_table_space_stmt: {123, {:oneof, :node}, {:message, PgQuery.CreateTableSpaceStmt}},
        int_list: {236, {:oneof, :node}, {:message, PgQuery.IntList}},
        alter_seq_stmt: {96, {:oneof, :node}, {:message, PgQuery.AlterSeqStmt}},
        import_foreign_schema_stmt:
          {149, {:oneof, :node}, {:message, PgQuery.ImportForeignSchemaStmt}},
        multi_assign_ref: {180, {:oneof, :node}, {:message, PgQuery.MultiAssignRef}},
        ctesearch_clause: {214, {:oneof, :node}, {:message, PgQuery.CTESearchClause}},
        ctecycle_clause: {215, {:oneof, :node}, {:message, PgQuery.CTECycleClause}},
        alter_operator_stmt: {128, {:oneof, :node}, {:message, PgQuery.AlterOperatorStmt}},
        alter_stats_stmt: {170, {:oneof, :node}, {:message, PgQuery.AlterStatsStmt}},
        common_table_expr: {216, {:oneof, :node}, {:message, PgQuery.CommonTableExpr}},
        rename_stmt: {81, {:oneof, :node}, {:message, PgQuery.RenameStmt}},
        coerce_via_io: {23, {:oneof, :node}, {:message, PgQuery.CoerceViaIO}},
        alias: {1, {:oneof, :node}, {:message, PgQuery.Alias}},
        replica_identity_stmt: {156, {:oneof, :node}, {:message, PgQuery.ReplicaIdentityStmt}},
        null_test: {37, {:oneof, :node}, {:message, PgQuery.NullTest}},
        with_clause: {211, {:oneof, :node}, {:message, PgQuery.WithClause}},
        plassign_stmt: {60, {:oneof, :node}, {:message, PgQuery.PLAssignStmt}},
        notify_stmt: {83, {:oneof, :node}, {:message, PgQuery.NotifyStmt}},
        drop_owned_stmt: {130, {:oneof, :node}, {:message, PgQuery.DropOwnedStmt}},
        merge_action: {51, {:oneof, :node}, {:message, PgQuery.MergeAction}},
        partition_range_datum: {223, {:oneof, :node}, {:message, PgQuery.PartitionRangeDatum}},
        a_array_expr: {178, {:oneof, :node}, {:message, PgQuery.A_ArrayExpr}},
        drop_table_space_stmt: {124, {:oneof, :node}, {:message, PgQuery.DropTableSpaceStmt}},
        check_point_stmt: {108, {:oneof, :node}, {:message, PgQuery.CheckPointStmt}},
        func_call: {174, {:oneof, :node}, {:message, PgQuery.FuncCall}},
        list: {235, {:oneof, :node}, {:message, PgQuery.List}},
        update_stmt: {56, {:oneof, :node}, {:message, PgQuery.UpdateStmt}},
        drop_user_mapping_stmt: {144, {:oneof, :node}, {:message, PgQuery.DropUserMappingStmt}},
        alter_owner_stmt: {127, {:oneof, :node}, {:message, PgQuery.AlterOwnerStmt}},
        drop_subscription_stmt: {166, {:oneof, :node}, {:message, PgQuery.DropSubscriptionStmt}},
        do_stmt: {80, {:oneof, :node}, {:message, PgQuery.DoStmt}},
        truncate_stmt: {74, {:oneof, :node}, {:message, PgQuery.TruncateStmt}},
        create_extension_stmt: {150, {:oneof, :node}, {:message, PgQuery.CreateExtensionStmt}},
        create_policy_stmt: {158, {:oneof, :node}, {:message, PgQuery.CreatePolicyStmt}},
        subscripting_ref: {9, {:oneof, :node}, {:message, PgQuery.SubscriptingRef}},
        deallocate_stmt: {121, {:oneof, :node}, {:message, PgQuery.DeallocateStmt}},
        alter_database_stmt: {110, {:oneof, :node}, {:message, PgQuery.AlterDatabaseStmt}},
        bool_expr: {16, {:oneof, :node}, {:message, PgQuery.BoolExpr}},
        alter_foreign_server_stmt:
          {141, {:oneof, :node}, {:message, PgQuery.AlterForeignServerStmt}},
        case_test_expr: {29, {:oneof, :node}, {:message, PgQuery.CaseTestExpr}},
        array_expr: {30, {:oneof, :node}, {:message, PgQuery.ArrayExpr}},
        alter_fdw_stmt: {139, {:oneof, :node}, {:message, PgQuery.AlterFdwStmt}},
        named_arg_expr: {11, {:oneof, :node}, {:message, PgQuery.NamedArgExpr}},
        a_const: {238, {:oneof, :node}, {:message, PgQuery.A_Const}},
        sub_link: {17, {:oneof, :node}, {:message, PgQuery.SubLink}},
        a_star: {175, {:oneof, :node}, {:message, PgQuery.A_Star}},
        return_stmt: {59, {:oneof, :node}, {:message, PgQuery.ReturnStmt}},
        table_sample_clause: {198, {:oneof, :node}, {:message, PgQuery.TableSampleClause}},
        res_target: {179, {:oneof, :node}, {:message, PgQuery.ResTarget}},
        cluster_stmt: {69, {:oneof, :node}, {:message, PgQuery.ClusterStmt}},
        set_operation_stmt: {64, {:oneof, :node}, {:message, PgQuery.SetOperationStmt}},
        copy_stmt: {70, {:oneof, :node}, {:message, PgQuery.CopyStmt}},
        type_name: {190, {:oneof, :node}, {:message, PgQuery.TypeName}},
        boolean: {232, {:oneof, :node}, {:message, PgQuery.Boolean}},
        alter_policy_stmt: {159, {:oneof, :node}, {:message, PgQuery.AlterPolicyStmt}},
        range_table_sample: {187, {:oneof, :node}, {:message, PgQuery.RangeTableSample}},
        set_to_default: {41, {:oneof, :node}, {:message, PgQuery.SetToDefault}},
        sort_group_clause: {200, {:oneof, :node}, {:message, PgQuery.SortGroupClause}},
        alter_system_stmt: {157, {:oneof, :node}, {:message, PgQuery.AlterSystemStmt}},
        range_tbl_entry: {196, {:oneof, :node}, {:message, PgQuery.RangeTblEntry}},
        a_expr: {171, {:oneof, :node}, {:message, PgQuery.A_Expr}},
        alter_type_stmt: {129, {:oneof, :node}, {:message, PgQuery.AlterTypeStmt}},
        from_expr: {48, {:oneof, :node}, {:message, PgQuery.FromExpr}},
        create_user_mapping_stmt:
          {142, {:oneof, :node}, {:message, PgQuery.CreateUserMappingStmt}},
        listen_stmt: {84, {:oneof, :node}, {:message, PgQuery.ListenStmt}},
        call_stmt: {169, {:oneof, :node}, {:message, PgQuery.CallStmt}},
        param: {5, {:oneof, :node}, {:message, PgQuery.Param}},
        alter_subscription_stmt:
          {165, {:oneof, :node}, {:message, PgQuery.AlterSubscriptionStmt}},
        row_compare_expr: {32, {:oneof, :node}, {:message, PgQuery.RowCompareExpr}},
        query: {53, {:oneof, :node}, {:message, PgQuery.Query}},
        partition_cmd: {224, {:oneof, :node}, {:message, PgQuery.PartitionCmd}},
        create_cast_stmt: {115, {:oneof, :node}, {:message, PgQuery.CreateCastStmt}},
        create_plang_stmt: {101, {:oneof, :node}, {:message, PgQuery.CreatePLangStmt}},
        comment_stmt: {75, {:oneof, :node}, {:message, PgQuery.CommentStmt}},
        declare_cursor_stmt: {122, {:oneof, :node}, {:message, PgQuery.DeclareCursorStmt}},
        function_parameter: {207, {:oneof, :node}, {:message, PgQuery.FunctionParameter}},
        a_indirection: {177, {:oneof, :node}, {:message, PgQuery.A_Indirection}},
        column_ref: {172, {:oneof, :node}, {:message, PgQuery.ColumnRef}},
        alter_role_set_stmt: {113, {:oneof, :node}, {:message, PgQuery.AlterRoleSetStmt}},
        role_spec: {218, {:oneof, :node}, {:message, PgQuery.RoleSpec}},
        create_table_as_stmt: {94, {:oneof, :node}, {:message, PgQuery.CreateTableAsStmt}},
        create_conversion_stmt: {114, {:oneof, :node}, {:message, PgQuery.CreateConversionStmt}},
        create_subscription_stmt:
          {164, {:oneof, :node}, {:message, PgQuery.CreateSubscriptionStmt}},
        alter_domain_stmt: {63, {:oneof, :node}, {:message, PgQuery.AlterDomainStmt}},
        grant_stmt: {65, {:oneof, :node}, {:message, PgQuery.GrantStmt}},
        on_conflict_clause: {213, {:oneof, :node}, {:message, PgQuery.OnConflictClause}},
        relabel_type: {22, {:oneof, :node}, {:message, PgQuery.RelabelType}},
        create_role_stmt: {102, {:oneof, :node}, {:message, PgQuery.CreateRoleStmt}},
        define_stmt: {72, {:oneof, :node}, {:message, PgQuery.DefineStmt}},
        grouping_func: {7, {:oneof, :node}, {:message, PgQuery.GroupingFunc}},
        transaction_stmt: {86, {:oneof, :node}, {:message, PgQuery.TransactionStmt}},
        fetch_stmt: {76, {:oneof, :node}, {:message, PgQuery.FetchStmt}},
        vacuum_relation: {225, {:oneof, :node}, {:message, PgQuery.VacuumRelation}},
        op_expr: {12, {:oneof, :node}, {:message, PgQuery.OpExpr}},
        alter_tsconfiguration_stmt:
          {137, {:oneof, :node}, {:message, PgQuery.AlterTSConfigurationStmt}},
        current_of_expr: {42, {:oneof, :node}, {:message, PgQuery.CurrentOfExpr}},
        load_stmt: {88, {:oneof, :node}, {:message, PgQuery.LoadStmt}},
        column_def: {191, {:oneof, :node}, {:message, PgQuery.ColumnDef}},
        range_var: {2, {:oneof, :node}, {:message, PgQuery.RangeVar}},
        close_portal_stmt: {68, {:oneof, :node}, {:message, PgQuery.ClosePortalStmt}},
        alter_table_move_all_stmt:
          {146, {:oneof, :node}, {:message, PgQuery.AlterTableMoveAllStmt}},
        index_elem: {192, {:oneof, :node}, {:message, PgQuery.IndexElem}},
        range_tbl_function: {197, {:oneof, :node}, {:message, PgQuery.RangeTblFunction}},
        grouping_set: {201, {:oneof, :node}, {:message, PgQuery.GroupingSet}},
        row_mark_clause: {209, {:oneof, :node}, {:message, PgQuery.RowMarkClause}},
        null_if_expr: {14, {:oneof, :node}, {:message, PgQuery.NullIfExpr}},
        raw_stmt: {52, {:oneof, :node}, {:message, PgQuery.RawStmt}},
        create_fdw_stmt: {138, {:oneof, :node}, {:message, PgQuery.CreateFdwStmt}},
        call_context: {229, {:oneof, :node}, {:message, PgQuery.CallContext}},
        alter_enum_stmt: {135, {:oneof, :node}, {:message, PgQuery.AlterEnumStmt}},
        alter_extension_contents_stmt:
          {152, {:oneof, :node}, {:message, PgQuery.AlterExtensionContentsStmt}},
        alter_publication_stmt: {163, {:oneof, :node}, {:message, PgQuery.AlterPublicationStmt}},
        field_store: {21, {:oneof, :node}, {:message, PgQuery.FieldStore}},
        alter_tsdictionary_stmt:
          {136, {:oneof, :node}, {:message, PgQuery.AlterTSDictionaryStmt}},
        window_func: {8, {:oneof, :node}, {:message, PgQuery.WindowFunc}},
        alter_database_set_stmt: {112, {:oneof, :node}, {:message, PgQuery.AlterDatabaseSetStmt}},
        create_op_class_item: {205, {:oneof, :node}, {:message, PgQuery.CreateOpClassItem}},
        reindex_stmt: {107, {:oneof, :node}, {:message, PgQuery.ReindexStmt}},
        constraints_set_stmt: {106, {:oneof, :node}, {:message, PgQuery.ConstraintsSetStmt}},
        sqlvalue_function: {35, {:oneof, :node}, {:message, PgQuery.SQLValueFunction}},
        object_with_args: {203, {:oneof, :node}, {:message, PgQuery.ObjectWithArgs}},
        merge_when_clause: {217, {:oneof, :node}, {:message, PgQuery.MergeWhenClause}},
        scalar_array_op_expr: {15, {:oneof, :node}, {:message, PgQuery.ScalarArrayOpExpr}},
        row_expr: {31, {:oneof, :node}, {:message, PgQuery.RowExpr}},
        variable_set_stmt: {97, {:oneof, :node}, {:message, PgQuery.VariableSetStmt}},
        trigger_transition: {219, {:oneof, :node}, {:message, PgQuery.TriggerTransition}},
        explain_stmt: {93, {:oneof, :node}, {:message, PgQuery.ExplainStmt}},
        create_transform_stmt: {160, {:oneof, :node}, {:message, PgQuery.CreateTransformStmt}},
        delete_stmt: {55, {:oneof, :node}, {:message, PgQuery.DeleteStmt}},
        window_clause: {202, {:oneof, :node}, {:message, PgQuery.WindowClause}},
        next_value_expr: {43, {:oneof, :node}, {:message, PgQuery.NextValueExpr}},
        oid_list: {237, {:oneof, :node}, {:message, PgQuery.OidList}},
        range_tbl_ref: {46, {:oneof, :node}, {:message, PgQuery.RangeTblRef}},
        collate_expr: {26, {:oneof, :node}, {:message, PgQuery.CollateExpr}},
        reassign_owned_stmt: {131, {:oneof, :node}, {:message, PgQuery.ReassignOwnedStmt}},
        partition_spec: {221, {:oneof, :node}, {:message, PgQuery.PartitionSpec}},
        alter_role_stmt: {103, {:oneof, :node}, {:message, PgQuery.AlterRoleStmt}},
        publication_obj_spec: {226, {:oneof, :node}, {:message, PgQuery.PublicationObjSpec}},
        param_ref: {173, {:oneof, :node}, {:message, PgQuery.ParamRef}},
        lock_stmt: {105, {:oneof, :node}, {:message, PgQuery.LockStmt}},
        join_expr: {47, {:oneof, :node}, {:message, PgQuery.JoinExpr}},
        create_op_class_stmt: {116, {:oneof, :node}, {:message, PgQuery.CreateOpClassStmt}},
        alter_event_trig_stmt: {154, {:oneof, :node}, {:message, PgQuery.AlterEventTrigStmt}},
        composite_type_stmt: {132, {:oneof, :node}, {:message, PgQuery.CompositeTypeStmt}},
        min_max_expr: {34, {:oneof, :node}, {:message, PgQuery.MinMaxExpr}},
        sec_label_stmt: {147, {:oneof, :node}, {:message, PgQuery.SecLabelStmt}},
        create_am_stmt: {161, {:oneof, :node}, {:message, PgQuery.CreateAmStmt}},
        create_stats_stmt: {167, {:oneof, :node}, {:message, PgQuery.CreateStatsStmt}},
        unlisten_stmt: {85, {:oneof, :node}, {:message, PgQuery.UnlistenStmt}},
        sub_plan: {18, {:oneof, :node}, {:message, PgQuery.SubPlan}},
        boolean_test: {38, {:oneof, :node}, {:message, PgQuery.BooleanTest}},
        coerce_to_domain_value: {40, {:oneof, :node}, {:message, PgQuery.CoerceToDomainValue}},
        discard_stmt: {99, {:oneof, :node}, {:message, PgQuery.DiscardStmt}},
        string: {233, {:oneof, :node}, {:message, PgQuery.String}},
        partition_elem: {220, {:oneof, :node}, {:message, PgQuery.PartitionElem}},
        bit_string: {234, {:oneof, :node}, {:message, PgQuery.BitString}},
        range_table_func: {188, {:oneof, :node}, {:message, PgQuery.RangeTableFunc}},
        aggref: {6, {:oneof, :node}, {:message, PgQuery.Aggref}},
        table_func: {3, {:oneof, :node}, {:message, PgQuery.TableFunc}},
        alter_table_stmt: {61, {:oneof, :node}, {:message, PgQuery.AlterTableStmt}},
        dropdb_stmt: {91, {:oneof, :node}, {:message, PgQuery.DropdbStmt}},
        alter_table_cmd: {62, {:oneof, :node}, {:message, PgQuery.AlterTableCmd}},
        create_enum_stmt: {133, {:oneof, :node}, {:message, PgQuery.CreateEnumStmt}},
        range_subselect: {185, {:oneof, :node}, {:message, PgQuery.RangeSubselect}},
        inference_elem: {44, {:oneof, :node}, {:message, PgQuery.InferenceElem}},
        target_entry: {45, {:oneof, :node}, {:message, PgQuery.TargetEntry}},
        into_clause: {50, {:oneof, :node}, {:message, PgQuery.IntoClause}},
        window_def: {184, {:oneof, :node}, {:message, PgQuery.WindowDef}},
        a_indices: {176, {:oneof, :node}, {:message, PgQuery.A_Indices}},
        refresh_mat_view_stmt: {155, {:oneof, :node}, {:message, PgQuery.RefreshMatViewStmt}},
        alter_extension_stmt: {151, {:oneof, :node}, {:message, PgQuery.AlterExtensionStmt}},
        drop_stmt: {73, {:oneof, :node}, {:message, PgQuery.DropStmt}},
        partition_bound_spec: {222, {:oneof, :node}, {:message, PgQuery.PartitionBoundSpec}},
        xml_expr: {36, {:oneof, :node}, {:message, PgQuery.XmlExpr}},
        index_stmt: {77, {:oneof, :node}, {:message, PgQuery.IndexStmt}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "alias",
          kind: {:oneof, :node},
          label: :optional,
          name: :alias,
          tag: 1,
          type: {:message, PgQuery.Alias}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rangeVar",
          kind: {:oneof, :node},
          label: :optional,
          name: :range_var,
          tag: 2,
          type: {:message, PgQuery.RangeVar}
        },
        %{
          __struct__: Protox.Field,
          json_name: "tableFunc",
          kind: {:oneof, :node},
          label: :optional,
          name: :table_func,
          tag: 3,
          type: {:message, PgQuery.TableFunc}
        },
        %{
          __struct__: Protox.Field,
          json_name: "var",
          kind: {:oneof, :node},
          label: :optional,
          name: :var,
          tag: 4,
          type: {:message, PgQuery.Var}
        },
        %{
          __struct__: Protox.Field,
          json_name: "param",
          kind: {:oneof, :node},
          label: :optional,
          name: :param,
          tag: 5,
          type: {:message, PgQuery.Param}
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggref",
          kind: {:oneof, :node},
          label: :optional,
          name: :aggref,
          tag: 6,
          type: {:message, PgQuery.Aggref}
        },
        %{
          __struct__: Protox.Field,
          json_name: "groupingFunc",
          kind: {:oneof, :node},
          label: :optional,
          name: :grouping_func,
          tag: 7,
          type: {:message, PgQuery.GroupingFunc}
        },
        %{
          __struct__: Protox.Field,
          json_name: "windowFunc",
          kind: {:oneof, :node},
          label: :optional,
          name: :window_func,
          tag: 8,
          type: {:message, PgQuery.WindowFunc}
        },
        %{
          __struct__: Protox.Field,
          json_name: "subscriptingRef",
          kind: {:oneof, :node},
          label: :optional,
          name: :subscripting_ref,
          tag: 9,
          type: {:message, PgQuery.SubscriptingRef}
        },
        %{
          __struct__: Protox.Field,
          json_name: "funcExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :func_expr,
          tag: 10,
          type: {:message, PgQuery.FuncExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "namedArgExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :named_arg_expr,
          tag: 11,
          type: {:message, PgQuery.NamedArgExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "opExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :op_expr,
          tag: 12,
          type: {:message, PgQuery.OpExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "distinctExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :distinct_expr,
          tag: 13,
          type: {:message, PgQuery.DistinctExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "nullIfExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :null_if_expr,
          tag: 14,
          type: {:message, PgQuery.NullIfExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "scalarArrayOpExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :scalar_array_op_expr,
          tag: 15,
          type: {:message, PgQuery.ScalarArrayOpExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "boolExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :bool_expr,
          tag: 16,
          type: {:message, PgQuery.BoolExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "subLink",
          kind: {:oneof, :node},
          label: :optional,
          name: :sub_link,
          tag: 17,
          type: {:message, PgQuery.SubLink}
        },
        %{
          __struct__: Protox.Field,
          json_name: "subPlan",
          kind: {:oneof, :node},
          label: :optional,
          name: :sub_plan,
          tag: 18,
          type: {:message, PgQuery.SubPlan}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alternativeSubPlan",
          kind: {:oneof, :node},
          label: :optional,
          name: :alternative_sub_plan,
          tag: 19,
          type: {:message, PgQuery.AlternativeSubPlan}
        },
        %{
          __struct__: Protox.Field,
          json_name: "fieldSelect",
          kind: {:oneof, :node},
          label: :optional,
          name: :field_select,
          tag: 20,
          type: {:message, PgQuery.FieldSelect}
        },
        %{
          __struct__: Protox.Field,
          json_name: "fieldStore",
          kind: {:oneof, :node},
          label: :optional,
          name: :field_store,
          tag: 21,
          type: {:message, PgQuery.FieldStore}
        },
        %{
          __struct__: Protox.Field,
          json_name: "relabelType",
          kind: {:oneof, :node},
          label: :optional,
          name: :relabel_type,
          tag: 22,
          type: {:message, PgQuery.RelabelType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "coerceViaIo",
          kind: {:oneof, :node},
          label: :optional,
          name: :coerce_via_io,
          tag: 23,
          type: {:message, PgQuery.CoerceViaIO}
        },
        %{
          __struct__: Protox.Field,
          json_name: "arrayCoerceExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :array_coerce_expr,
          tag: 24,
          type: {:message, PgQuery.ArrayCoerceExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "convertRowtypeExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :convert_rowtype_expr,
          tag: 25,
          type: {:message, PgQuery.ConvertRowtypeExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "collateExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :collate_expr,
          tag: 26,
          type: {:message, PgQuery.CollateExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "caseExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :case_expr,
          tag: 27,
          type: {:message, PgQuery.CaseExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "caseWhen",
          kind: {:oneof, :node},
          label: :optional,
          name: :case_when,
          tag: 28,
          type: {:message, PgQuery.CaseWhen}
        },
        %{
          __struct__: Protox.Field,
          json_name: "caseTestExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :case_test_expr,
          tag: 29,
          type: {:message, PgQuery.CaseTestExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "arrayExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :array_expr,
          tag: 30,
          type: {:message, PgQuery.ArrayExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rowExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :row_expr,
          tag: 31,
          type: {:message, PgQuery.RowExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rowCompareExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :row_compare_expr,
          tag: 32,
          type: {:message, PgQuery.RowCompareExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "coalesceExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :coalesce_expr,
          tag: 33,
          type: {:message, PgQuery.CoalesceExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "minMaxExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :min_max_expr,
          tag: 34,
          type: {:message, PgQuery.MinMaxExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "sqlvalueFunction",
          kind: {:oneof, :node},
          label: :optional,
          name: :sqlvalue_function,
          tag: 35,
          type: {:message, PgQuery.SQLValueFunction}
        },
        %{
          __struct__: Protox.Field,
          json_name: "xmlExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :xml_expr,
          tag: 36,
          type: {:message, PgQuery.XmlExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "nullTest",
          kind: {:oneof, :node},
          label: :optional,
          name: :null_test,
          tag: 37,
          type: {:message, PgQuery.NullTest}
        },
        %{
          __struct__: Protox.Field,
          json_name: "booleanTest",
          kind: {:oneof, :node},
          label: :optional,
          name: :boolean_test,
          tag: 38,
          type: {:message, PgQuery.BooleanTest}
        },
        %{
          __struct__: Protox.Field,
          json_name: "coerceToDomain",
          kind: {:oneof, :node},
          label: :optional,
          name: :coerce_to_domain,
          tag: 39,
          type: {:message, PgQuery.CoerceToDomain}
        },
        %{
          __struct__: Protox.Field,
          json_name: "coerceToDomainValue",
          kind: {:oneof, :node},
          label: :optional,
          name: :coerce_to_domain_value,
          tag: 40,
          type: {:message, PgQuery.CoerceToDomainValue}
        },
        %{
          __struct__: Protox.Field,
          json_name: "setToDefault",
          kind: {:oneof, :node},
          label: :optional,
          name: :set_to_default,
          tag: 41,
          type: {:message, PgQuery.SetToDefault}
        },
        %{
          __struct__: Protox.Field,
          json_name: "currentOfExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :current_of_expr,
          tag: 42,
          type: {:message, PgQuery.CurrentOfExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "nextValueExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :next_value_expr,
          tag: 43,
          type: {:message, PgQuery.NextValueExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "inferenceElem",
          kind: {:oneof, :node},
          label: :optional,
          name: :inference_elem,
          tag: 44,
          type: {:message, PgQuery.InferenceElem}
        },
        %{
          __struct__: Protox.Field,
          json_name: "targetEntry",
          kind: {:oneof, :node},
          label: :optional,
          name: :target_entry,
          tag: 45,
          type: {:message, PgQuery.TargetEntry}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rangeTblRef",
          kind: {:oneof, :node},
          label: :optional,
          name: :range_tbl_ref,
          tag: 46,
          type: {:message, PgQuery.RangeTblRef}
        },
        %{
          __struct__: Protox.Field,
          json_name: "joinExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :join_expr,
          tag: 47,
          type: {:message, PgQuery.JoinExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "fromExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :from_expr,
          tag: 48,
          type: {:message, PgQuery.FromExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "onConflictExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :on_conflict_expr,
          tag: 49,
          type: {:message, PgQuery.OnConflictExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "intoClause",
          kind: {:oneof, :node},
          label: :optional,
          name: :into_clause,
          tag: 50,
          type: {:message, PgQuery.IntoClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "mergeAction",
          kind: {:oneof, :node},
          label: :optional,
          name: :merge_action,
          tag: 51,
          type: {:message, PgQuery.MergeAction}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rawStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :raw_stmt,
          tag: 52,
          type: {:message, PgQuery.RawStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "query",
          kind: {:oneof, :node},
          label: :optional,
          name: :query,
          tag: 53,
          type: {:message, PgQuery.Query}
        },
        %{
          __struct__: Protox.Field,
          json_name: "insertStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :insert_stmt,
          tag: 54,
          type: {:message, PgQuery.InsertStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "deleteStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :delete_stmt,
          tag: 55,
          type: {:message, PgQuery.DeleteStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "updateStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :update_stmt,
          tag: 56,
          type: {:message, PgQuery.UpdateStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "mergeStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :merge_stmt,
          tag: 57,
          type: {:message, PgQuery.MergeStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "selectStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :select_stmt,
          tag: 58,
          type: {:message, PgQuery.SelectStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "returnStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :return_stmt,
          tag: 59,
          type: {:message, PgQuery.ReturnStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "plassignStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :plassign_stmt,
          tag: 60,
          type: {:message, PgQuery.PLAssignStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterTableStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_table_stmt,
          tag: 61,
          type: {:message, PgQuery.AlterTableStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterTableCmd",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_table_cmd,
          tag: 62,
          type: {:message, PgQuery.AlterTableCmd}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterDomainStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_domain_stmt,
          tag: 63,
          type: {:message, PgQuery.AlterDomainStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "setOperationStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :set_operation_stmt,
          tag: 64,
          type: {:message, PgQuery.SetOperationStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "grantStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :grant_stmt,
          tag: 65,
          type: {:message, PgQuery.GrantStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "grantRoleStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :grant_role_stmt,
          tag: 66,
          type: {:message, PgQuery.GrantRoleStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterDefaultPrivilegesStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_default_privileges_stmt,
          tag: 67,
          type: {:message, PgQuery.AlterDefaultPrivilegesStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "closePortalStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :close_portal_stmt,
          tag: 68,
          type: {:message, PgQuery.ClosePortalStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "clusterStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :cluster_stmt,
          tag: 69,
          type: {:message, PgQuery.ClusterStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "copyStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :copy_stmt,
          tag: 70,
          type: {:message, PgQuery.CopyStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_stmt,
          tag: 71,
          type: {:message, PgQuery.CreateStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "defineStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :define_stmt,
          tag: 72,
          type: {:message, PgQuery.DefineStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "dropStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :drop_stmt,
          tag: 73,
          type: {:message, PgQuery.DropStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "truncateStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :truncate_stmt,
          tag: 74,
          type: {:message, PgQuery.TruncateStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "commentStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :comment_stmt,
          tag: 75,
          type: {:message, PgQuery.CommentStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "fetchStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :fetch_stmt,
          tag: 76,
          type: {:message, PgQuery.FetchStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "indexStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :index_stmt,
          tag: 77,
          type: {:message, PgQuery.IndexStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createFunctionStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_function_stmt,
          tag: 78,
          type: {:message, PgQuery.CreateFunctionStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterFunctionStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_function_stmt,
          tag: 79,
          type: {:message, PgQuery.AlterFunctionStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "doStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :do_stmt,
          tag: 80,
          type: {:message, PgQuery.DoStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "renameStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :rename_stmt,
          tag: 81,
          type: {:message, PgQuery.RenameStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "ruleStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :rule_stmt,
          tag: 82,
          type: {:message, PgQuery.RuleStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "notifyStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :notify_stmt,
          tag: 83,
          type: {:message, PgQuery.NotifyStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "listenStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :listen_stmt,
          tag: 84,
          type: {:message, PgQuery.ListenStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "unlistenStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :unlisten_stmt,
          tag: 85,
          type: {:message, PgQuery.UnlistenStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "transactionStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :transaction_stmt,
          tag: 86,
          type: {:message, PgQuery.TransactionStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "viewStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :view_stmt,
          tag: 87,
          type: {:message, PgQuery.ViewStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "loadStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :load_stmt,
          tag: 88,
          type: {:message, PgQuery.LoadStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createDomainStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_domain_stmt,
          tag: 89,
          type: {:message, PgQuery.CreateDomainStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createdbStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :createdb_stmt,
          tag: 90,
          type: {:message, PgQuery.CreatedbStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "dropdbStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :dropdb_stmt,
          tag: 91,
          type: {:message, PgQuery.DropdbStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "vacuumStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :vacuum_stmt,
          tag: 92,
          type: {:message, PgQuery.VacuumStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "explainStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :explain_stmt,
          tag: 93,
          type: {:message, PgQuery.ExplainStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createTableAsStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_table_as_stmt,
          tag: 94,
          type: {:message, PgQuery.CreateTableAsStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createSeqStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_seq_stmt,
          tag: 95,
          type: {:message, PgQuery.CreateSeqStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterSeqStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_seq_stmt,
          tag: 96,
          type: {:message, PgQuery.AlterSeqStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "variableSetStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :variable_set_stmt,
          tag: 97,
          type: {:message, PgQuery.VariableSetStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "variableShowStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :variable_show_stmt,
          tag: 98,
          type: {:message, PgQuery.VariableShowStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "discardStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :discard_stmt,
          tag: 99,
          type: {:message, PgQuery.DiscardStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createTrigStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_trig_stmt,
          tag: 100,
          type: {:message, PgQuery.CreateTrigStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createPlangStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_plang_stmt,
          tag: 101,
          type: {:message, PgQuery.CreatePLangStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createRoleStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_role_stmt,
          tag: 102,
          type: {:message, PgQuery.CreateRoleStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterRoleStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_role_stmt,
          tag: 103,
          type: {:message, PgQuery.AlterRoleStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "dropRoleStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :drop_role_stmt,
          tag: 104,
          type: {:message, PgQuery.DropRoleStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "lockStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :lock_stmt,
          tag: 105,
          type: {:message, PgQuery.LockStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "constraintsSetStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :constraints_set_stmt,
          tag: 106,
          type: {:message, PgQuery.ConstraintsSetStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "reindexStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :reindex_stmt,
          tag: 107,
          type: {:message, PgQuery.ReindexStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "checkPointStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :check_point_stmt,
          tag: 108,
          type: {:message, PgQuery.CheckPointStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createSchemaStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_schema_stmt,
          tag: 109,
          type: {:message, PgQuery.CreateSchemaStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterDatabaseStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_database_stmt,
          tag: 110,
          type: {:message, PgQuery.AlterDatabaseStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterDatabaseRefreshCollStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_database_refresh_coll_stmt,
          tag: 111,
          type: {:message, PgQuery.AlterDatabaseRefreshCollStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterDatabaseSetStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_database_set_stmt,
          tag: 112,
          type: {:message, PgQuery.AlterDatabaseSetStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterRoleSetStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_role_set_stmt,
          tag: 113,
          type: {:message, PgQuery.AlterRoleSetStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createConversionStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_conversion_stmt,
          tag: 114,
          type: {:message, PgQuery.CreateConversionStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createCastStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_cast_stmt,
          tag: 115,
          type: {:message, PgQuery.CreateCastStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createOpClassStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_op_class_stmt,
          tag: 116,
          type: {:message, PgQuery.CreateOpClassStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createOpFamilyStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_op_family_stmt,
          tag: 117,
          type: {:message, PgQuery.CreateOpFamilyStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterOpFamilyStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_op_family_stmt,
          tag: 118,
          type: {:message, PgQuery.AlterOpFamilyStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "prepareStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :prepare_stmt,
          tag: 119,
          type: {:message, PgQuery.PrepareStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "executeStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :execute_stmt,
          tag: 120,
          type: {:message, PgQuery.ExecuteStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "deallocateStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :deallocate_stmt,
          tag: 121,
          type: {:message, PgQuery.DeallocateStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "declareCursorStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :declare_cursor_stmt,
          tag: 122,
          type: {:message, PgQuery.DeclareCursorStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createTableSpaceStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_table_space_stmt,
          tag: 123,
          type: {:message, PgQuery.CreateTableSpaceStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "dropTableSpaceStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :drop_table_space_stmt,
          tag: 124,
          type: {:message, PgQuery.DropTableSpaceStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterObjectDependsStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_object_depends_stmt,
          tag: 125,
          type: {:message, PgQuery.AlterObjectDependsStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterObjectSchemaStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_object_schema_stmt,
          tag: 126,
          type: {:message, PgQuery.AlterObjectSchemaStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterOwnerStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_owner_stmt,
          tag: 127,
          type: {:message, PgQuery.AlterOwnerStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterOperatorStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_operator_stmt,
          tag: 128,
          type: {:message, PgQuery.AlterOperatorStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterTypeStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_type_stmt,
          tag: 129,
          type: {:message, PgQuery.AlterTypeStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "dropOwnedStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :drop_owned_stmt,
          tag: 130,
          type: {:message, PgQuery.DropOwnedStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "reassignOwnedStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :reassign_owned_stmt,
          tag: 131,
          type: {:message, PgQuery.ReassignOwnedStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "compositeTypeStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :composite_type_stmt,
          tag: 132,
          type: {:message, PgQuery.CompositeTypeStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createEnumStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_enum_stmt,
          tag: 133,
          type: {:message, PgQuery.CreateEnumStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createRangeStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_range_stmt,
          tag: 134,
          type: {:message, PgQuery.CreateRangeStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterEnumStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_enum_stmt,
          tag: 135,
          type: {:message, PgQuery.AlterEnumStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterTsdictionaryStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_tsdictionary_stmt,
          tag: 136,
          type: {:message, PgQuery.AlterTSDictionaryStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterTsconfigurationStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_tsconfiguration_stmt,
          tag: 137,
          type: {:message, PgQuery.AlterTSConfigurationStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createFdwStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_fdw_stmt,
          tag: 138,
          type: {:message, PgQuery.CreateFdwStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterFdwStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_fdw_stmt,
          tag: 139,
          type: {:message, PgQuery.AlterFdwStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createForeignServerStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_foreign_server_stmt,
          tag: 140,
          type: {:message, PgQuery.CreateForeignServerStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterForeignServerStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_foreign_server_stmt,
          tag: 141,
          type: {:message, PgQuery.AlterForeignServerStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createUserMappingStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_user_mapping_stmt,
          tag: 142,
          type: {:message, PgQuery.CreateUserMappingStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterUserMappingStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_user_mapping_stmt,
          tag: 143,
          type: {:message, PgQuery.AlterUserMappingStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "dropUserMappingStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :drop_user_mapping_stmt,
          tag: 144,
          type: {:message, PgQuery.DropUserMappingStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterTableSpaceOptionsStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_table_space_options_stmt,
          tag: 145,
          type: {:message, PgQuery.AlterTableSpaceOptionsStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterTableMoveAllStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_table_move_all_stmt,
          tag: 146,
          type: {:message, PgQuery.AlterTableMoveAllStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "secLabelStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :sec_label_stmt,
          tag: 147,
          type: {:message, PgQuery.SecLabelStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createForeignTableStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_foreign_table_stmt,
          tag: 148,
          type: {:message, PgQuery.CreateForeignTableStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "importForeignSchemaStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :import_foreign_schema_stmt,
          tag: 149,
          type: {:message, PgQuery.ImportForeignSchemaStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createExtensionStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_extension_stmt,
          tag: 150,
          type: {:message, PgQuery.CreateExtensionStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterExtensionStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_extension_stmt,
          tag: 151,
          type: {:message, PgQuery.AlterExtensionStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterExtensionContentsStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_extension_contents_stmt,
          tag: 152,
          type: {:message, PgQuery.AlterExtensionContentsStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createEventTrigStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_event_trig_stmt,
          tag: 153,
          type: {:message, PgQuery.CreateEventTrigStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterEventTrigStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_event_trig_stmt,
          tag: 154,
          type: {:message, PgQuery.AlterEventTrigStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "refreshMatViewStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :refresh_mat_view_stmt,
          tag: 155,
          type: {:message, PgQuery.RefreshMatViewStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "replicaIdentityStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :replica_identity_stmt,
          tag: 156,
          type: {:message, PgQuery.ReplicaIdentityStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterSystemStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_system_stmt,
          tag: 157,
          type: {:message, PgQuery.AlterSystemStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createPolicyStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_policy_stmt,
          tag: 158,
          type: {:message, PgQuery.CreatePolicyStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterPolicyStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_policy_stmt,
          tag: 159,
          type: {:message, PgQuery.AlterPolicyStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createTransformStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_transform_stmt,
          tag: 160,
          type: {:message, PgQuery.CreateTransformStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createAmStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_am_stmt,
          tag: 161,
          type: {:message, PgQuery.CreateAmStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createPublicationStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_publication_stmt,
          tag: 162,
          type: {:message, PgQuery.CreatePublicationStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterPublicationStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_publication_stmt,
          tag: 163,
          type: {:message, PgQuery.AlterPublicationStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createSubscriptionStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_subscription_stmt,
          tag: 164,
          type: {:message, PgQuery.CreateSubscriptionStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterSubscriptionStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_subscription_stmt,
          tag: 165,
          type: {:message, PgQuery.AlterSubscriptionStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "dropSubscriptionStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :drop_subscription_stmt,
          tag: 166,
          type: {:message, PgQuery.DropSubscriptionStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createStatsStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_stats_stmt,
          tag: 167,
          type: {:message, PgQuery.CreateStatsStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterCollationStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_collation_stmt,
          tag: 168,
          type: {:message, PgQuery.AlterCollationStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "callStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :call_stmt,
          tag: 169,
          type: {:message, PgQuery.CallStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alterStatsStmt",
          kind: {:oneof, :node},
          label: :optional,
          name: :alter_stats_stmt,
          tag: 170,
          type: {:message, PgQuery.AlterStatsStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "aExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :a_expr,
          tag: 171,
          type: {:message, PgQuery.A_Expr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "columnRef",
          kind: {:oneof, :node},
          label: :optional,
          name: :column_ref,
          tag: 172,
          type: {:message, PgQuery.ColumnRef}
        },
        %{
          __struct__: Protox.Field,
          json_name: "paramRef",
          kind: {:oneof, :node},
          label: :optional,
          name: :param_ref,
          tag: 173,
          type: {:message, PgQuery.ParamRef}
        },
        %{
          __struct__: Protox.Field,
          json_name: "funcCall",
          kind: {:oneof, :node},
          label: :optional,
          name: :func_call,
          tag: 174,
          type: {:message, PgQuery.FuncCall}
        },
        %{
          __struct__: Protox.Field,
          json_name: "aStar",
          kind: {:oneof, :node},
          label: :optional,
          name: :a_star,
          tag: 175,
          type: {:message, PgQuery.A_Star}
        },
        %{
          __struct__: Protox.Field,
          json_name: "aIndices",
          kind: {:oneof, :node},
          label: :optional,
          name: :a_indices,
          tag: 176,
          type: {:message, PgQuery.A_Indices}
        },
        %{
          __struct__: Protox.Field,
          json_name: "aIndirection",
          kind: {:oneof, :node},
          label: :optional,
          name: :a_indirection,
          tag: 177,
          type: {:message, PgQuery.A_Indirection}
        },
        %{
          __struct__: Protox.Field,
          json_name: "aArrayExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :a_array_expr,
          tag: 178,
          type: {:message, PgQuery.A_ArrayExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "resTarget",
          kind: {:oneof, :node},
          label: :optional,
          name: :res_target,
          tag: 179,
          type: {:message, PgQuery.ResTarget}
        },
        %{
          __struct__: Protox.Field,
          json_name: "multiAssignRef",
          kind: {:oneof, :node},
          label: :optional,
          name: :multi_assign_ref,
          tag: 180,
          type: {:message, PgQuery.MultiAssignRef}
        },
        %{
          __struct__: Protox.Field,
          json_name: "typeCast",
          kind: {:oneof, :node},
          label: :optional,
          name: :type_cast,
          tag: 181,
          type: {:message, PgQuery.TypeCast}
        },
        %{
          __struct__: Protox.Field,
          json_name: "collateClause",
          kind: {:oneof, :node},
          label: :optional,
          name: :collate_clause,
          tag: 182,
          type: {:message, PgQuery.CollateClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "sortBy",
          kind: {:oneof, :node},
          label: :optional,
          name: :sort_by,
          tag: 183,
          type: {:message, PgQuery.SortBy}
        },
        %{
          __struct__: Protox.Field,
          json_name: "windowDef",
          kind: {:oneof, :node},
          label: :optional,
          name: :window_def,
          tag: 184,
          type: {:message, PgQuery.WindowDef}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rangeSubselect",
          kind: {:oneof, :node},
          label: :optional,
          name: :range_subselect,
          tag: 185,
          type: {:message, PgQuery.RangeSubselect}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rangeFunction",
          kind: {:oneof, :node},
          label: :optional,
          name: :range_function,
          tag: 186,
          type: {:message, PgQuery.RangeFunction}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rangeTableSample",
          kind: {:oneof, :node},
          label: :optional,
          name: :range_table_sample,
          tag: 187,
          type: {:message, PgQuery.RangeTableSample}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rangeTableFunc",
          kind: {:oneof, :node},
          label: :optional,
          name: :range_table_func,
          tag: 188,
          type: {:message, PgQuery.RangeTableFunc}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rangeTableFuncCol",
          kind: {:oneof, :node},
          label: :optional,
          name: :range_table_func_col,
          tag: 189,
          type: {:message, PgQuery.RangeTableFuncCol}
        },
        %{
          __struct__: Protox.Field,
          json_name: "typeName",
          kind: {:oneof, :node},
          label: :optional,
          name: :type_name,
          tag: 190,
          type: {:message, PgQuery.TypeName}
        },
        %{
          __struct__: Protox.Field,
          json_name: "columnDef",
          kind: {:oneof, :node},
          label: :optional,
          name: :column_def,
          tag: 191,
          type: {:message, PgQuery.ColumnDef}
        },
        %{
          __struct__: Protox.Field,
          json_name: "indexElem",
          kind: {:oneof, :node},
          label: :optional,
          name: :index_elem,
          tag: 192,
          type: {:message, PgQuery.IndexElem}
        },
        %{
          __struct__: Protox.Field,
          json_name: "statsElem",
          kind: {:oneof, :node},
          label: :optional,
          name: :stats_elem,
          tag: 193,
          type: {:message, PgQuery.StatsElem}
        },
        %{
          __struct__: Protox.Field,
          json_name: "constraint",
          kind: {:oneof, :node},
          label: :optional,
          name: :constraint,
          tag: 194,
          type: {:message, PgQuery.Constraint}
        },
        %{
          __struct__: Protox.Field,
          json_name: "defElem",
          kind: {:oneof, :node},
          label: :optional,
          name: :def_elem,
          tag: 195,
          type: {:message, PgQuery.DefElem}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rangeTblEntry",
          kind: {:oneof, :node},
          label: :optional,
          name: :range_tbl_entry,
          tag: 196,
          type: {:message, PgQuery.RangeTblEntry}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rangeTblFunction",
          kind: {:oneof, :node},
          label: :optional,
          name: :range_tbl_function,
          tag: 197,
          type: {:message, PgQuery.RangeTblFunction}
        },
        %{
          __struct__: Protox.Field,
          json_name: "tableSampleClause",
          kind: {:oneof, :node},
          label: :optional,
          name: :table_sample_clause,
          tag: 198,
          type: {:message, PgQuery.TableSampleClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "withCheckOption",
          kind: {:oneof, :node},
          label: :optional,
          name: :with_check_option,
          tag: 199,
          type: {:message, PgQuery.WithCheckOption}
        },
        %{
          __struct__: Protox.Field,
          json_name: "sortGroupClause",
          kind: {:oneof, :node},
          label: :optional,
          name: :sort_group_clause,
          tag: 200,
          type: {:message, PgQuery.SortGroupClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "groupingSet",
          kind: {:oneof, :node},
          label: :optional,
          name: :grouping_set,
          tag: 201,
          type: {:message, PgQuery.GroupingSet}
        },
        %{
          __struct__: Protox.Field,
          json_name: "windowClause",
          kind: {:oneof, :node},
          label: :optional,
          name: :window_clause,
          tag: 202,
          type: {:message, PgQuery.WindowClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "objectWithArgs",
          kind: {:oneof, :node},
          label: :optional,
          name: :object_with_args,
          tag: 203,
          type: {:message, PgQuery.ObjectWithArgs}
        },
        %{
          __struct__: Protox.Field,
          json_name: "accessPriv",
          kind: {:oneof, :node},
          label: :optional,
          name: :access_priv,
          tag: 204,
          type: {:message, PgQuery.AccessPriv}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createOpClassItem",
          kind: {:oneof, :node},
          label: :optional,
          name: :create_op_class_item,
          tag: 205,
          type: {:message, PgQuery.CreateOpClassItem}
        },
        %{
          __struct__: Protox.Field,
          json_name: "tableLikeClause",
          kind: {:oneof, :node},
          label: :optional,
          name: :table_like_clause,
          tag: 206,
          type: {:message, PgQuery.TableLikeClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "functionParameter",
          kind: {:oneof, :node},
          label: :optional,
          name: :function_parameter,
          tag: 207,
          type: {:message, PgQuery.FunctionParameter}
        },
        %{
          __struct__: Protox.Field,
          json_name: "lockingClause",
          kind: {:oneof, :node},
          label: :optional,
          name: :locking_clause,
          tag: 208,
          type: {:message, PgQuery.LockingClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rowMarkClause",
          kind: {:oneof, :node},
          label: :optional,
          name: :row_mark_clause,
          tag: 209,
          type: {:message, PgQuery.RowMarkClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "xmlSerialize",
          kind: {:oneof, :node},
          label: :optional,
          name: :xml_serialize,
          tag: 210,
          type: {:message, PgQuery.XmlSerialize}
        },
        %{
          __struct__: Protox.Field,
          json_name: "withClause",
          kind: {:oneof, :node},
          label: :optional,
          name: :with_clause,
          tag: 211,
          type: {:message, PgQuery.WithClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "inferClause",
          kind: {:oneof, :node},
          label: :optional,
          name: :infer_clause,
          tag: 212,
          type: {:message, PgQuery.InferClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "onConflictClause",
          kind: {:oneof, :node},
          label: :optional,
          name: :on_conflict_clause,
          tag: 213,
          type: {:message, PgQuery.OnConflictClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "ctesearchClause",
          kind: {:oneof, :node},
          label: :optional,
          name: :ctesearch_clause,
          tag: 214,
          type: {:message, PgQuery.CTESearchClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "ctecycleClause",
          kind: {:oneof, :node},
          label: :optional,
          name: :ctecycle_clause,
          tag: 215,
          type: {:message, PgQuery.CTECycleClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "commonTableExpr",
          kind: {:oneof, :node},
          label: :optional,
          name: :common_table_expr,
          tag: 216,
          type: {:message, PgQuery.CommonTableExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "mergeWhenClause",
          kind: {:oneof, :node},
          label: :optional,
          name: :merge_when_clause,
          tag: 217,
          type: {:message, PgQuery.MergeWhenClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "roleSpec",
          kind: {:oneof, :node},
          label: :optional,
          name: :role_spec,
          tag: 218,
          type: {:message, PgQuery.RoleSpec}
        },
        %{
          __struct__: Protox.Field,
          json_name: "triggerTransition",
          kind: {:oneof, :node},
          label: :optional,
          name: :trigger_transition,
          tag: 219,
          type: {:message, PgQuery.TriggerTransition}
        },
        %{
          __struct__: Protox.Field,
          json_name: "partitionElem",
          kind: {:oneof, :node},
          label: :optional,
          name: :partition_elem,
          tag: 220,
          type: {:message, PgQuery.PartitionElem}
        },
        %{
          __struct__: Protox.Field,
          json_name: "partitionSpec",
          kind: {:oneof, :node},
          label: :optional,
          name: :partition_spec,
          tag: 221,
          type: {:message, PgQuery.PartitionSpec}
        },
        %{
          __struct__: Protox.Field,
          json_name: "partitionBoundSpec",
          kind: {:oneof, :node},
          label: :optional,
          name: :partition_bound_spec,
          tag: 222,
          type: {:message, PgQuery.PartitionBoundSpec}
        },
        %{
          __struct__: Protox.Field,
          json_name: "partitionRangeDatum",
          kind: {:oneof, :node},
          label: :optional,
          name: :partition_range_datum,
          tag: 223,
          type: {:message, PgQuery.PartitionRangeDatum}
        },
        %{
          __struct__: Protox.Field,
          json_name: "partitionCmd",
          kind: {:oneof, :node},
          label: :optional,
          name: :partition_cmd,
          tag: 224,
          type: {:message, PgQuery.PartitionCmd}
        },
        %{
          __struct__: Protox.Field,
          json_name: "vacuumRelation",
          kind: {:oneof, :node},
          label: :optional,
          name: :vacuum_relation,
          tag: 225,
          type: {:message, PgQuery.VacuumRelation}
        },
        %{
          __struct__: Protox.Field,
          json_name: "publicationObjSpec",
          kind: {:oneof, :node},
          label: :optional,
          name: :publication_obj_spec,
          tag: 226,
          type: {:message, PgQuery.PublicationObjSpec}
        },
        %{
          __struct__: Protox.Field,
          json_name: "publicationTable",
          kind: {:oneof, :node},
          label: :optional,
          name: :publication_table,
          tag: 227,
          type: {:message, PgQuery.PublicationTable}
        },
        %{
          __struct__: Protox.Field,
          json_name: "inlineCodeBlock",
          kind: {:oneof, :node},
          label: :optional,
          name: :inline_code_block,
          tag: 228,
          type: {:message, PgQuery.InlineCodeBlock}
        },
        %{
          __struct__: Protox.Field,
          json_name: "callContext",
          kind: {:oneof, :node},
          label: :optional,
          name: :call_context,
          tag: 229,
          type: {:message, PgQuery.CallContext}
        },
        %{
          __struct__: Protox.Field,
          json_name: "integer",
          kind: {:oneof, :node},
          label: :optional,
          name: :integer,
          tag: 230,
          type: {:message, PgQuery.Integer}
        },
        %{
          __struct__: Protox.Field,
          json_name: "float",
          kind: {:oneof, :node},
          label: :optional,
          name: :float,
          tag: 231,
          type: {:message, PgQuery.Float}
        },
        %{
          __struct__: Protox.Field,
          json_name: "boolean",
          kind: {:oneof, :node},
          label: :optional,
          name: :boolean,
          tag: 232,
          type: {:message, PgQuery.Boolean}
        },
        %{
          __struct__: Protox.Field,
          json_name: "string",
          kind: {:oneof, :node},
          label: :optional,
          name: :string,
          tag: 233,
          type: {:message, PgQuery.String}
        },
        %{
          __struct__: Protox.Field,
          json_name: "bitString",
          kind: {:oneof, :node},
          label: :optional,
          name: :bit_string,
          tag: 234,
          type: {:message, PgQuery.BitString}
        },
        %{
          __struct__: Protox.Field,
          json_name: "list",
          kind: {:oneof, :node},
          label: :optional,
          name: :list,
          tag: 235,
          type: {:message, PgQuery.List}
        },
        %{
          __struct__: Protox.Field,
          json_name: "intList",
          kind: {:oneof, :node},
          label: :optional,
          name: :int_list,
          tag: 236,
          type: {:message, PgQuery.IntList}
        },
        %{
          __struct__: Protox.Field,
          json_name: "oidList",
          kind: {:oneof, :node},
          label: :optional,
          name: :oid_list,
          tag: 237,
          type: {:message, PgQuery.OidList}
        },
        %{
          __struct__: Protox.Field,
          json_name: "aConst",
          kind: {:oneof, :node},
          label: :optional,
          name: :a_const,
          tag: 238,
          type: {:message, PgQuery.A_Const}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:alias) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alias",
             kind: {:oneof, :node},
             label: :optional,
             name: :alias,
             tag: 1,
             type: {:message, PgQuery.Alias}
           }}
        end

        def field_def("alias") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alias",
             kind: {:oneof, :node},
             label: :optional,
             name: :alias,
             tag: 1,
             type: {:message, PgQuery.Alias}
           }}
        end

        []
      ),
      (
        def field_def(:range_var) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeVar",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_var,
             tag: 2,
             type: {:message, PgQuery.RangeVar}
           }}
        end

        def field_def("rangeVar") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeVar",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_var,
             tag: 2,
             type: {:message, PgQuery.RangeVar}
           }}
        end

        def field_def("range_var") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeVar",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_var,
             tag: 2,
             type: {:message, PgQuery.RangeVar}
           }}
        end
      ),
      (
        def field_def(:table_func) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableFunc",
             kind: {:oneof, :node},
             label: :optional,
             name: :table_func,
             tag: 3,
             type: {:message, PgQuery.TableFunc}
           }}
        end

        def field_def("tableFunc") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableFunc",
             kind: {:oneof, :node},
             label: :optional,
             name: :table_func,
             tag: 3,
             type: {:message, PgQuery.TableFunc}
           }}
        end

        def field_def("table_func") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableFunc",
             kind: {:oneof, :node},
             label: :optional,
             name: :table_func,
             tag: 3,
             type: {:message, PgQuery.TableFunc}
           }}
        end
      ),
      (
        def field_def(:var) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "var",
             kind: {:oneof, :node},
             label: :optional,
             name: :var,
             tag: 4,
             type: {:message, PgQuery.Var}
           }}
        end

        def field_def("var") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "var",
             kind: {:oneof, :node},
             label: :optional,
             name: :var,
             tag: 4,
             type: {:message, PgQuery.Var}
           }}
        end

        []
      ),
      (
        def field_def(:param) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "param",
             kind: {:oneof, :node},
             label: :optional,
             name: :param,
             tag: 5,
             type: {:message, PgQuery.Param}
           }}
        end

        def field_def("param") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "param",
             kind: {:oneof, :node},
             label: :optional,
             name: :param,
             tag: 5,
             type: {:message, PgQuery.Param}
           }}
        end

        []
      ),
      (
        def field_def(:aggref) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggref",
             kind: {:oneof, :node},
             label: :optional,
             name: :aggref,
             tag: 6,
             type: {:message, PgQuery.Aggref}
           }}
        end

        def field_def("aggref") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggref",
             kind: {:oneof, :node},
             label: :optional,
             name: :aggref,
             tag: 6,
             type: {:message, PgQuery.Aggref}
           }}
        end

        []
      ),
      (
        def field_def(:grouping_func) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupingFunc",
             kind: {:oneof, :node},
             label: :optional,
             name: :grouping_func,
             tag: 7,
             type: {:message, PgQuery.GroupingFunc}
           }}
        end

        def field_def("groupingFunc") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupingFunc",
             kind: {:oneof, :node},
             label: :optional,
             name: :grouping_func,
             tag: 7,
             type: {:message, PgQuery.GroupingFunc}
           }}
        end

        def field_def("grouping_func") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupingFunc",
             kind: {:oneof, :node},
             label: :optional,
             name: :grouping_func,
             tag: 7,
             type: {:message, PgQuery.GroupingFunc}
           }}
        end
      ),
      (
        def field_def(:window_func) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "windowFunc",
             kind: {:oneof, :node},
             label: :optional,
             name: :window_func,
             tag: 8,
             type: {:message, PgQuery.WindowFunc}
           }}
        end

        def field_def("windowFunc") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "windowFunc",
             kind: {:oneof, :node},
             label: :optional,
             name: :window_func,
             tag: 8,
             type: {:message, PgQuery.WindowFunc}
           }}
        end

        def field_def("window_func") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "windowFunc",
             kind: {:oneof, :node},
             label: :optional,
             name: :window_func,
             tag: 8,
             type: {:message, PgQuery.WindowFunc}
           }}
        end
      ),
      (
        def field_def(:subscripting_ref) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subscriptingRef",
             kind: {:oneof, :node},
             label: :optional,
             name: :subscripting_ref,
             tag: 9,
             type: {:message, PgQuery.SubscriptingRef}
           }}
        end

        def field_def("subscriptingRef") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subscriptingRef",
             kind: {:oneof, :node},
             label: :optional,
             name: :subscripting_ref,
             tag: 9,
             type: {:message, PgQuery.SubscriptingRef}
           }}
        end

        def field_def("subscripting_ref") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subscriptingRef",
             kind: {:oneof, :node},
             label: :optional,
             name: :subscripting_ref,
             tag: 9,
             type: {:message, PgQuery.SubscriptingRef}
           }}
        end
      ),
      (
        def field_def(:func_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :func_expr,
             tag: 10,
             type: {:message, PgQuery.FuncExpr}
           }}
        end

        def field_def("funcExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :func_expr,
             tag: 10,
             type: {:message, PgQuery.FuncExpr}
           }}
        end

        def field_def("func_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :func_expr,
             tag: 10,
             type: {:message, PgQuery.FuncExpr}
           }}
        end
      ),
      (
        def field_def(:named_arg_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "namedArgExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :named_arg_expr,
             tag: 11,
             type: {:message, PgQuery.NamedArgExpr}
           }}
        end

        def field_def("namedArgExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "namedArgExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :named_arg_expr,
             tag: 11,
             type: {:message, PgQuery.NamedArgExpr}
           }}
        end

        def field_def("named_arg_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "namedArgExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :named_arg_expr,
             tag: 11,
             type: {:message, PgQuery.NamedArgExpr}
           }}
        end
      ),
      (
        def field_def(:op_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :op_expr,
             tag: 12,
             type: {:message, PgQuery.OpExpr}
           }}
        end

        def field_def("opExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :op_expr,
             tag: 12,
             type: {:message, PgQuery.OpExpr}
           }}
        end

        def field_def("op_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :op_expr,
             tag: 12,
             type: {:message, PgQuery.OpExpr}
           }}
        end
      ),
      (
        def field_def(:distinct_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "distinctExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :distinct_expr,
             tag: 13,
             type: {:message, PgQuery.DistinctExpr}
           }}
        end

        def field_def("distinctExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "distinctExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :distinct_expr,
             tag: 13,
             type: {:message, PgQuery.DistinctExpr}
           }}
        end

        def field_def("distinct_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "distinctExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :distinct_expr,
             tag: 13,
             type: {:message, PgQuery.DistinctExpr}
           }}
        end
      ),
      (
        def field_def(:null_if_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nullIfExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :null_if_expr,
             tag: 14,
             type: {:message, PgQuery.NullIfExpr}
           }}
        end

        def field_def("nullIfExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nullIfExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :null_if_expr,
             tag: 14,
             type: {:message, PgQuery.NullIfExpr}
           }}
        end

        def field_def("null_if_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nullIfExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :null_if_expr,
             tag: 14,
             type: {:message, PgQuery.NullIfExpr}
           }}
        end
      ),
      (
        def field_def(:scalar_array_op_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "scalarArrayOpExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :scalar_array_op_expr,
             tag: 15,
             type: {:message, PgQuery.ScalarArrayOpExpr}
           }}
        end

        def field_def("scalarArrayOpExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "scalarArrayOpExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :scalar_array_op_expr,
             tag: 15,
             type: {:message, PgQuery.ScalarArrayOpExpr}
           }}
        end

        def field_def("scalar_array_op_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "scalarArrayOpExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :scalar_array_op_expr,
             tag: 15,
             type: {:message, PgQuery.ScalarArrayOpExpr}
           }}
        end
      ),
      (
        def field_def(:bool_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "boolExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :bool_expr,
             tag: 16,
             type: {:message, PgQuery.BoolExpr}
           }}
        end

        def field_def("boolExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "boolExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :bool_expr,
             tag: 16,
             type: {:message, PgQuery.BoolExpr}
           }}
        end

        def field_def("bool_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "boolExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :bool_expr,
             tag: 16,
             type: {:message, PgQuery.BoolExpr}
           }}
        end
      ),
      (
        def field_def(:sub_link) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subLink",
             kind: {:oneof, :node},
             label: :optional,
             name: :sub_link,
             tag: 17,
             type: {:message, PgQuery.SubLink}
           }}
        end

        def field_def("subLink") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subLink",
             kind: {:oneof, :node},
             label: :optional,
             name: :sub_link,
             tag: 17,
             type: {:message, PgQuery.SubLink}
           }}
        end

        def field_def("sub_link") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subLink",
             kind: {:oneof, :node},
             label: :optional,
             name: :sub_link,
             tag: 17,
             type: {:message, PgQuery.SubLink}
           }}
        end
      ),
      (
        def field_def(:sub_plan) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subPlan",
             kind: {:oneof, :node},
             label: :optional,
             name: :sub_plan,
             tag: 18,
             type: {:message, PgQuery.SubPlan}
           }}
        end

        def field_def("subPlan") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subPlan",
             kind: {:oneof, :node},
             label: :optional,
             name: :sub_plan,
             tag: 18,
             type: {:message, PgQuery.SubPlan}
           }}
        end

        def field_def("sub_plan") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subPlan",
             kind: {:oneof, :node},
             label: :optional,
             name: :sub_plan,
             tag: 18,
             type: {:message, PgQuery.SubPlan}
           }}
        end
      ),
      (
        def field_def(:alternative_sub_plan) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alternativeSubPlan",
             kind: {:oneof, :node},
             label: :optional,
             name: :alternative_sub_plan,
             tag: 19,
             type: {:message, PgQuery.AlternativeSubPlan}
           }}
        end

        def field_def("alternativeSubPlan") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alternativeSubPlan",
             kind: {:oneof, :node},
             label: :optional,
             name: :alternative_sub_plan,
             tag: 19,
             type: {:message, PgQuery.AlternativeSubPlan}
           }}
        end

        def field_def("alternative_sub_plan") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alternativeSubPlan",
             kind: {:oneof, :node},
             label: :optional,
             name: :alternative_sub_plan,
             tag: 19,
             type: {:message, PgQuery.AlternativeSubPlan}
           }}
        end
      ),
      (
        def field_def(:field_select) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldSelect",
             kind: {:oneof, :node},
             label: :optional,
             name: :field_select,
             tag: 20,
             type: {:message, PgQuery.FieldSelect}
           }}
        end

        def field_def("fieldSelect") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldSelect",
             kind: {:oneof, :node},
             label: :optional,
             name: :field_select,
             tag: 20,
             type: {:message, PgQuery.FieldSelect}
           }}
        end

        def field_def("field_select") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldSelect",
             kind: {:oneof, :node},
             label: :optional,
             name: :field_select,
             tag: 20,
             type: {:message, PgQuery.FieldSelect}
           }}
        end
      ),
      (
        def field_def(:field_store) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldStore",
             kind: {:oneof, :node},
             label: :optional,
             name: :field_store,
             tag: 21,
             type: {:message, PgQuery.FieldStore}
           }}
        end

        def field_def("fieldStore") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldStore",
             kind: {:oneof, :node},
             label: :optional,
             name: :field_store,
             tag: 21,
             type: {:message, PgQuery.FieldStore}
           }}
        end

        def field_def("field_store") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldStore",
             kind: {:oneof, :node},
             label: :optional,
             name: :field_store,
             tag: 21,
             type: {:message, PgQuery.FieldStore}
           }}
        end
      ),
      (
        def field_def(:relabel_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relabelType",
             kind: {:oneof, :node},
             label: :optional,
             name: :relabel_type,
             tag: 22,
             type: {:message, PgQuery.RelabelType}
           }}
        end

        def field_def("relabelType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relabelType",
             kind: {:oneof, :node},
             label: :optional,
             name: :relabel_type,
             tag: 22,
             type: {:message, PgQuery.RelabelType}
           }}
        end

        def field_def("relabel_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relabelType",
             kind: {:oneof, :node},
             label: :optional,
             name: :relabel_type,
             tag: 22,
             type: {:message, PgQuery.RelabelType}
           }}
        end
      ),
      (
        def field_def(:coerce_via_io) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coerceViaIo",
             kind: {:oneof, :node},
             label: :optional,
             name: :coerce_via_io,
             tag: 23,
             type: {:message, PgQuery.CoerceViaIO}
           }}
        end

        def field_def("coerceViaIo") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coerceViaIo",
             kind: {:oneof, :node},
             label: :optional,
             name: :coerce_via_io,
             tag: 23,
             type: {:message, PgQuery.CoerceViaIO}
           }}
        end

        def field_def("coerce_via_io") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coerceViaIo",
             kind: {:oneof, :node},
             label: :optional,
             name: :coerce_via_io,
             tag: 23,
             type: {:message, PgQuery.CoerceViaIO}
           }}
        end
      ),
      (
        def field_def(:array_coerce_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arrayCoerceExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :array_coerce_expr,
             tag: 24,
             type: {:message, PgQuery.ArrayCoerceExpr}
           }}
        end

        def field_def("arrayCoerceExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arrayCoerceExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :array_coerce_expr,
             tag: 24,
             type: {:message, PgQuery.ArrayCoerceExpr}
           }}
        end

        def field_def("array_coerce_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arrayCoerceExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :array_coerce_expr,
             tag: 24,
             type: {:message, PgQuery.ArrayCoerceExpr}
           }}
        end
      ),
      (
        def field_def(:convert_rowtype_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "convertRowtypeExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :convert_rowtype_expr,
             tag: 25,
             type: {:message, PgQuery.ConvertRowtypeExpr}
           }}
        end

        def field_def("convertRowtypeExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "convertRowtypeExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :convert_rowtype_expr,
             tag: 25,
             type: {:message, PgQuery.ConvertRowtypeExpr}
           }}
        end

        def field_def("convert_rowtype_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "convertRowtypeExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :convert_rowtype_expr,
             tag: 25,
             type: {:message, PgQuery.ConvertRowtypeExpr}
           }}
        end
      ),
      (
        def field_def(:collate_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collateExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :collate_expr,
             tag: 26,
             type: {:message, PgQuery.CollateExpr}
           }}
        end

        def field_def("collateExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collateExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :collate_expr,
             tag: 26,
             type: {:message, PgQuery.CollateExpr}
           }}
        end

        def field_def("collate_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collateExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :collate_expr,
             tag: 26,
             type: {:message, PgQuery.CollateExpr}
           }}
        end
      ),
      (
        def field_def(:case_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "caseExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :case_expr,
             tag: 27,
             type: {:message, PgQuery.CaseExpr}
           }}
        end

        def field_def("caseExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "caseExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :case_expr,
             tag: 27,
             type: {:message, PgQuery.CaseExpr}
           }}
        end

        def field_def("case_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "caseExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :case_expr,
             tag: 27,
             type: {:message, PgQuery.CaseExpr}
           }}
        end
      ),
      (
        def field_def(:case_when) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "caseWhen",
             kind: {:oneof, :node},
             label: :optional,
             name: :case_when,
             tag: 28,
             type: {:message, PgQuery.CaseWhen}
           }}
        end

        def field_def("caseWhen") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "caseWhen",
             kind: {:oneof, :node},
             label: :optional,
             name: :case_when,
             tag: 28,
             type: {:message, PgQuery.CaseWhen}
           }}
        end

        def field_def("case_when") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "caseWhen",
             kind: {:oneof, :node},
             label: :optional,
             name: :case_when,
             tag: 28,
             type: {:message, PgQuery.CaseWhen}
           }}
        end
      ),
      (
        def field_def(:case_test_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "caseTestExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :case_test_expr,
             tag: 29,
             type: {:message, PgQuery.CaseTestExpr}
           }}
        end

        def field_def("caseTestExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "caseTestExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :case_test_expr,
             tag: 29,
             type: {:message, PgQuery.CaseTestExpr}
           }}
        end

        def field_def("case_test_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "caseTestExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :case_test_expr,
             tag: 29,
             type: {:message, PgQuery.CaseTestExpr}
           }}
        end
      ),
      (
        def field_def(:array_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arrayExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :array_expr,
             tag: 30,
             type: {:message, PgQuery.ArrayExpr}
           }}
        end

        def field_def("arrayExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arrayExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :array_expr,
             tag: 30,
             type: {:message, PgQuery.ArrayExpr}
           }}
        end

        def field_def("array_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arrayExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :array_expr,
             tag: 30,
             type: {:message, PgQuery.ArrayExpr}
           }}
        end
      ),
      (
        def field_def(:row_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :row_expr,
             tag: 31,
             type: {:message, PgQuery.RowExpr}
           }}
        end

        def field_def("rowExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :row_expr,
             tag: 31,
             type: {:message, PgQuery.RowExpr}
           }}
        end

        def field_def("row_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :row_expr,
             tag: 31,
             type: {:message, PgQuery.RowExpr}
           }}
        end
      ),
      (
        def field_def(:row_compare_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowCompareExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :row_compare_expr,
             tag: 32,
             type: {:message, PgQuery.RowCompareExpr}
           }}
        end

        def field_def("rowCompareExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowCompareExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :row_compare_expr,
             tag: 32,
             type: {:message, PgQuery.RowCompareExpr}
           }}
        end

        def field_def("row_compare_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowCompareExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :row_compare_expr,
             tag: 32,
             type: {:message, PgQuery.RowCompareExpr}
           }}
        end
      ),
      (
        def field_def(:coalesce_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coalesceExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :coalesce_expr,
             tag: 33,
             type: {:message, PgQuery.CoalesceExpr}
           }}
        end

        def field_def("coalesceExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coalesceExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :coalesce_expr,
             tag: 33,
             type: {:message, PgQuery.CoalesceExpr}
           }}
        end

        def field_def("coalesce_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coalesceExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :coalesce_expr,
             tag: 33,
             type: {:message, PgQuery.CoalesceExpr}
           }}
        end
      ),
      (
        def field_def(:min_max_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "minMaxExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :min_max_expr,
             tag: 34,
             type: {:message, PgQuery.MinMaxExpr}
           }}
        end

        def field_def("minMaxExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "minMaxExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :min_max_expr,
             tag: 34,
             type: {:message, PgQuery.MinMaxExpr}
           }}
        end

        def field_def("min_max_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "minMaxExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :min_max_expr,
             tag: 34,
             type: {:message, PgQuery.MinMaxExpr}
           }}
        end
      ),
      (
        def field_def(:sqlvalue_function) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sqlvalueFunction",
             kind: {:oneof, :node},
             label: :optional,
             name: :sqlvalue_function,
             tag: 35,
             type: {:message, PgQuery.SQLValueFunction}
           }}
        end

        def field_def("sqlvalueFunction") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sqlvalueFunction",
             kind: {:oneof, :node},
             label: :optional,
             name: :sqlvalue_function,
             tag: 35,
             type: {:message, PgQuery.SQLValueFunction}
           }}
        end

        def field_def("sqlvalue_function") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sqlvalueFunction",
             kind: {:oneof, :node},
             label: :optional,
             name: :sqlvalue_function,
             tag: 35,
             type: {:message, PgQuery.SQLValueFunction}
           }}
        end
      ),
      (
        def field_def(:xml_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xmlExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :xml_expr,
             tag: 36,
             type: {:message, PgQuery.XmlExpr}
           }}
        end

        def field_def("xmlExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xmlExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :xml_expr,
             tag: 36,
             type: {:message, PgQuery.XmlExpr}
           }}
        end

        def field_def("xml_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xmlExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :xml_expr,
             tag: 36,
             type: {:message, PgQuery.XmlExpr}
           }}
        end
      ),
      (
        def field_def(:null_test) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nullTest",
             kind: {:oneof, :node},
             label: :optional,
             name: :null_test,
             tag: 37,
             type: {:message, PgQuery.NullTest}
           }}
        end

        def field_def("nullTest") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nullTest",
             kind: {:oneof, :node},
             label: :optional,
             name: :null_test,
             tag: 37,
             type: {:message, PgQuery.NullTest}
           }}
        end

        def field_def("null_test") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nullTest",
             kind: {:oneof, :node},
             label: :optional,
             name: :null_test,
             tag: 37,
             type: {:message, PgQuery.NullTest}
           }}
        end
      ),
      (
        def field_def(:boolean_test) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "booleanTest",
             kind: {:oneof, :node},
             label: :optional,
             name: :boolean_test,
             tag: 38,
             type: {:message, PgQuery.BooleanTest}
           }}
        end

        def field_def("booleanTest") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "booleanTest",
             kind: {:oneof, :node},
             label: :optional,
             name: :boolean_test,
             tag: 38,
             type: {:message, PgQuery.BooleanTest}
           }}
        end

        def field_def("boolean_test") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "booleanTest",
             kind: {:oneof, :node},
             label: :optional,
             name: :boolean_test,
             tag: 38,
             type: {:message, PgQuery.BooleanTest}
           }}
        end
      ),
      (
        def field_def(:coerce_to_domain) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coerceToDomain",
             kind: {:oneof, :node},
             label: :optional,
             name: :coerce_to_domain,
             tag: 39,
             type: {:message, PgQuery.CoerceToDomain}
           }}
        end

        def field_def("coerceToDomain") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coerceToDomain",
             kind: {:oneof, :node},
             label: :optional,
             name: :coerce_to_domain,
             tag: 39,
             type: {:message, PgQuery.CoerceToDomain}
           }}
        end

        def field_def("coerce_to_domain") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coerceToDomain",
             kind: {:oneof, :node},
             label: :optional,
             name: :coerce_to_domain,
             tag: 39,
             type: {:message, PgQuery.CoerceToDomain}
           }}
        end
      ),
      (
        def field_def(:coerce_to_domain_value) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coerceToDomainValue",
             kind: {:oneof, :node},
             label: :optional,
             name: :coerce_to_domain_value,
             tag: 40,
             type: {:message, PgQuery.CoerceToDomainValue}
           }}
        end

        def field_def("coerceToDomainValue") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coerceToDomainValue",
             kind: {:oneof, :node},
             label: :optional,
             name: :coerce_to_domain_value,
             tag: 40,
             type: {:message, PgQuery.CoerceToDomainValue}
           }}
        end

        def field_def("coerce_to_domain_value") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coerceToDomainValue",
             kind: {:oneof, :node},
             label: :optional,
             name: :coerce_to_domain_value,
             tag: 40,
             type: {:message, PgQuery.CoerceToDomainValue}
           }}
        end
      ),
      (
        def field_def(:set_to_default) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "setToDefault",
             kind: {:oneof, :node},
             label: :optional,
             name: :set_to_default,
             tag: 41,
             type: {:message, PgQuery.SetToDefault}
           }}
        end

        def field_def("setToDefault") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "setToDefault",
             kind: {:oneof, :node},
             label: :optional,
             name: :set_to_default,
             tag: 41,
             type: {:message, PgQuery.SetToDefault}
           }}
        end

        def field_def("set_to_default") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "setToDefault",
             kind: {:oneof, :node},
             label: :optional,
             name: :set_to_default,
             tag: 41,
             type: {:message, PgQuery.SetToDefault}
           }}
        end
      ),
      (
        def field_def(:current_of_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currentOfExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :current_of_expr,
             tag: 42,
             type: {:message, PgQuery.CurrentOfExpr}
           }}
        end

        def field_def("currentOfExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currentOfExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :current_of_expr,
             tag: 42,
             type: {:message, PgQuery.CurrentOfExpr}
           }}
        end

        def field_def("current_of_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currentOfExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :current_of_expr,
             tag: 42,
             type: {:message, PgQuery.CurrentOfExpr}
           }}
        end
      ),
      (
        def field_def(:next_value_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nextValueExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :next_value_expr,
             tag: 43,
             type: {:message, PgQuery.NextValueExpr}
           }}
        end

        def field_def("nextValueExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nextValueExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :next_value_expr,
             tag: 43,
             type: {:message, PgQuery.NextValueExpr}
           }}
        end

        def field_def("next_value_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nextValueExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :next_value_expr,
             tag: 43,
             type: {:message, PgQuery.NextValueExpr}
           }}
        end
      ),
      (
        def field_def(:inference_elem) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inferenceElem",
             kind: {:oneof, :node},
             label: :optional,
             name: :inference_elem,
             tag: 44,
             type: {:message, PgQuery.InferenceElem}
           }}
        end

        def field_def("inferenceElem") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inferenceElem",
             kind: {:oneof, :node},
             label: :optional,
             name: :inference_elem,
             tag: 44,
             type: {:message, PgQuery.InferenceElem}
           }}
        end

        def field_def("inference_elem") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inferenceElem",
             kind: {:oneof, :node},
             label: :optional,
             name: :inference_elem,
             tag: 44,
             type: {:message, PgQuery.InferenceElem}
           }}
        end
      ),
      (
        def field_def(:target_entry) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "targetEntry",
             kind: {:oneof, :node},
             label: :optional,
             name: :target_entry,
             tag: 45,
             type: {:message, PgQuery.TargetEntry}
           }}
        end

        def field_def("targetEntry") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "targetEntry",
             kind: {:oneof, :node},
             label: :optional,
             name: :target_entry,
             tag: 45,
             type: {:message, PgQuery.TargetEntry}
           }}
        end

        def field_def("target_entry") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "targetEntry",
             kind: {:oneof, :node},
             label: :optional,
             name: :target_entry,
             tag: 45,
             type: {:message, PgQuery.TargetEntry}
           }}
        end
      ),
      (
        def field_def(:range_tbl_ref) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeTblRef",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_tbl_ref,
             tag: 46,
             type: {:message, PgQuery.RangeTblRef}
           }}
        end

        def field_def("rangeTblRef") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeTblRef",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_tbl_ref,
             tag: 46,
             type: {:message, PgQuery.RangeTblRef}
           }}
        end

        def field_def("range_tbl_ref") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeTblRef",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_tbl_ref,
             tag: 46,
             type: {:message, PgQuery.RangeTblRef}
           }}
        end
      ),
      (
        def field_def(:join_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "joinExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :join_expr,
             tag: 47,
             type: {:message, PgQuery.JoinExpr}
           }}
        end

        def field_def("joinExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "joinExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :join_expr,
             tag: 47,
             type: {:message, PgQuery.JoinExpr}
           }}
        end

        def field_def("join_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "joinExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :join_expr,
             tag: 47,
             type: {:message, PgQuery.JoinExpr}
           }}
        end
      ),
      (
        def field_def(:from_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fromExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :from_expr,
             tag: 48,
             type: {:message, PgQuery.FromExpr}
           }}
        end

        def field_def("fromExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fromExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :from_expr,
             tag: 48,
             type: {:message, PgQuery.FromExpr}
           }}
        end

        def field_def("from_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fromExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :from_expr,
             tag: 48,
             type: {:message, PgQuery.FromExpr}
           }}
        end
      ),
      (
        def field_def(:on_conflict_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onConflictExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :on_conflict_expr,
             tag: 49,
             type: {:message, PgQuery.OnConflictExpr}
           }}
        end

        def field_def("onConflictExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onConflictExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :on_conflict_expr,
             tag: 49,
             type: {:message, PgQuery.OnConflictExpr}
           }}
        end

        def field_def("on_conflict_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onConflictExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :on_conflict_expr,
             tag: 49,
             type: {:message, PgQuery.OnConflictExpr}
           }}
        end
      ),
      (
        def field_def(:into_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "intoClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :into_clause,
             tag: 50,
             type: {:message, PgQuery.IntoClause}
           }}
        end

        def field_def("intoClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "intoClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :into_clause,
             tag: 50,
             type: {:message, PgQuery.IntoClause}
           }}
        end

        def field_def("into_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "intoClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :into_clause,
             tag: 50,
             type: {:message, PgQuery.IntoClause}
           }}
        end
      ),
      (
        def field_def(:merge_action) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mergeAction",
             kind: {:oneof, :node},
             label: :optional,
             name: :merge_action,
             tag: 51,
             type: {:message, PgQuery.MergeAction}
           }}
        end

        def field_def("mergeAction") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mergeAction",
             kind: {:oneof, :node},
             label: :optional,
             name: :merge_action,
             tag: 51,
             type: {:message, PgQuery.MergeAction}
           }}
        end

        def field_def("merge_action") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mergeAction",
             kind: {:oneof, :node},
             label: :optional,
             name: :merge_action,
             tag: 51,
             type: {:message, PgQuery.MergeAction}
           }}
        end
      ),
      (
        def field_def(:raw_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rawStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :raw_stmt,
             tag: 52,
             type: {:message, PgQuery.RawStmt}
           }}
        end

        def field_def("rawStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rawStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :raw_stmt,
             tag: 52,
             type: {:message, PgQuery.RawStmt}
           }}
        end

        def field_def("raw_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rawStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :raw_stmt,
             tag: 52,
             type: {:message, PgQuery.RawStmt}
           }}
        end
      ),
      (
        def field_def(:query) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "query",
             kind: {:oneof, :node},
             label: :optional,
             name: :query,
             tag: 53,
             type: {:message, PgQuery.Query}
           }}
        end

        def field_def("query") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "query",
             kind: {:oneof, :node},
             label: :optional,
             name: :query,
             tag: 53,
             type: {:message, PgQuery.Query}
           }}
        end

        []
      ),
      (
        def field_def(:insert_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "insertStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :insert_stmt,
             tag: 54,
             type: {:message, PgQuery.InsertStmt}
           }}
        end

        def field_def("insertStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "insertStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :insert_stmt,
             tag: 54,
             type: {:message, PgQuery.InsertStmt}
           }}
        end

        def field_def("insert_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "insertStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :insert_stmt,
             tag: 54,
             type: {:message, PgQuery.InsertStmt}
           }}
        end
      ),
      (
        def field_def(:delete_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "deleteStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :delete_stmt,
             tag: 55,
             type: {:message, PgQuery.DeleteStmt}
           }}
        end

        def field_def("deleteStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "deleteStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :delete_stmt,
             tag: 55,
             type: {:message, PgQuery.DeleteStmt}
           }}
        end

        def field_def("delete_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "deleteStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :delete_stmt,
             tag: 55,
             type: {:message, PgQuery.DeleteStmt}
           }}
        end
      ),
      (
        def field_def(:update_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "updateStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :update_stmt,
             tag: 56,
             type: {:message, PgQuery.UpdateStmt}
           }}
        end

        def field_def("updateStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "updateStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :update_stmt,
             tag: 56,
             type: {:message, PgQuery.UpdateStmt}
           }}
        end

        def field_def("update_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "updateStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :update_stmt,
             tag: 56,
             type: {:message, PgQuery.UpdateStmt}
           }}
        end
      ),
      (
        def field_def(:merge_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mergeStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :merge_stmt,
             tag: 57,
             type: {:message, PgQuery.MergeStmt}
           }}
        end

        def field_def("mergeStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mergeStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :merge_stmt,
             tag: 57,
             type: {:message, PgQuery.MergeStmt}
           }}
        end

        def field_def("merge_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mergeStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :merge_stmt,
             tag: 57,
             type: {:message, PgQuery.MergeStmt}
           }}
        end
      ),
      (
        def field_def(:select_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "selectStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :select_stmt,
             tag: 58,
             type: {:message, PgQuery.SelectStmt}
           }}
        end

        def field_def("selectStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "selectStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :select_stmt,
             tag: 58,
             type: {:message, PgQuery.SelectStmt}
           }}
        end

        def field_def("select_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "selectStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :select_stmt,
             tag: 58,
             type: {:message, PgQuery.SelectStmt}
           }}
        end
      ),
      (
        def field_def(:return_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returnStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :return_stmt,
             tag: 59,
             type: {:message, PgQuery.ReturnStmt}
           }}
        end

        def field_def("returnStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returnStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :return_stmt,
             tag: 59,
             type: {:message, PgQuery.ReturnStmt}
           }}
        end

        def field_def("return_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returnStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :return_stmt,
             tag: 59,
             type: {:message, PgQuery.ReturnStmt}
           }}
        end
      ),
      (
        def field_def(:plassign_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "plassignStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :plassign_stmt,
             tag: 60,
             type: {:message, PgQuery.PLAssignStmt}
           }}
        end

        def field_def("plassignStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "plassignStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :plassign_stmt,
             tag: 60,
             type: {:message, PgQuery.PLAssignStmt}
           }}
        end

        def field_def("plassign_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "plassignStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :plassign_stmt,
             tag: 60,
             type: {:message, PgQuery.PLAssignStmt}
           }}
        end
      ),
      (
        def field_def(:alter_table_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterTableStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_table_stmt,
             tag: 61,
             type: {:message, PgQuery.AlterTableStmt}
           }}
        end

        def field_def("alterTableStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterTableStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_table_stmt,
             tag: 61,
             type: {:message, PgQuery.AlterTableStmt}
           }}
        end

        def field_def("alter_table_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterTableStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_table_stmt,
             tag: 61,
             type: {:message, PgQuery.AlterTableStmt}
           }}
        end
      ),
      (
        def field_def(:alter_table_cmd) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterTableCmd",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_table_cmd,
             tag: 62,
             type: {:message, PgQuery.AlterTableCmd}
           }}
        end

        def field_def("alterTableCmd") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterTableCmd",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_table_cmd,
             tag: 62,
             type: {:message, PgQuery.AlterTableCmd}
           }}
        end

        def field_def("alter_table_cmd") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterTableCmd",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_table_cmd,
             tag: 62,
             type: {:message, PgQuery.AlterTableCmd}
           }}
        end
      ),
      (
        def field_def(:alter_domain_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterDomainStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_domain_stmt,
             tag: 63,
             type: {:message, PgQuery.AlterDomainStmt}
           }}
        end

        def field_def("alterDomainStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterDomainStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_domain_stmt,
             tag: 63,
             type: {:message, PgQuery.AlterDomainStmt}
           }}
        end

        def field_def("alter_domain_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterDomainStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_domain_stmt,
             tag: 63,
             type: {:message, PgQuery.AlterDomainStmt}
           }}
        end
      ),
      (
        def field_def(:set_operation_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "setOperationStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :set_operation_stmt,
             tag: 64,
             type: {:message, PgQuery.SetOperationStmt}
           }}
        end

        def field_def("setOperationStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "setOperationStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :set_operation_stmt,
             tag: 64,
             type: {:message, PgQuery.SetOperationStmt}
           }}
        end

        def field_def("set_operation_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "setOperationStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :set_operation_stmt,
             tag: 64,
             type: {:message, PgQuery.SetOperationStmt}
           }}
        end
      ),
      (
        def field_def(:grant_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "grantStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :grant_stmt,
             tag: 65,
             type: {:message, PgQuery.GrantStmt}
           }}
        end

        def field_def("grantStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "grantStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :grant_stmt,
             tag: 65,
             type: {:message, PgQuery.GrantStmt}
           }}
        end

        def field_def("grant_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "grantStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :grant_stmt,
             tag: 65,
             type: {:message, PgQuery.GrantStmt}
           }}
        end
      ),
      (
        def field_def(:grant_role_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "grantRoleStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :grant_role_stmt,
             tag: 66,
             type: {:message, PgQuery.GrantRoleStmt}
           }}
        end

        def field_def("grantRoleStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "grantRoleStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :grant_role_stmt,
             tag: 66,
             type: {:message, PgQuery.GrantRoleStmt}
           }}
        end

        def field_def("grant_role_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "grantRoleStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :grant_role_stmt,
             tag: 66,
             type: {:message, PgQuery.GrantRoleStmt}
           }}
        end
      ),
      (
        def field_def(:alter_default_privileges_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterDefaultPrivilegesStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_default_privileges_stmt,
             tag: 67,
             type: {:message, PgQuery.AlterDefaultPrivilegesStmt}
           }}
        end

        def field_def("alterDefaultPrivilegesStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterDefaultPrivilegesStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_default_privileges_stmt,
             tag: 67,
             type: {:message, PgQuery.AlterDefaultPrivilegesStmt}
           }}
        end

        def field_def("alter_default_privileges_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterDefaultPrivilegesStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_default_privileges_stmt,
             tag: 67,
             type: {:message, PgQuery.AlterDefaultPrivilegesStmt}
           }}
        end
      ),
      (
        def field_def(:close_portal_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "closePortalStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :close_portal_stmt,
             tag: 68,
             type: {:message, PgQuery.ClosePortalStmt}
           }}
        end

        def field_def("closePortalStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "closePortalStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :close_portal_stmt,
             tag: 68,
             type: {:message, PgQuery.ClosePortalStmt}
           }}
        end

        def field_def("close_portal_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "closePortalStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :close_portal_stmt,
             tag: 68,
             type: {:message, PgQuery.ClosePortalStmt}
           }}
        end
      ),
      (
        def field_def(:cluster_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clusterStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :cluster_stmt,
             tag: 69,
             type: {:message, PgQuery.ClusterStmt}
           }}
        end

        def field_def("clusterStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clusterStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :cluster_stmt,
             tag: 69,
             type: {:message, PgQuery.ClusterStmt}
           }}
        end

        def field_def("cluster_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clusterStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :cluster_stmt,
             tag: 69,
             type: {:message, PgQuery.ClusterStmt}
           }}
        end
      ),
      (
        def field_def(:copy_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "copyStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :copy_stmt,
             tag: 70,
             type: {:message, PgQuery.CopyStmt}
           }}
        end

        def field_def("copyStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "copyStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :copy_stmt,
             tag: 70,
             type: {:message, PgQuery.CopyStmt}
           }}
        end

        def field_def("copy_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "copyStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :copy_stmt,
             tag: 70,
             type: {:message, PgQuery.CopyStmt}
           }}
        end
      ),
      (
        def field_def(:create_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_stmt,
             tag: 71,
             type: {:message, PgQuery.CreateStmt}
           }}
        end

        def field_def("createStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_stmt,
             tag: 71,
             type: {:message, PgQuery.CreateStmt}
           }}
        end

        def field_def("create_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_stmt,
             tag: 71,
             type: {:message, PgQuery.CreateStmt}
           }}
        end
      ),
      (
        def field_def(:define_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "defineStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :define_stmt,
             tag: 72,
             type: {:message, PgQuery.DefineStmt}
           }}
        end

        def field_def("defineStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "defineStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :define_stmt,
             tag: 72,
             type: {:message, PgQuery.DefineStmt}
           }}
        end

        def field_def("define_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "defineStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :define_stmt,
             tag: 72,
             type: {:message, PgQuery.DefineStmt}
           }}
        end
      ),
      (
        def field_def(:drop_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dropStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :drop_stmt,
             tag: 73,
             type: {:message, PgQuery.DropStmt}
           }}
        end

        def field_def("dropStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dropStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :drop_stmt,
             tag: 73,
             type: {:message, PgQuery.DropStmt}
           }}
        end

        def field_def("drop_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dropStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :drop_stmt,
             tag: 73,
             type: {:message, PgQuery.DropStmt}
           }}
        end
      ),
      (
        def field_def(:truncate_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "truncateStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :truncate_stmt,
             tag: 74,
             type: {:message, PgQuery.TruncateStmt}
           }}
        end

        def field_def("truncateStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "truncateStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :truncate_stmt,
             tag: 74,
             type: {:message, PgQuery.TruncateStmt}
           }}
        end

        def field_def("truncate_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "truncateStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :truncate_stmt,
             tag: 74,
             type: {:message, PgQuery.TruncateStmt}
           }}
        end
      ),
      (
        def field_def(:comment_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commentStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :comment_stmt,
             tag: 75,
             type: {:message, PgQuery.CommentStmt}
           }}
        end

        def field_def("commentStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commentStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :comment_stmt,
             tag: 75,
             type: {:message, PgQuery.CommentStmt}
           }}
        end

        def field_def("comment_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commentStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :comment_stmt,
             tag: 75,
             type: {:message, PgQuery.CommentStmt}
           }}
        end
      ),
      (
        def field_def(:fetch_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fetchStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :fetch_stmt,
             tag: 76,
             type: {:message, PgQuery.FetchStmt}
           }}
        end

        def field_def("fetchStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fetchStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :fetch_stmt,
             tag: 76,
             type: {:message, PgQuery.FetchStmt}
           }}
        end

        def field_def("fetch_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fetchStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :fetch_stmt,
             tag: 76,
             type: {:message, PgQuery.FetchStmt}
           }}
        end
      ),
      (
        def field_def(:index_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :index_stmt,
             tag: 77,
             type: {:message, PgQuery.IndexStmt}
           }}
        end

        def field_def("indexStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :index_stmt,
             tag: 77,
             type: {:message, PgQuery.IndexStmt}
           }}
        end

        def field_def("index_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :index_stmt,
             tag: 77,
             type: {:message, PgQuery.IndexStmt}
           }}
        end
      ),
      (
        def field_def(:create_function_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createFunctionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_function_stmt,
             tag: 78,
             type: {:message, PgQuery.CreateFunctionStmt}
           }}
        end

        def field_def("createFunctionStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createFunctionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_function_stmt,
             tag: 78,
             type: {:message, PgQuery.CreateFunctionStmt}
           }}
        end

        def field_def("create_function_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createFunctionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_function_stmt,
             tag: 78,
             type: {:message, PgQuery.CreateFunctionStmt}
           }}
        end
      ),
      (
        def field_def(:alter_function_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterFunctionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_function_stmt,
             tag: 79,
             type: {:message, PgQuery.AlterFunctionStmt}
           }}
        end

        def field_def("alterFunctionStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterFunctionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_function_stmt,
             tag: 79,
             type: {:message, PgQuery.AlterFunctionStmt}
           }}
        end

        def field_def("alter_function_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterFunctionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_function_stmt,
             tag: 79,
             type: {:message, PgQuery.AlterFunctionStmt}
           }}
        end
      ),
      (
        def field_def(:do_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "doStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :do_stmt,
             tag: 80,
             type: {:message, PgQuery.DoStmt}
           }}
        end

        def field_def("doStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "doStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :do_stmt,
             tag: 80,
             type: {:message, PgQuery.DoStmt}
           }}
        end

        def field_def("do_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "doStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :do_stmt,
             tag: 80,
             type: {:message, PgQuery.DoStmt}
           }}
        end
      ),
      (
        def field_def(:rename_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "renameStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :rename_stmt,
             tag: 81,
             type: {:message, PgQuery.RenameStmt}
           }}
        end

        def field_def("renameStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "renameStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :rename_stmt,
             tag: 81,
             type: {:message, PgQuery.RenameStmt}
           }}
        end

        def field_def("rename_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "renameStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :rename_stmt,
             tag: 81,
             type: {:message, PgQuery.RenameStmt}
           }}
        end
      ),
      (
        def field_def(:rule_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ruleStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :rule_stmt,
             tag: 82,
             type: {:message, PgQuery.RuleStmt}
           }}
        end

        def field_def("ruleStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ruleStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :rule_stmt,
             tag: 82,
             type: {:message, PgQuery.RuleStmt}
           }}
        end

        def field_def("rule_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ruleStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :rule_stmt,
             tag: 82,
             type: {:message, PgQuery.RuleStmt}
           }}
        end
      ),
      (
        def field_def(:notify_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "notifyStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :notify_stmt,
             tag: 83,
             type: {:message, PgQuery.NotifyStmt}
           }}
        end

        def field_def("notifyStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "notifyStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :notify_stmt,
             tag: 83,
             type: {:message, PgQuery.NotifyStmt}
           }}
        end

        def field_def("notify_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "notifyStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :notify_stmt,
             tag: 83,
             type: {:message, PgQuery.NotifyStmt}
           }}
        end
      ),
      (
        def field_def(:listen_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "listenStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :listen_stmt,
             tag: 84,
             type: {:message, PgQuery.ListenStmt}
           }}
        end

        def field_def("listenStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "listenStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :listen_stmt,
             tag: 84,
             type: {:message, PgQuery.ListenStmt}
           }}
        end

        def field_def("listen_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "listenStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :listen_stmt,
             tag: 84,
             type: {:message, PgQuery.ListenStmt}
           }}
        end
      ),
      (
        def field_def(:unlisten_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "unlistenStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :unlisten_stmt,
             tag: 85,
             type: {:message, PgQuery.UnlistenStmt}
           }}
        end

        def field_def("unlistenStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "unlistenStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :unlisten_stmt,
             tag: 85,
             type: {:message, PgQuery.UnlistenStmt}
           }}
        end

        def field_def("unlisten_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "unlistenStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :unlisten_stmt,
             tag: 85,
             type: {:message, PgQuery.UnlistenStmt}
           }}
        end
      ),
      (
        def field_def(:transaction_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "transactionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :transaction_stmt,
             tag: 86,
             type: {:message, PgQuery.TransactionStmt}
           }}
        end

        def field_def("transactionStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "transactionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :transaction_stmt,
             tag: 86,
             type: {:message, PgQuery.TransactionStmt}
           }}
        end

        def field_def("transaction_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "transactionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :transaction_stmt,
             tag: 86,
             type: {:message, PgQuery.TransactionStmt}
           }}
        end
      ),
      (
        def field_def(:view_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "viewStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :view_stmt,
             tag: 87,
             type: {:message, PgQuery.ViewStmt}
           }}
        end

        def field_def("viewStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "viewStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :view_stmt,
             tag: 87,
             type: {:message, PgQuery.ViewStmt}
           }}
        end

        def field_def("view_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "viewStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :view_stmt,
             tag: 87,
             type: {:message, PgQuery.ViewStmt}
           }}
        end
      ),
      (
        def field_def(:load_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "loadStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :load_stmt,
             tag: 88,
             type: {:message, PgQuery.LoadStmt}
           }}
        end

        def field_def("loadStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "loadStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :load_stmt,
             tag: 88,
             type: {:message, PgQuery.LoadStmt}
           }}
        end

        def field_def("load_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "loadStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :load_stmt,
             tag: 88,
             type: {:message, PgQuery.LoadStmt}
           }}
        end
      ),
      (
        def field_def(:create_domain_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createDomainStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_domain_stmt,
             tag: 89,
             type: {:message, PgQuery.CreateDomainStmt}
           }}
        end

        def field_def("createDomainStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createDomainStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_domain_stmt,
             tag: 89,
             type: {:message, PgQuery.CreateDomainStmt}
           }}
        end

        def field_def("create_domain_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createDomainStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_domain_stmt,
             tag: 89,
             type: {:message, PgQuery.CreateDomainStmt}
           }}
        end
      ),
      (
        def field_def(:createdb_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createdbStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :createdb_stmt,
             tag: 90,
             type: {:message, PgQuery.CreatedbStmt}
           }}
        end

        def field_def("createdbStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createdbStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :createdb_stmt,
             tag: 90,
             type: {:message, PgQuery.CreatedbStmt}
           }}
        end

        def field_def("createdb_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createdbStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :createdb_stmt,
             tag: 90,
             type: {:message, PgQuery.CreatedbStmt}
           }}
        end
      ),
      (
        def field_def(:dropdb_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dropdbStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :dropdb_stmt,
             tag: 91,
             type: {:message, PgQuery.DropdbStmt}
           }}
        end

        def field_def("dropdbStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dropdbStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :dropdb_stmt,
             tag: 91,
             type: {:message, PgQuery.DropdbStmt}
           }}
        end

        def field_def("dropdb_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dropdbStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :dropdb_stmt,
             tag: 91,
             type: {:message, PgQuery.DropdbStmt}
           }}
        end
      ),
      (
        def field_def(:vacuum_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "vacuumStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :vacuum_stmt,
             tag: 92,
             type: {:message, PgQuery.VacuumStmt}
           }}
        end

        def field_def("vacuumStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "vacuumStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :vacuum_stmt,
             tag: 92,
             type: {:message, PgQuery.VacuumStmt}
           }}
        end

        def field_def("vacuum_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "vacuumStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :vacuum_stmt,
             tag: 92,
             type: {:message, PgQuery.VacuumStmt}
           }}
        end
      ),
      (
        def field_def(:explain_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "explainStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :explain_stmt,
             tag: 93,
             type: {:message, PgQuery.ExplainStmt}
           }}
        end

        def field_def("explainStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "explainStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :explain_stmt,
             tag: 93,
             type: {:message, PgQuery.ExplainStmt}
           }}
        end

        def field_def("explain_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "explainStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :explain_stmt,
             tag: 93,
             type: {:message, PgQuery.ExplainStmt}
           }}
        end
      ),
      (
        def field_def(:create_table_as_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTableAsStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_table_as_stmt,
             tag: 94,
             type: {:message, PgQuery.CreateTableAsStmt}
           }}
        end

        def field_def("createTableAsStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTableAsStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_table_as_stmt,
             tag: 94,
             type: {:message, PgQuery.CreateTableAsStmt}
           }}
        end

        def field_def("create_table_as_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTableAsStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_table_as_stmt,
             tag: 94,
             type: {:message, PgQuery.CreateTableAsStmt}
           }}
        end
      ),
      (
        def field_def(:create_seq_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createSeqStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_seq_stmt,
             tag: 95,
             type: {:message, PgQuery.CreateSeqStmt}
           }}
        end

        def field_def("createSeqStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createSeqStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_seq_stmt,
             tag: 95,
             type: {:message, PgQuery.CreateSeqStmt}
           }}
        end

        def field_def("create_seq_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createSeqStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_seq_stmt,
             tag: 95,
             type: {:message, PgQuery.CreateSeqStmt}
           }}
        end
      ),
      (
        def field_def(:alter_seq_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterSeqStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_seq_stmt,
             tag: 96,
             type: {:message, PgQuery.AlterSeqStmt}
           }}
        end

        def field_def("alterSeqStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterSeqStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_seq_stmt,
             tag: 96,
             type: {:message, PgQuery.AlterSeqStmt}
           }}
        end

        def field_def("alter_seq_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterSeqStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_seq_stmt,
             tag: 96,
             type: {:message, PgQuery.AlterSeqStmt}
           }}
        end
      ),
      (
        def field_def(:variable_set_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "variableSetStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :variable_set_stmt,
             tag: 97,
             type: {:message, PgQuery.VariableSetStmt}
           }}
        end

        def field_def("variableSetStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "variableSetStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :variable_set_stmt,
             tag: 97,
             type: {:message, PgQuery.VariableSetStmt}
           }}
        end

        def field_def("variable_set_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "variableSetStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :variable_set_stmt,
             tag: 97,
             type: {:message, PgQuery.VariableSetStmt}
           }}
        end
      ),
      (
        def field_def(:variable_show_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "variableShowStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :variable_show_stmt,
             tag: 98,
             type: {:message, PgQuery.VariableShowStmt}
           }}
        end

        def field_def("variableShowStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "variableShowStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :variable_show_stmt,
             tag: 98,
             type: {:message, PgQuery.VariableShowStmt}
           }}
        end

        def field_def("variable_show_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "variableShowStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :variable_show_stmt,
             tag: 98,
             type: {:message, PgQuery.VariableShowStmt}
           }}
        end
      ),
      (
        def field_def(:discard_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "discardStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :discard_stmt,
             tag: 99,
             type: {:message, PgQuery.DiscardStmt}
           }}
        end

        def field_def("discardStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "discardStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :discard_stmt,
             tag: 99,
             type: {:message, PgQuery.DiscardStmt}
           }}
        end

        def field_def("discard_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "discardStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :discard_stmt,
             tag: 99,
             type: {:message, PgQuery.DiscardStmt}
           }}
        end
      ),
      (
        def field_def(:create_trig_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTrigStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_trig_stmt,
             tag: 100,
             type: {:message, PgQuery.CreateTrigStmt}
           }}
        end

        def field_def("createTrigStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTrigStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_trig_stmt,
             tag: 100,
             type: {:message, PgQuery.CreateTrigStmt}
           }}
        end

        def field_def("create_trig_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTrigStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_trig_stmt,
             tag: 100,
             type: {:message, PgQuery.CreateTrigStmt}
           }}
        end
      ),
      (
        def field_def(:create_plang_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createPlangStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_plang_stmt,
             tag: 101,
             type: {:message, PgQuery.CreatePLangStmt}
           }}
        end

        def field_def("createPlangStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createPlangStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_plang_stmt,
             tag: 101,
             type: {:message, PgQuery.CreatePLangStmt}
           }}
        end

        def field_def("create_plang_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createPlangStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_plang_stmt,
             tag: 101,
             type: {:message, PgQuery.CreatePLangStmt}
           }}
        end
      ),
      (
        def field_def(:create_role_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createRoleStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_role_stmt,
             tag: 102,
             type: {:message, PgQuery.CreateRoleStmt}
           }}
        end

        def field_def("createRoleStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createRoleStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_role_stmt,
             tag: 102,
             type: {:message, PgQuery.CreateRoleStmt}
           }}
        end

        def field_def("create_role_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createRoleStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_role_stmt,
             tag: 102,
             type: {:message, PgQuery.CreateRoleStmt}
           }}
        end
      ),
      (
        def field_def(:alter_role_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterRoleStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_role_stmt,
             tag: 103,
             type: {:message, PgQuery.AlterRoleStmt}
           }}
        end

        def field_def("alterRoleStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterRoleStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_role_stmt,
             tag: 103,
             type: {:message, PgQuery.AlterRoleStmt}
           }}
        end

        def field_def("alter_role_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterRoleStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_role_stmt,
             tag: 103,
             type: {:message, PgQuery.AlterRoleStmt}
           }}
        end
      ),
      (
        def field_def(:drop_role_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dropRoleStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :drop_role_stmt,
             tag: 104,
             type: {:message, PgQuery.DropRoleStmt}
           }}
        end

        def field_def("dropRoleStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dropRoleStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :drop_role_stmt,
             tag: 104,
             type: {:message, PgQuery.DropRoleStmt}
           }}
        end

        def field_def("drop_role_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dropRoleStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :drop_role_stmt,
             tag: 104,
             type: {:message, PgQuery.DropRoleStmt}
           }}
        end
      ),
      (
        def field_def(:lock_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lockStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :lock_stmt,
             tag: 105,
             type: {:message, PgQuery.LockStmt}
           }}
        end

        def field_def("lockStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lockStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :lock_stmt,
             tag: 105,
             type: {:message, PgQuery.LockStmt}
           }}
        end

        def field_def("lock_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lockStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :lock_stmt,
             tag: 105,
             type: {:message, PgQuery.LockStmt}
           }}
        end
      ),
      (
        def field_def(:constraints_set_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "constraintsSetStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :constraints_set_stmt,
             tag: 106,
             type: {:message, PgQuery.ConstraintsSetStmt}
           }}
        end

        def field_def("constraintsSetStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "constraintsSetStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :constraints_set_stmt,
             tag: 106,
             type: {:message, PgQuery.ConstraintsSetStmt}
           }}
        end

        def field_def("constraints_set_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "constraintsSetStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :constraints_set_stmt,
             tag: 106,
             type: {:message, PgQuery.ConstraintsSetStmt}
           }}
        end
      ),
      (
        def field_def(:reindex_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reindexStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :reindex_stmt,
             tag: 107,
             type: {:message, PgQuery.ReindexStmt}
           }}
        end

        def field_def("reindexStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reindexStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :reindex_stmt,
             tag: 107,
             type: {:message, PgQuery.ReindexStmt}
           }}
        end

        def field_def("reindex_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reindexStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :reindex_stmt,
             tag: 107,
             type: {:message, PgQuery.ReindexStmt}
           }}
        end
      ),
      (
        def field_def(:check_point_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "checkPointStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :check_point_stmt,
             tag: 108,
             type: {:message, PgQuery.CheckPointStmt}
           }}
        end

        def field_def("checkPointStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "checkPointStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :check_point_stmt,
             tag: 108,
             type: {:message, PgQuery.CheckPointStmt}
           }}
        end

        def field_def("check_point_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "checkPointStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :check_point_stmt,
             tag: 108,
             type: {:message, PgQuery.CheckPointStmt}
           }}
        end
      ),
      (
        def field_def(:create_schema_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createSchemaStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_schema_stmt,
             tag: 109,
             type: {:message, PgQuery.CreateSchemaStmt}
           }}
        end

        def field_def("createSchemaStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createSchemaStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_schema_stmt,
             tag: 109,
             type: {:message, PgQuery.CreateSchemaStmt}
           }}
        end

        def field_def("create_schema_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createSchemaStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_schema_stmt,
             tag: 109,
             type: {:message, PgQuery.CreateSchemaStmt}
           }}
        end
      ),
      (
        def field_def(:alter_database_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterDatabaseStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_database_stmt,
             tag: 110,
             type: {:message, PgQuery.AlterDatabaseStmt}
           }}
        end

        def field_def("alterDatabaseStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterDatabaseStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_database_stmt,
             tag: 110,
             type: {:message, PgQuery.AlterDatabaseStmt}
           }}
        end

        def field_def("alter_database_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterDatabaseStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_database_stmt,
             tag: 110,
             type: {:message, PgQuery.AlterDatabaseStmt}
           }}
        end
      ),
      (
        def field_def(:alter_database_refresh_coll_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterDatabaseRefreshCollStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_database_refresh_coll_stmt,
             tag: 111,
             type: {:message, PgQuery.AlterDatabaseRefreshCollStmt}
           }}
        end

        def field_def("alterDatabaseRefreshCollStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterDatabaseRefreshCollStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_database_refresh_coll_stmt,
             tag: 111,
             type: {:message, PgQuery.AlterDatabaseRefreshCollStmt}
           }}
        end

        def field_def("alter_database_refresh_coll_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterDatabaseRefreshCollStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_database_refresh_coll_stmt,
             tag: 111,
             type: {:message, PgQuery.AlterDatabaseRefreshCollStmt}
           }}
        end
      ),
      (
        def field_def(:alter_database_set_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterDatabaseSetStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_database_set_stmt,
             tag: 112,
             type: {:message, PgQuery.AlterDatabaseSetStmt}
           }}
        end

        def field_def("alterDatabaseSetStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterDatabaseSetStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_database_set_stmt,
             tag: 112,
             type: {:message, PgQuery.AlterDatabaseSetStmt}
           }}
        end

        def field_def("alter_database_set_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterDatabaseSetStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_database_set_stmt,
             tag: 112,
             type: {:message, PgQuery.AlterDatabaseSetStmt}
           }}
        end
      ),
      (
        def field_def(:alter_role_set_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterRoleSetStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_role_set_stmt,
             tag: 113,
             type: {:message, PgQuery.AlterRoleSetStmt}
           }}
        end

        def field_def("alterRoleSetStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterRoleSetStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_role_set_stmt,
             tag: 113,
             type: {:message, PgQuery.AlterRoleSetStmt}
           }}
        end

        def field_def("alter_role_set_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterRoleSetStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_role_set_stmt,
             tag: 113,
             type: {:message, PgQuery.AlterRoleSetStmt}
           }}
        end
      ),
      (
        def field_def(:create_conversion_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createConversionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_conversion_stmt,
             tag: 114,
             type: {:message, PgQuery.CreateConversionStmt}
           }}
        end

        def field_def("createConversionStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createConversionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_conversion_stmt,
             tag: 114,
             type: {:message, PgQuery.CreateConversionStmt}
           }}
        end

        def field_def("create_conversion_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createConversionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_conversion_stmt,
             tag: 114,
             type: {:message, PgQuery.CreateConversionStmt}
           }}
        end
      ),
      (
        def field_def(:create_cast_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createCastStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_cast_stmt,
             tag: 115,
             type: {:message, PgQuery.CreateCastStmt}
           }}
        end

        def field_def("createCastStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createCastStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_cast_stmt,
             tag: 115,
             type: {:message, PgQuery.CreateCastStmt}
           }}
        end

        def field_def("create_cast_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createCastStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_cast_stmt,
             tag: 115,
             type: {:message, PgQuery.CreateCastStmt}
           }}
        end
      ),
      (
        def field_def(:create_op_class_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createOpClassStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_op_class_stmt,
             tag: 116,
             type: {:message, PgQuery.CreateOpClassStmt}
           }}
        end

        def field_def("createOpClassStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createOpClassStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_op_class_stmt,
             tag: 116,
             type: {:message, PgQuery.CreateOpClassStmt}
           }}
        end

        def field_def("create_op_class_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createOpClassStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_op_class_stmt,
             tag: 116,
             type: {:message, PgQuery.CreateOpClassStmt}
           }}
        end
      ),
      (
        def field_def(:create_op_family_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createOpFamilyStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_op_family_stmt,
             tag: 117,
             type: {:message, PgQuery.CreateOpFamilyStmt}
           }}
        end

        def field_def("createOpFamilyStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createOpFamilyStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_op_family_stmt,
             tag: 117,
             type: {:message, PgQuery.CreateOpFamilyStmt}
           }}
        end

        def field_def("create_op_family_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createOpFamilyStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_op_family_stmt,
             tag: 117,
             type: {:message, PgQuery.CreateOpFamilyStmt}
           }}
        end
      ),
      (
        def field_def(:alter_op_family_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterOpFamilyStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_op_family_stmt,
             tag: 118,
             type: {:message, PgQuery.AlterOpFamilyStmt}
           }}
        end

        def field_def("alterOpFamilyStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterOpFamilyStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_op_family_stmt,
             tag: 118,
             type: {:message, PgQuery.AlterOpFamilyStmt}
           }}
        end

        def field_def("alter_op_family_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterOpFamilyStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_op_family_stmt,
             tag: 118,
             type: {:message, PgQuery.AlterOpFamilyStmt}
           }}
        end
      ),
      (
        def field_def(:prepare_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "prepareStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :prepare_stmt,
             tag: 119,
             type: {:message, PgQuery.PrepareStmt}
           }}
        end

        def field_def("prepareStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "prepareStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :prepare_stmt,
             tag: 119,
             type: {:message, PgQuery.PrepareStmt}
           }}
        end

        def field_def("prepare_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "prepareStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :prepare_stmt,
             tag: 119,
             type: {:message, PgQuery.PrepareStmt}
           }}
        end
      ),
      (
        def field_def(:execute_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "executeStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :execute_stmt,
             tag: 120,
             type: {:message, PgQuery.ExecuteStmt}
           }}
        end

        def field_def("executeStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "executeStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :execute_stmt,
             tag: 120,
             type: {:message, PgQuery.ExecuteStmt}
           }}
        end

        def field_def("execute_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "executeStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :execute_stmt,
             tag: 120,
             type: {:message, PgQuery.ExecuteStmt}
           }}
        end
      ),
      (
        def field_def(:deallocate_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "deallocateStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :deallocate_stmt,
             tag: 121,
             type: {:message, PgQuery.DeallocateStmt}
           }}
        end

        def field_def("deallocateStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "deallocateStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :deallocate_stmt,
             tag: 121,
             type: {:message, PgQuery.DeallocateStmt}
           }}
        end

        def field_def("deallocate_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "deallocateStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :deallocate_stmt,
             tag: 121,
             type: {:message, PgQuery.DeallocateStmt}
           }}
        end
      ),
      (
        def field_def(:declare_cursor_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "declareCursorStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :declare_cursor_stmt,
             tag: 122,
             type: {:message, PgQuery.DeclareCursorStmt}
           }}
        end

        def field_def("declareCursorStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "declareCursorStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :declare_cursor_stmt,
             tag: 122,
             type: {:message, PgQuery.DeclareCursorStmt}
           }}
        end

        def field_def("declare_cursor_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "declareCursorStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :declare_cursor_stmt,
             tag: 122,
             type: {:message, PgQuery.DeclareCursorStmt}
           }}
        end
      ),
      (
        def field_def(:create_table_space_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTableSpaceStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_table_space_stmt,
             tag: 123,
             type: {:message, PgQuery.CreateTableSpaceStmt}
           }}
        end

        def field_def("createTableSpaceStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTableSpaceStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_table_space_stmt,
             tag: 123,
             type: {:message, PgQuery.CreateTableSpaceStmt}
           }}
        end

        def field_def("create_table_space_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTableSpaceStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_table_space_stmt,
             tag: 123,
             type: {:message, PgQuery.CreateTableSpaceStmt}
           }}
        end
      ),
      (
        def field_def(:drop_table_space_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dropTableSpaceStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :drop_table_space_stmt,
             tag: 124,
             type: {:message, PgQuery.DropTableSpaceStmt}
           }}
        end

        def field_def("dropTableSpaceStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dropTableSpaceStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :drop_table_space_stmt,
             tag: 124,
             type: {:message, PgQuery.DropTableSpaceStmt}
           }}
        end

        def field_def("drop_table_space_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dropTableSpaceStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :drop_table_space_stmt,
             tag: 124,
             type: {:message, PgQuery.DropTableSpaceStmt}
           }}
        end
      ),
      (
        def field_def(:alter_object_depends_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterObjectDependsStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_object_depends_stmt,
             tag: 125,
             type: {:message, PgQuery.AlterObjectDependsStmt}
           }}
        end

        def field_def("alterObjectDependsStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterObjectDependsStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_object_depends_stmt,
             tag: 125,
             type: {:message, PgQuery.AlterObjectDependsStmt}
           }}
        end

        def field_def("alter_object_depends_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterObjectDependsStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_object_depends_stmt,
             tag: 125,
             type: {:message, PgQuery.AlterObjectDependsStmt}
           }}
        end
      ),
      (
        def field_def(:alter_object_schema_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterObjectSchemaStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_object_schema_stmt,
             tag: 126,
             type: {:message, PgQuery.AlterObjectSchemaStmt}
           }}
        end

        def field_def("alterObjectSchemaStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterObjectSchemaStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_object_schema_stmt,
             tag: 126,
             type: {:message, PgQuery.AlterObjectSchemaStmt}
           }}
        end

        def field_def("alter_object_schema_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterObjectSchemaStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_object_schema_stmt,
             tag: 126,
             type: {:message, PgQuery.AlterObjectSchemaStmt}
           }}
        end
      ),
      (
        def field_def(:alter_owner_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterOwnerStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_owner_stmt,
             tag: 127,
             type: {:message, PgQuery.AlterOwnerStmt}
           }}
        end

        def field_def("alterOwnerStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterOwnerStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_owner_stmt,
             tag: 127,
             type: {:message, PgQuery.AlterOwnerStmt}
           }}
        end

        def field_def("alter_owner_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterOwnerStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_owner_stmt,
             tag: 127,
             type: {:message, PgQuery.AlterOwnerStmt}
           }}
        end
      ),
      (
        def field_def(:alter_operator_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterOperatorStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_operator_stmt,
             tag: 128,
             type: {:message, PgQuery.AlterOperatorStmt}
           }}
        end

        def field_def("alterOperatorStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterOperatorStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_operator_stmt,
             tag: 128,
             type: {:message, PgQuery.AlterOperatorStmt}
           }}
        end

        def field_def("alter_operator_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterOperatorStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_operator_stmt,
             tag: 128,
             type: {:message, PgQuery.AlterOperatorStmt}
           }}
        end
      ),
      (
        def field_def(:alter_type_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterTypeStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_type_stmt,
             tag: 129,
             type: {:message, PgQuery.AlterTypeStmt}
           }}
        end

        def field_def("alterTypeStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterTypeStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_type_stmt,
             tag: 129,
             type: {:message, PgQuery.AlterTypeStmt}
           }}
        end

        def field_def("alter_type_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterTypeStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_type_stmt,
             tag: 129,
             type: {:message, PgQuery.AlterTypeStmt}
           }}
        end
      ),
      (
        def field_def(:drop_owned_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dropOwnedStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :drop_owned_stmt,
             tag: 130,
             type: {:message, PgQuery.DropOwnedStmt}
           }}
        end

        def field_def("dropOwnedStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dropOwnedStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :drop_owned_stmt,
             tag: 130,
             type: {:message, PgQuery.DropOwnedStmt}
           }}
        end

        def field_def("drop_owned_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dropOwnedStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :drop_owned_stmt,
             tag: 130,
             type: {:message, PgQuery.DropOwnedStmt}
           }}
        end
      ),
      (
        def field_def(:reassign_owned_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reassignOwnedStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :reassign_owned_stmt,
             tag: 131,
             type: {:message, PgQuery.ReassignOwnedStmt}
           }}
        end

        def field_def("reassignOwnedStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reassignOwnedStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :reassign_owned_stmt,
             tag: 131,
             type: {:message, PgQuery.ReassignOwnedStmt}
           }}
        end

        def field_def("reassign_owned_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reassignOwnedStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :reassign_owned_stmt,
             tag: 131,
             type: {:message, PgQuery.ReassignOwnedStmt}
           }}
        end
      ),
      (
        def field_def(:composite_type_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "compositeTypeStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :composite_type_stmt,
             tag: 132,
             type: {:message, PgQuery.CompositeTypeStmt}
           }}
        end

        def field_def("compositeTypeStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "compositeTypeStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :composite_type_stmt,
             tag: 132,
             type: {:message, PgQuery.CompositeTypeStmt}
           }}
        end

        def field_def("composite_type_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "compositeTypeStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :composite_type_stmt,
             tag: 132,
             type: {:message, PgQuery.CompositeTypeStmt}
           }}
        end
      ),
      (
        def field_def(:create_enum_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createEnumStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_enum_stmt,
             tag: 133,
             type: {:message, PgQuery.CreateEnumStmt}
           }}
        end

        def field_def("createEnumStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createEnumStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_enum_stmt,
             tag: 133,
             type: {:message, PgQuery.CreateEnumStmt}
           }}
        end

        def field_def("create_enum_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createEnumStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_enum_stmt,
             tag: 133,
             type: {:message, PgQuery.CreateEnumStmt}
           }}
        end
      ),
      (
        def field_def(:create_range_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createRangeStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_range_stmt,
             tag: 134,
             type: {:message, PgQuery.CreateRangeStmt}
           }}
        end

        def field_def("createRangeStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createRangeStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_range_stmt,
             tag: 134,
             type: {:message, PgQuery.CreateRangeStmt}
           }}
        end

        def field_def("create_range_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createRangeStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_range_stmt,
             tag: 134,
             type: {:message, PgQuery.CreateRangeStmt}
           }}
        end
      ),
      (
        def field_def(:alter_enum_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterEnumStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_enum_stmt,
             tag: 135,
             type: {:message, PgQuery.AlterEnumStmt}
           }}
        end

        def field_def("alterEnumStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterEnumStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_enum_stmt,
             tag: 135,
             type: {:message, PgQuery.AlterEnumStmt}
           }}
        end

        def field_def("alter_enum_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterEnumStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_enum_stmt,
             tag: 135,
             type: {:message, PgQuery.AlterEnumStmt}
           }}
        end
      ),
      (
        def field_def(:alter_tsdictionary_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterTsdictionaryStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_tsdictionary_stmt,
             tag: 136,
             type: {:message, PgQuery.AlterTSDictionaryStmt}
           }}
        end

        def field_def("alterTsdictionaryStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterTsdictionaryStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_tsdictionary_stmt,
             tag: 136,
             type: {:message, PgQuery.AlterTSDictionaryStmt}
           }}
        end

        def field_def("alter_tsdictionary_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterTsdictionaryStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_tsdictionary_stmt,
             tag: 136,
             type: {:message, PgQuery.AlterTSDictionaryStmt}
           }}
        end
      ),
      (
        def field_def(:alter_tsconfiguration_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterTsconfigurationStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_tsconfiguration_stmt,
             tag: 137,
             type: {:message, PgQuery.AlterTSConfigurationStmt}
           }}
        end

        def field_def("alterTsconfigurationStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterTsconfigurationStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_tsconfiguration_stmt,
             tag: 137,
             type: {:message, PgQuery.AlterTSConfigurationStmt}
           }}
        end

        def field_def("alter_tsconfiguration_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterTsconfigurationStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_tsconfiguration_stmt,
             tag: 137,
             type: {:message, PgQuery.AlterTSConfigurationStmt}
           }}
        end
      ),
      (
        def field_def(:create_fdw_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createFdwStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_fdw_stmt,
             tag: 138,
             type: {:message, PgQuery.CreateFdwStmt}
           }}
        end

        def field_def("createFdwStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createFdwStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_fdw_stmt,
             tag: 138,
             type: {:message, PgQuery.CreateFdwStmt}
           }}
        end

        def field_def("create_fdw_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createFdwStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_fdw_stmt,
             tag: 138,
             type: {:message, PgQuery.CreateFdwStmt}
           }}
        end
      ),
      (
        def field_def(:alter_fdw_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterFdwStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_fdw_stmt,
             tag: 139,
             type: {:message, PgQuery.AlterFdwStmt}
           }}
        end

        def field_def("alterFdwStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterFdwStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_fdw_stmt,
             tag: 139,
             type: {:message, PgQuery.AlterFdwStmt}
           }}
        end

        def field_def("alter_fdw_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterFdwStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_fdw_stmt,
             tag: 139,
             type: {:message, PgQuery.AlterFdwStmt}
           }}
        end
      ),
      (
        def field_def(:create_foreign_server_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createForeignServerStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_foreign_server_stmt,
             tag: 140,
             type: {:message, PgQuery.CreateForeignServerStmt}
           }}
        end

        def field_def("createForeignServerStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createForeignServerStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_foreign_server_stmt,
             tag: 140,
             type: {:message, PgQuery.CreateForeignServerStmt}
           }}
        end

        def field_def("create_foreign_server_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createForeignServerStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_foreign_server_stmt,
             tag: 140,
             type: {:message, PgQuery.CreateForeignServerStmt}
           }}
        end
      ),
      (
        def field_def(:alter_foreign_server_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterForeignServerStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_foreign_server_stmt,
             tag: 141,
             type: {:message, PgQuery.AlterForeignServerStmt}
           }}
        end

        def field_def("alterForeignServerStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterForeignServerStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_foreign_server_stmt,
             tag: 141,
             type: {:message, PgQuery.AlterForeignServerStmt}
           }}
        end

        def field_def("alter_foreign_server_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterForeignServerStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_foreign_server_stmt,
             tag: 141,
             type: {:message, PgQuery.AlterForeignServerStmt}
           }}
        end
      ),
      (
        def field_def(:create_user_mapping_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createUserMappingStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_user_mapping_stmt,
             tag: 142,
             type: {:message, PgQuery.CreateUserMappingStmt}
           }}
        end

        def field_def("createUserMappingStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createUserMappingStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_user_mapping_stmt,
             tag: 142,
             type: {:message, PgQuery.CreateUserMappingStmt}
           }}
        end

        def field_def("create_user_mapping_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createUserMappingStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_user_mapping_stmt,
             tag: 142,
             type: {:message, PgQuery.CreateUserMappingStmt}
           }}
        end
      ),
      (
        def field_def(:alter_user_mapping_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterUserMappingStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_user_mapping_stmt,
             tag: 143,
             type: {:message, PgQuery.AlterUserMappingStmt}
           }}
        end

        def field_def("alterUserMappingStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterUserMappingStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_user_mapping_stmt,
             tag: 143,
             type: {:message, PgQuery.AlterUserMappingStmt}
           }}
        end

        def field_def("alter_user_mapping_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterUserMappingStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_user_mapping_stmt,
             tag: 143,
             type: {:message, PgQuery.AlterUserMappingStmt}
           }}
        end
      ),
      (
        def field_def(:drop_user_mapping_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dropUserMappingStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :drop_user_mapping_stmt,
             tag: 144,
             type: {:message, PgQuery.DropUserMappingStmt}
           }}
        end

        def field_def("dropUserMappingStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dropUserMappingStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :drop_user_mapping_stmt,
             tag: 144,
             type: {:message, PgQuery.DropUserMappingStmt}
           }}
        end

        def field_def("drop_user_mapping_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dropUserMappingStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :drop_user_mapping_stmt,
             tag: 144,
             type: {:message, PgQuery.DropUserMappingStmt}
           }}
        end
      ),
      (
        def field_def(:alter_table_space_options_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterTableSpaceOptionsStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_table_space_options_stmt,
             tag: 145,
             type: {:message, PgQuery.AlterTableSpaceOptionsStmt}
           }}
        end

        def field_def("alterTableSpaceOptionsStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterTableSpaceOptionsStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_table_space_options_stmt,
             tag: 145,
             type: {:message, PgQuery.AlterTableSpaceOptionsStmt}
           }}
        end

        def field_def("alter_table_space_options_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterTableSpaceOptionsStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_table_space_options_stmt,
             tag: 145,
             type: {:message, PgQuery.AlterTableSpaceOptionsStmt}
           }}
        end
      ),
      (
        def field_def(:alter_table_move_all_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterTableMoveAllStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_table_move_all_stmt,
             tag: 146,
             type: {:message, PgQuery.AlterTableMoveAllStmt}
           }}
        end

        def field_def("alterTableMoveAllStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterTableMoveAllStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_table_move_all_stmt,
             tag: 146,
             type: {:message, PgQuery.AlterTableMoveAllStmt}
           }}
        end

        def field_def("alter_table_move_all_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterTableMoveAllStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_table_move_all_stmt,
             tag: 146,
             type: {:message, PgQuery.AlterTableMoveAllStmt}
           }}
        end
      ),
      (
        def field_def(:sec_label_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "secLabelStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :sec_label_stmt,
             tag: 147,
             type: {:message, PgQuery.SecLabelStmt}
           }}
        end

        def field_def("secLabelStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "secLabelStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :sec_label_stmt,
             tag: 147,
             type: {:message, PgQuery.SecLabelStmt}
           }}
        end

        def field_def("sec_label_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "secLabelStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :sec_label_stmt,
             tag: 147,
             type: {:message, PgQuery.SecLabelStmt}
           }}
        end
      ),
      (
        def field_def(:create_foreign_table_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createForeignTableStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_foreign_table_stmt,
             tag: 148,
             type: {:message, PgQuery.CreateForeignTableStmt}
           }}
        end

        def field_def("createForeignTableStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createForeignTableStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_foreign_table_stmt,
             tag: 148,
             type: {:message, PgQuery.CreateForeignTableStmt}
           }}
        end

        def field_def("create_foreign_table_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createForeignTableStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_foreign_table_stmt,
             tag: 148,
             type: {:message, PgQuery.CreateForeignTableStmt}
           }}
        end
      ),
      (
        def field_def(:import_foreign_schema_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "importForeignSchemaStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :import_foreign_schema_stmt,
             tag: 149,
             type: {:message, PgQuery.ImportForeignSchemaStmt}
           }}
        end

        def field_def("importForeignSchemaStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "importForeignSchemaStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :import_foreign_schema_stmt,
             tag: 149,
             type: {:message, PgQuery.ImportForeignSchemaStmt}
           }}
        end

        def field_def("import_foreign_schema_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "importForeignSchemaStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :import_foreign_schema_stmt,
             tag: 149,
             type: {:message, PgQuery.ImportForeignSchemaStmt}
           }}
        end
      ),
      (
        def field_def(:create_extension_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createExtensionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_extension_stmt,
             tag: 150,
             type: {:message, PgQuery.CreateExtensionStmt}
           }}
        end

        def field_def("createExtensionStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createExtensionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_extension_stmt,
             tag: 150,
             type: {:message, PgQuery.CreateExtensionStmt}
           }}
        end

        def field_def("create_extension_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createExtensionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_extension_stmt,
             tag: 150,
             type: {:message, PgQuery.CreateExtensionStmt}
           }}
        end
      ),
      (
        def field_def(:alter_extension_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterExtensionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_extension_stmt,
             tag: 151,
             type: {:message, PgQuery.AlterExtensionStmt}
           }}
        end

        def field_def("alterExtensionStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterExtensionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_extension_stmt,
             tag: 151,
             type: {:message, PgQuery.AlterExtensionStmt}
           }}
        end

        def field_def("alter_extension_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterExtensionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_extension_stmt,
             tag: 151,
             type: {:message, PgQuery.AlterExtensionStmt}
           }}
        end
      ),
      (
        def field_def(:alter_extension_contents_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterExtensionContentsStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_extension_contents_stmt,
             tag: 152,
             type: {:message, PgQuery.AlterExtensionContentsStmt}
           }}
        end

        def field_def("alterExtensionContentsStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterExtensionContentsStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_extension_contents_stmt,
             tag: 152,
             type: {:message, PgQuery.AlterExtensionContentsStmt}
           }}
        end

        def field_def("alter_extension_contents_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterExtensionContentsStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_extension_contents_stmt,
             tag: 152,
             type: {:message, PgQuery.AlterExtensionContentsStmt}
           }}
        end
      ),
      (
        def field_def(:create_event_trig_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createEventTrigStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_event_trig_stmt,
             tag: 153,
             type: {:message, PgQuery.CreateEventTrigStmt}
           }}
        end

        def field_def("createEventTrigStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createEventTrigStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_event_trig_stmt,
             tag: 153,
             type: {:message, PgQuery.CreateEventTrigStmt}
           }}
        end

        def field_def("create_event_trig_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createEventTrigStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_event_trig_stmt,
             tag: 153,
             type: {:message, PgQuery.CreateEventTrigStmt}
           }}
        end
      ),
      (
        def field_def(:alter_event_trig_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterEventTrigStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_event_trig_stmt,
             tag: 154,
             type: {:message, PgQuery.AlterEventTrigStmt}
           }}
        end

        def field_def("alterEventTrigStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterEventTrigStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_event_trig_stmt,
             tag: 154,
             type: {:message, PgQuery.AlterEventTrigStmt}
           }}
        end

        def field_def("alter_event_trig_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterEventTrigStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_event_trig_stmt,
             tag: 154,
             type: {:message, PgQuery.AlterEventTrigStmt}
           }}
        end
      ),
      (
        def field_def(:refresh_mat_view_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "refreshMatViewStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :refresh_mat_view_stmt,
             tag: 155,
             type: {:message, PgQuery.RefreshMatViewStmt}
           }}
        end

        def field_def("refreshMatViewStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "refreshMatViewStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :refresh_mat_view_stmt,
             tag: 155,
             type: {:message, PgQuery.RefreshMatViewStmt}
           }}
        end

        def field_def("refresh_mat_view_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "refreshMatViewStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :refresh_mat_view_stmt,
             tag: 155,
             type: {:message, PgQuery.RefreshMatViewStmt}
           }}
        end
      ),
      (
        def field_def(:replica_identity_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "replicaIdentityStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :replica_identity_stmt,
             tag: 156,
             type: {:message, PgQuery.ReplicaIdentityStmt}
           }}
        end

        def field_def("replicaIdentityStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "replicaIdentityStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :replica_identity_stmt,
             tag: 156,
             type: {:message, PgQuery.ReplicaIdentityStmt}
           }}
        end

        def field_def("replica_identity_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "replicaIdentityStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :replica_identity_stmt,
             tag: 156,
             type: {:message, PgQuery.ReplicaIdentityStmt}
           }}
        end
      ),
      (
        def field_def(:alter_system_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterSystemStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_system_stmt,
             tag: 157,
             type: {:message, PgQuery.AlterSystemStmt}
           }}
        end

        def field_def("alterSystemStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterSystemStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_system_stmt,
             tag: 157,
             type: {:message, PgQuery.AlterSystemStmt}
           }}
        end

        def field_def("alter_system_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterSystemStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_system_stmt,
             tag: 157,
             type: {:message, PgQuery.AlterSystemStmt}
           }}
        end
      ),
      (
        def field_def(:create_policy_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createPolicyStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_policy_stmt,
             tag: 158,
             type: {:message, PgQuery.CreatePolicyStmt}
           }}
        end

        def field_def("createPolicyStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createPolicyStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_policy_stmt,
             tag: 158,
             type: {:message, PgQuery.CreatePolicyStmt}
           }}
        end

        def field_def("create_policy_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createPolicyStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_policy_stmt,
             tag: 158,
             type: {:message, PgQuery.CreatePolicyStmt}
           }}
        end
      ),
      (
        def field_def(:alter_policy_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterPolicyStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_policy_stmt,
             tag: 159,
             type: {:message, PgQuery.AlterPolicyStmt}
           }}
        end

        def field_def("alterPolicyStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterPolicyStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_policy_stmt,
             tag: 159,
             type: {:message, PgQuery.AlterPolicyStmt}
           }}
        end

        def field_def("alter_policy_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterPolicyStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_policy_stmt,
             tag: 159,
             type: {:message, PgQuery.AlterPolicyStmt}
           }}
        end
      ),
      (
        def field_def(:create_transform_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTransformStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_transform_stmt,
             tag: 160,
             type: {:message, PgQuery.CreateTransformStmt}
           }}
        end

        def field_def("createTransformStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTransformStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_transform_stmt,
             tag: 160,
             type: {:message, PgQuery.CreateTransformStmt}
           }}
        end

        def field_def("create_transform_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTransformStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_transform_stmt,
             tag: 160,
             type: {:message, PgQuery.CreateTransformStmt}
           }}
        end
      ),
      (
        def field_def(:create_am_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createAmStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_am_stmt,
             tag: 161,
             type: {:message, PgQuery.CreateAmStmt}
           }}
        end

        def field_def("createAmStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createAmStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_am_stmt,
             tag: 161,
             type: {:message, PgQuery.CreateAmStmt}
           }}
        end

        def field_def("create_am_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createAmStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_am_stmt,
             tag: 161,
             type: {:message, PgQuery.CreateAmStmt}
           }}
        end
      ),
      (
        def field_def(:create_publication_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createPublicationStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_publication_stmt,
             tag: 162,
             type: {:message, PgQuery.CreatePublicationStmt}
           }}
        end

        def field_def("createPublicationStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createPublicationStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_publication_stmt,
             tag: 162,
             type: {:message, PgQuery.CreatePublicationStmt}
           }}
        end

        def field_def("create_publication_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createPublicationStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_publication_stmt,
             tag: 162,
             type: {:message, PgQuery.CreatePublicationStmt}
           }}
        end
      ),
      (
        def field_def(:alter_publication_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterPublicationStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_publication_stmt,
             tag: 163,
             type: {:message, PgQuery.AlterPublicationStmt}
           }}
        end

        def field_def("alterPublicationStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterPublicationStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_publication_stmt,
             tag: 163,
             type: {:message, PgQuery.AlterPublicationStmt}
           }}
        end

        def field_def("alter_publication_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterPublicationStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_publication_stmt,
             tag: 163,
             type: {:message, PgQuery.AlterPublicationStmt}
           }}
        end
      ),
      (
        def field_def(:create_subscription_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createSubscriptionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_subscription_stmt,
             tag: 164,
             type: {:message, PgQuery.CreateSubscriptionStmt}
           }}
        end

        def field_def("createSubscriptionStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createSubscriptionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_subscription_stmt,
             tag: 164,
             type: {:message, PgQuery.CreateSubscriptionStmt}
           }}
        end

        def field_def("create_subscription_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createSubscriptionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_subscription_stmt,
             tag: 164,
             type: {:message, PgQuery.CreateSubscriptionStmt}
           }}
        end
      ),
      (
        def field_def(:alter_subscription_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterSubscriptionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_subscription_stmt,
             tag: 165,
             type: {:message, PgQuery.AlterSubscriptionStmt}
           }}
        end

        def field_def("alterSubscriptionStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterSubscriptionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_subscription_stmt,
             tag: 165,
             type: {:message, PgQuery.AlterSubscriptionStmt}
           }}
        end

        def field_def("alter_subscription_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterSubscriptionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_subscription_stmt,
             tag: 165,
             type: {:message, PgQuery.AlterSubscriptionStmt}
           }}
        end
      ),
      (
        def field_def(:drop_subscription_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dropSubscriptionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :drop_subscription_stmt,
             tag: 166,
             type: {:message, PgQuery.DropSubscriptionStmt}
           }}
        end

        def field_def("dropSubscriptionStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dropSubscriptionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :drop_subscription_stmt,
             tag: 166,
             type: {:message, PgQuery.DropSubscriptionStmt}
           }}
        end

        def field_def("drop_subscription_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dropSubscriptionStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :drop_subscription_stmt,
             tag: 166,
             type: {:message, PgQuery.DropSubscriptionStmt}
           }}
        end
      ),
      (
        def field_def(:create_stats_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createStatsStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_stats_stmt,
             tag: 167,
             type: {:message, PgQuery.CreateStatsStmt}
           }}
        end

        def field_def("createStatsStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createStatsStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_stats_stmt,
             tag: 167,
             type: {:message, PgQuery.CreateStatsStmt}
           }}
        end

        def field_def("create_stats_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createStatsStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_stats_stmt,
             tag: 167,
             type: {:message, PgQuery.CreateStatsStmt}
           }}
        end
      ),
      (
        def field_def(:alter_collation_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterCollationStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_collation_stmt,
             tag: 168,
             type: {:message, PgQuery.AlterCollationStmt}
           }}
        end

        def field_def("alterCollationStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterCollationStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_collation_stmt,
             tag: 168,
             type: {:message, PgQuery.AlterCollationStmt}
           }}
        end

        def field_def("alter_collation_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterCollationStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_collation_stmt,
             tag: 168,
             type: {:message, PgQuery.AlterCollationStmt}
           }}
        end
      ),
      (
        def field_def(:call_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "callStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :call_stmt,
             tag: 169,
             type: {:message, PgQuery.CallStmt}
           }}
        end

        def field_def("callStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "callStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :call_stmt,
             tag: 169,
             type: {:message, PgQuery.CallStmt}
           }}
        end

        def field_def("call_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "callStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :call_stmt,
             tag: 169,
             type: {:message, PgQuery.CallStmt}
           }}
        end
      ),
      (
        def field_def(:alter_stats_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterStatsStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_stats_stmt,
             tag: 170,
             type: {:message, PgQuery.AlterStatsStmt}
           }}
        end

        def field_def("alterStatsStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterStatsStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_stats_stmt,
             tag: 170,
             type: {:message, PgQuery.AlterStatsStmt}
           }}
        end

        def field_def("alter_stats_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alterStatsStmt",
             kind: {:oneof, :node},
             label: :optional,
             name: :alter_stats_stmt,
             tag: 170,
             type: {:message, PgQuery.AlterStatsStmt}
           }}
        end
      ),
      (
        def field_def(:a_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :a_expr,
             tag: 171,
             type: {:message, PgQuery.A_Expr}
           }}
        end

        def field_def("aExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :a_expr,
             tag: 171,
             type: {:message, PgQuery.A_Expr}
           }}
        end

        def field_def("a_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :a_expr,
             tag: 171,
             type: {:message, PgQuery.A_Expr}
           }}
        end
      ),
      (
        def field_def(:column_ref) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columnRef",
             kind: {:oneof, :node},
             label: :optional,
             name: :column_ref,
             tag: 172,
             type: {:message, PgQuery.ColumnRef}
           }}
        end

        def field_def("columnRef") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columnRef",
             kind: {:oneof, :node},
             label: :optional,
             name: :column_ref,
             tag: 172,
             type: {:message, PgQuery.ColumnRef}
           }}
        end

        def field_def("column_ref") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columnRef",
             kind: {:oneof, :node},
             label: :optional,
             name: :column_ref,
             tag: 172,
             type: {:message, PgQuery.ColumnRef}
           }}
        end
      ),
      (
        def field_def(:param_ref) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paramRef",
             kind: {:oneof, :node},
             label: :optional,
             name: :param_ref,
             tag: 173,
             type: {:message, PgQuery.ParamRef}
           }}
        end

        def field_def("paramRef") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paramRef",
             kind: {:oneof, :node},
             label: :optional,
             name: :param_ref,
             tag: 173,
             type: {:message, PgQuery.ParamRef}
           }}
        end

        def field_def("param_ref") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paramRef",
             kind: {:oneof, :node},
             label: :optional,
             name: :param_ref,
             tag: 173,
             type: {:message, PgQuery.ParamRef}
           }}
        end
      ),
      (
        def field_def(:func_call) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcCall",
             kind: {:oneof, :node},
             label: :optional,
             name: :func_call,
             tag: 174,
             type: {:message, PgQuery.FuncCall}
           }}
        end

        def field_def("funcCall") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcCall",
             kind: {:oneof, :node},
             label: :optional,
             name: :func_call,
             tag: 174,
             type: {:message, PgQuery.FuncCall}
           }}
        end

        def field_def("func_call") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcCall",
             kind: {:oneof, :node},
             label: :optional,
             name: :func_call,
             tag: 174,
             type: {:message, PgQuery.FuncCall}
           }}
        end
      ),
      (
        def field_def(:a_star) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aStar",
             kind: {:oneof, :node},
             label: :optional,
             name: :a_star,
             tag: 175,
             type: {:message, PgQuery.A_Star}
           }}
        end

        def field_def("aStar") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aStar",
             kind: {:oneof, :node},
             label: :optional,
             name: :a_star,
             tag: 175,
             type: {:message, PgQuery.A_Star}
           }}
        end

        def field_def("a_star") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aStar",
             kind: {:oneof, :node},
             label: :optional,
             name: :a_star,
             tag: 175,
             type: {:message, PgQuery.A_Star}
           }}
        end
      ),
      (
        def field_def(:a_indices) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aIndices",
             kind: {:oneof, :node},
             label: :optional,
             name: :a_indices,
             tag: 176,
             type: {:message, PgQuery.A_Indices}
           }}
        end

        def field_def("aIndices") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aIndices",
             kind: {:oneof, :node},
             label: :optional,
             name: :a_indices,
             tag: 176,
             type: {:message, PgQuery.A_Indices}
           }}
        end

        def field_def("a_indices") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aIndices",
             kind: {:oneof, :node},
             label: :optional,
             name: :a_indices,
             tag: 176,
             type: {:message, PgQuery.A_Indices}
           }}
        end
      ),
      (
        def field_def(:a_indirection) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aIndirection",
             kind: {:oneof, :node},
             label: :optional,
             name: :a_indirection,
             tag: 177,
             type: {:message, PgQuery.A_Indirection}
           }}
        end

        def field_def("aIndirection") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aIndirection",
             kind: {:oneof, :node},
             label: :optional,
             name: :a_indirection,
             tag: 177,
             type: {:message, PgQuery.A_Indirection}
           }}
        end

        def field_def("a_indirection") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aIndirection",
             kind: {:oneof, :node},
             label: :optional,
             name: :a_indirection,
             tag: 177,
             type: {:message, PgQuery.A_Indirection}
           }}
        end
      ),
      (
        def field_def(:a_array_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aArrayExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :a_array_expr,
             tag: 178,
             type: {:message, PgQuery.A_ArrayExpr}
           }}
        end

        def field_def("aArrayExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aArrayExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :a_array_expr,
             tag: 178,
             type: {:message, PgQuery.A_ArrayExpr}
           }}
        end

        def field_def("a_array_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aArrayExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :a_array_expr,
             tag: 178,
             type: {:message, PgQuery.A_ArrayExpr}
           }}
        end
      ),
      (
        def field_def(:res_target) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resTarget",
             kind: {:oneof, :node},
             label: :optional,
             name: :res_target,
             tag: 179,
             type: {:message, PgQuery.ResTarget}
           }}
        end

        def field_def("resTarget") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resTarget",
             kind: {:oneof, :node},
             label: :optional,
             name: :res_target,
             tag: 179,
             type: {:message, PgQuery.ResTarget}
           }}
        end

        def field_def("res_target") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resTarget",
             kind: {:oneof, :node},
             label: :optional,
             name: :res_target,
             tag: 179,
             type: {:message, PgQuery.ResTarget}
           }}
        end
      ),
      (
        def field_def(:multi_assign_ref) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "multiAssignRef",
             kind: {:oneof, :node},
             label: :optional,
             name: :multi_assign_ref,
             tag: 180,
             type: {:message, PgQuery.MultiAssignRef}
           }}
        end

        def field_def("multiAssignRef") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "multiAssignRef",
             kind: {:oneof, :node},
             label: :optional,
             name: :multi_assign_ref,
             tag: 180,
             type: {:message, PgQuery.MultiAssignRef}
           }}
        end

        def field_def("multi_assign_ref") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "multiAssignRef",
             kind: {:oneof, :node},
             label: :optional,
             name: :multi_assign_ref,
             tag: 180,
             type: {:message, PgQuery.MultiAssignRef}
           }}
        end
      ),
      (
        def field_def(:type_cast) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeCast",
             kind: {:oneof, :node},
             label: :optional,
             name: :type_cast,
             tag: 181,
             type: {:message, PgQuery.TypeCast}
           }}
        end

        def field_def("typeCast") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeCast",
             kind: {:oneof, :node},
             label: :optional,
             name: :type_cast,
             tag: 181,
             type: {:message, PgQuery.TypeCast}
           }}
        end

        def field_def("type_cast") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeCast",
             kind: {:oneof, :node},
             label: :optional,
             name: :type_cast,
             tag: 181,
             type: {:message, PgQuery.TypeCast}
           }}
        end
      ),
      (
        def field_def(:collate_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collateClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :collate_clause,
             tag: 182,
             type: {:message, PgQuery.CollateClause}
           }}
        end

        def field_def("collateClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collateClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :collate_clause,
             tag: 182,
             type: {:message, PgQuery.CollateClause}
           }}
        end

        def field_def("collate_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collateClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :collate_clause,
             tag: 182,
             type: {:message, PgQuery.CollateClause}
           }}
        end
      ),
      (
        def field_def(:sort_by) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sortBy",
             kind: {:oneof, :node},
             label: :optional,
             name: :sort_by,
             tag: 183,
             type: {:message, PgQuery.SortBy}
           }}
        end

        def field_def("sortBy") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sortBy",
             kind: {:oneof, :node},
             label: :optional,
             name: :sort_by,
             tag: 183,
             type: {:message, PgQuery.SortBy}
           }}
        end

        def field_def("sort_by") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sortBy",
             kind: {:oneof, :node},
             label: :optional,
             name: :sort_by,
             tag: 183,
             type: {:message, PgQuery.SortBy}
           }}
        end
      ),
      (
        def field_def(:window_def) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "windowDef",
             kind: {:oneof, :node},
             label: :optional,
             name: :window_def,
             tag: 184,
             type: {:message, PgQuery.WindowDef}
           }}
        end

        def field_def("windowDef") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "windowDef",
             kind: {:oneof, :node},
             label: :optional,
             name: :window_def,
             tag: 184,
             type: {:message, PgQuery.WindowDef}
           }}
        end

        def field_def("window_def") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "windowDef",
             kind: {:oneof, :node},
             label: :optional,
             name: :window_def,
             tag: 184,
             type: {:message, PgQuery.WindowDef}
           }}
        end
      ),
      (
        def field_def(:range_subselect) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeSubselect",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_subselect,
             tag: 185,
             type: {:message, PgQuery.RangeSubselect}
           }}
        end

        def field_def("rangeSubselect") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeSubselect",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_subselect,
             tag: 185,
             type: {:message, PgQuery.RangeSubselect}
           }}
        end

        def field_def("range_subselect") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeSubselect",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_subselect,
             tag: 185,
             type: {:message, PgQuery.RangeSubselect}
           }}
        end
      ),
      (
        def field_def(:range_function) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeFunction",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_function,
             tag: 186,
             type: {:message, PgQuery.RangeFunction}
           }}
        end

        def field_def("rangeFunction") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeFunction",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_function,
             tag: 186,
             type: {:message, PgQuery.RangeFunction}
           }}
        end

        def field_def("range_function") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeFunction",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_function,
             tag: 186,
             type: {:message, PgQuery.RangeFunction}
           }}
        end
      ),
      (
        def field_def(:range_table_sample) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeTableSample",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_table_sample,
             tag: 187,
             type: {:message, PgQuery.RangeTableSample}
           }}
        end

        def field_def("rangeTableSample") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeTableSample",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_table_sample,
             tag: 187,
             type: {:message, PgQuery.RangeTableSample}
           }}
        end

        def field_def("range_table_sample") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeTableSample",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_table_sample,
             tag: 187,
             type: {:message, PgQuery.RangeTableSample}
           }}
        end
      ),
      (
        def field_def(:range_table_func) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeTableFunc",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_table_func,
             tag: 188,
             type: {:message, PgQuery.RangeTableFunc}
           }}
        end

        def field_def("rangeTableFunc") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeTableFunc",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_table_func,
             tag: 188,
             type: {:message, PgQuery.RangeTableFunc}
           }}
        end

        def field_def("range_table_func") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeTableFunc",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_table_func,
             tag: 188,
             type: {:message, PgQuery.RangeTableFunc}
           }}
        end
      ),
      (
        def field_def(:range_table_func_col) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeTableFuncCol",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_table_func_col,
             tag: 189,
             type: {:message, PgQuery.RangeTableFuncCol}
           }}
        end

        def field_def("rangeTableFuncCol") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeTableFuncCol",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_table_func_col,
             tag: 189,
             type: {:message, PgQuery.RangeTableFuncCol}
           }}
        end

        def field_def("range_table_func_col") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeTableFuncCol",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_table_func_col,
             tag: 189,
             type: {:message, PgQuery.RangeTableFuncCol}
           }}
        end
      ),
      (
        def field_def(:type_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeName",
             kind: {:oneof, :node},
             label: :optional,
             name: :type_name,
             tag: 190,
             type: {:message, PgQuery.TypeName}
           }}
        end

        def field_def("typeName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeName",
             kind: {:oneof, :node},
             label: :optional,
             name: :type_name,
             tag: 190,
             type: {:message, PgQuery.TypeName}
           }}
        end

        def field_def("type_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeName",
             kind: {:oneof, :node},
             label: :optional,
             name: :type_name,
             tag: 190,
             type: {:message, PgQuery.TypeName}
           }}
        end
      ),
      (
        def field_def(:column_def) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columnDef",
             kind: {:oneof, :node},
             label: :optional,
             name: :column_def,
             tag: 191,
             type: {:message, PgQuery.ColumnDef}
           }}
        end

        def field_def("columnDef") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columnDef",
             kind: {:oneof, :node},
             label: :optional,
             name: :column_def,
             tag: 191,
             type: {:message, PgQuery.ColumnDef}
           }}
        end

        def field_def("column_def") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columnDef",
             kind: {:oneof, :node},
             label: :optional,
             name: :column_def,
             tag: 191,
             type: {:message, PgQuery.ColumnDef}
           }}
        end
      ),
      (
        def field_def(:index_elem) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexElem",
             kind: {:oneof, :node},
             label: :optional,
             name: :index_elem,
             tag: 192,
             type: {:message, PgQuery.IndexElem}
           }}
        end

        def field_def("indexElem") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexElem",
             kind: {:oneof, :node},
             label: :optional,
             name: :index_elem,
             tag: 192,
             type: {:message, PgQuery.IndexElem}
           }}
        end

        def field_def("index_elem") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexElem",
             kind: {:oneof, :node},
             label: :optional,
             name: :index_elem,
             tag: 192,
             type: {:message, PgQuery.IndexElem}
           }}
        end
      ),
      (
        def field_def(:stats_elem) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "statsElem",
             kind: {:oneof, :node},
             label: :optional,
             name: :stats_elem,
             tag: 193,
             type: {:message, PgQuery.StatsElem}
           }}
        end

        def field_def("statsElem") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "statsElem",
             kind: {:oneof, :node},
             label: :optional,
             name: :stats_elem,
             tag: 193,
             type: {:message, PgQuery.StatsElem}
           }}
        end

        def field_def("stats_elem") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "statsElem",
             kind: {:oneof, :node},
             label: :optional,
             name: :stats_elem,
             tag: 193,
             type: {:message, PgQuery.StatsElem}
           }}
        end
      ),
      (
        def field_def(:constraint) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "constraint",
             kind: {:oneof, :node},
             label: :optional,
             name: :constraint,
             tag: 194,
             type: {:message, PgQuery.Constraint}
           }}
        end

        def field_def("constraint") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "constraint",
             kind: {:oneof, :node},
             label: :optional,
             name: :constraint,
             tag: 194,
             type: {:message, PgQuery.Constraint}
           }}
        end

        []
      ),
      (
        def field_def(:def_elem) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "defElem",
             kind: {:oneof, :node},
             label: :optional,
             name: :def_elem,
             tag: 195,
             type: {:message, PgQuery.DefElem}
           }}
        end

        def field_def("defElem") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "defElem",
             kind: {:oneof, :node},
             label: :optional,
             name: :def_elem,
             tag: 195,
             type: {:message, PgQuery.DefElem}
           }}
        end

        def field_def("def_elem") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "defElem",
             kind: {:oneof, :node},
             label: :optional,
             name: :def_elem,
             tag: 195,
             type: {:message, PgQuery.DefElem}
           }}
        end
      ),
      (
        def field_def(:range_tbl_entry) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeTblEntry",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_tbl_entry,
             tag: 196,
             type: {:message, PgQuery.RangeTblEntry}
           }}
        end

        def field_def("rangeTblEntry") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeTblEntry",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_tbl_entry,
             tag: 196,
             type: {:message, PgQuery.RangeTblEntry}
           }}
        end

        def field_def("range_tbl_entry") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeTblEntry",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_tbl_entry,
             tag: 196,
             type: {:message, PgQuery.RangeTblEntry}
           }}
        end
      ),
      (
        def field_def(:range_tbl_function) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeTblFunction",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_tbl_function,
             tag: 197,
             type: {:message, PgQuery.RangeTblFunction}
           }}
        end

        def field_def("rangeTblFunction") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeTblFunction",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_tbl_function,
             tag: 197,
             type: {:message, PgQuery.RangeTblFunction}
           }}
        end

        def field_def("range_tbl_function") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeTblFunction",
             kind: {:oneof, :node},
             label: :optional,
             name: :range_tbl_function,
             tag: 197,
             type: {:message, PgQuery.RangeTblFunction}
           }}
        end
      ),
      (
        def field_def(:table_sample_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableSampleClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :table_sample_clause,
             tag: 198,
             type: {:message, PgQuery.TableSampleClause}
           }}
        end

        def field_def("tableSampleClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableSampleClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :table_sample_clause,
             tag: 198,
             type: {:message, PgQuery.TableSampleClause}
           }}
        end

        def field_def("table_sample_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableSampleClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :table_sample_clause,
             tag: 198,
             type: {:message, PgQuery.TableSampleClause}
           }}
        end
      ),
      (
        def field_def(:with_check_option) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "withCheckOption",
             kind: {:oneof, :node},
             label: :optional,
             name: :with_check_option,
             tag: 199,
             type: {:message, PgQuery.WithCheckOption}
           }}
        end

        def field_def("withCheckOption") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "withCheckOption",
             kind: {:oneof, :node},
             label: :optional,
             name: :with_check_option,
             tag: 199,
             type: {:message, PgQuery.WithCheckOption}
           }}
        end

        def field_def("with_check_option") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "withCheckOption",
             kind: {:oneof, :node},
             label: :optional,
             name: :with_check_option,
             tag: 199,
             type: {:message, PgQuery.WithCheckOption}
           }}
        end
      ),
      (
        def field_def(:sort_group_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sortGroupClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :sort_group_clause,
             tag: 200,
             type: {:message, PgQuery.SortGroupClause}
           }}
        end

        def field_def("sortGroupClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sortGroupClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :sort_group_clause,
             tag: 200,
             type: {:message, PgQuery.SortGroupClause}
           }}
        end

        def field_def("sort_group_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sortGroupClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :sort_group_clause,
             tag: 200,
             type: {:message, PgQuery.SortGroupClause}
           }}
        end
      ),
      (
        def field_def(:grouping_set) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupingSet",
             kind: {:oneof, :node},
             label: :optional,
             name: :grouping_set,
             tag: 201,
             type: {:message, PgQuery.GroupingSet}
           }}
        end

        def field_def("groupingSet") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupingSet",
             kind: {:oneof, :node},
             label: :optional,
             name: :grouping_set,
             tag: 201,
             type: {:message, PgQuery.GroupingSet}
           }}
        end

        def field_def("grouping_set") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupingSet",
             kind: {:oneof, :node},
             label: :optional,
             name: :grouping_set,
             tag: 201,
             type: {:message, PgQuery.GroupingSet}
           }}
        end
      ),
      (
        def field_def(:window_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "windowClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :window_clause,
             tag: 202,
             type: {:message, PgQuery.WindowClause}
           }}
        end

        def field_def("windowClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "windowClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :window_clause,
             tag: 202,
             type: {:message, PgQuery.WindowClause}
           }}
        end

        def field_def("window_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "windowClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :window_clause,
             tag: 202,
             type: {:message, PgQuery.WindowClause}
           }}
        end
      ),
      (
        def field_def(:object_with_args) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "objectWithArgs",
             kind: {:oneof, :node},
             label: :optional,
             name: :object_with_args,
             tag: 203,
             type: {:message, PgQuery.ObjectWithArgs}
           }}
        end

        def field_def("objectWithArgs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "objectWithArgs",
             kind: {:oneof, :node},
             label: :optional,
             name: :object_with_args,
             tag: 203,
             type: {:message, PgQuery.ObjectWithArgs}
           }}
        end

        def field_def("object_with_args") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "objectWithArgs",
             kind: {:oneof, :node},
             label: :optional,
             name: :object_with_args,
             tag: 203,
             type: {:message, PgQuery.ObjectWithArgs}
           }}
        end
      ),
      (
        def field_def(:access_priv) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accessPriv",
             kind: {:oneof, :node},
             label: :optional,
             name: :access_priv,
             tag: 204,
             type: {:message, PgQuery.AccessPriv}
           }}
        end

        def field_def("accessPriv") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accessPriv",
             kind: {:oneof, :node},
             label: :optional,
             name: :access_priv,
             tag: 204,
             type: {:message, PgQuery.AccessPriv}
           }}
        end

        def field_def("access_priv") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accessPriv",
             kind: {:oneof, :node},
             label: :optional,
             name: :access_priv,
             tag: 204,
             type: {:message, PgQuery.AccessPriv}
           }}
        end
      ),
      (
        def field_def(:create_op_class_item) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createOpClassItem",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_op_class_item,
             tag: 205,
             type: {:message, PgQuery.CreateOpClassItem}
           }}
        end

        def field_def("createOpClassItem") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createOpClassItem",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_op_class_item,
             tag: 205,
             type: {:message, PgQuery.CreateOpClassItem}
           }}
        end

        def field_def("create_op_class_item") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createOpClassItem",
             kind: {:oneof, :node},
             label: :optional,
             name: :create_op_class_item,
             tag: 205,
             type: {:message, PgQuery.CreateOpClassItem}
           }}
        end
      ),
      (
        def field_def(:table_like_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableLikeClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :table_like_clause,
             tag: 206,
             type: {:message, PgQuery.TableLikeClause}
           }}
        end

        def field_def("tableLikeClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableLikeClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :table_like_clause,
             tag: 206,
             type: {:message, PgQuery.TableLikeClause}
           }}
        end

        def field_def("table_like_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableLikeClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :table_like_clause,
             tag: 206,
             type: {:message, PgQuery.TableLikeClause}
           }}
        end
      ),
      (
        def field_def(:function_parameter) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "functionParameter",
             kind: {:oneof, :node},
             label: :optional,
             name: :function_parameter,
             tag: 207,
             type: {:message, PgQuery.FunctionParameter}
           }}
        end

        def field_def("functionParameter") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "functionParameter",
             kind: {:oneof, :node},
             label: :optional,
             name: :function_parameter,
             tag: 207,
             type: {:message, PgQuery.FunctionParameter}
           }}
        end

        def field_def("function_parameter") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "functionParameter",
             kind: {:oneof, :node},
             label: :optional,
             name: :function_parameter,
             tag: 207,
             type: {:message, PgQuery.FunctionParameter}
           }}
        end
      ),
      (
        def field_def(:locking_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lockingClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :locking_clause,
             tag: 208,
             type: {:message, PgQuery.LockingClause}
           }}
        end

        def field_def("lockingClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lockingClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :locking_clause,
             tag: 208,
             type: {:message, PgQuery.LockingClause}
           }}
        end

        def field_def("locking_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lockingClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :locking_clause,
             tag: 208,
             type: {:message, PgQuery.LockingClause}
           }}
        end
      ),
      (
        def field_def(:row_mark_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowMarkClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :row_mark_clause,
             tag: 209,
             type: {:message, PgQuery.RowMarkClause}
           }}
        end

        def field_def("rowMarkClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowMarkClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :row_mark_clause,
             tag: 209,
             type: {:message, PgQuery.RowMarkClause}
           }}
        end

        def field_def("row_mark_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowMarkClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :row_mark_clause,
             tag: 209,
             type: {:message, PgQuery.RowMarkClause}
           }}
        end
      ),
      (
        def field_def(:xml_serialize) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xmlSerialize",
             kind: {:oneof, :node},
             label: :optional,
             name: :xml_serialize,
             tag: 210,
             type: {:message, PgQuery.XmlSerialize}
           }}
        end

        def field_def("xmlSerialize") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xmlSerialize",
             kind: {:oneof, :node},
             label: :optional,
             name: :xml_serialize,
             tag: 210,
             type: {:message, PgQuery.XmlSerialize}
           }}
        end

        def field_def("xml_serialize") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xmlSerialize",
             kind: {:oneof, :node},
             label: :optional,
             name: :xml_serialize,
             tag: 210,
             type: {:message, PgQuery.XmlSerialize}
           }}
        end
      ),
      (
        def field_def(:with_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "withClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :with_clause,
             tag: 211,
             type: {:message, PgQuery.WithClause}
           }}
        end

        def field_def("withClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "withClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :with_clause,
             tag: 211,
             type: {:message, PgQuery.WithClause}
           }}
        end

        def field_def("with_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "withClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :with_clause,
             tag: 211,
             type: {:message, PgQuery.WithClause}
           }}
        end
      ),
      (
        def field_def(:infer_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inferClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :infer_clause,
             tag: 212,
             type: {:message, PgQuery.InferClause}
           }}
        end

        def field_def("inferClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inferClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :infer_clause,
             tag: 212,
             type: {:message, PgQuery.InferClause}
           }}
        end

        def field_def("infer_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inferClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :infer_clause,
             tag: 212,
             type: {:message, PgQuery.InferClause}
           }}
        end
      ),
      (
        def field_def(:on_conflict_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onConflictClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :on_conflict_clause,
             tag: 213,
             type: {:message, PgQuery.OnConflictClause}
           }}
        end

        def field_def("onConflictClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onConflictClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :on_conflict_clause,
             tag: 213,
             type: {:message, PgQuery.OnConflictClause}
           }}
        end

        def field_def("on_conflict_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onConflictClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :on_conflict_clause,
             tag: 213,
             type: {:message, PgQuery.OnConflictClause}
           }}
        end
      ),
      (
        def field_def(:ctesearch_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctesearchClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :ctesearch_clause,
             tag: 214,
             type: {:message, PgQuery.CTESearchClause}
           }}
        end

        def field_def("ctesearchClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctesearchClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :ctesearch_clause,
             tag: 214,
             type: {:message, PgQuery.CTESearchClause}
           }}
        end

        def field_def("ctesearch_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctesearchClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :ctesearch_clause,
             tag: 214,
             type: {:message, PgQuery.CTESearchClause}
           }}
        end
      ),
      (
        def field_def(:ctecycle_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctecycleClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :ctecycle_clause,
             tag: 215,
             type: {:message, PgQuery.CTECycleClause}
           }}
        end

        def field_def("ctecycleClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctecycleClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :ctecycle_clause,
             tag: 215,
             type: {:message, PgQuery.CTECycleClause}
           }}
        end

        def field_def("ctecycle_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctecycleClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :ctecycle_clause,
             tag: 215,
             type: {:message, PgQuery.CTECycleClause}
           }}
        end
      ),
      (
        def field_def(:common_table_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commonTableExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :common_table_expr,
             tag: 216,
             type: {:message, PgQuery.CommonTableExpr}
           }}
        end

        def field_def("commonTableExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commonTableExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :common_table_expr,
             tag: 216,
             type: {:message, PgQuery.CommonTableExpr}
           }}
        end

        def field_def("common_table_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commonTableExpr",
             kind: {:oneof, :node},
             label: :optional,
             name: :common_table_expr,
             tag: 216,
             type: {:message, PgQuery.CommonTableExpr}
           }}
        end
      ),
      (
        def field_def(:merge_when_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mergeWhenClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :merge_when_clause,
             tag: 217,
             type: {:message, PgQuery.MergeWhenClause}
           }}
        end

        def field_def("mergeWhenClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mergeWhenClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :merge_when_clause,
             tag: 217,
             type: {:message, PgQuery.MergeWhenClause}
           }}
        end

        def field_def("merge_when_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mergeWhenClause",
             kind: {:oneof, :node},
             label: :optional,
             name: :merge_when_clause,
             tag: 217,
             type: {:message, PgQuery.MergeWhenClause}
           }}
        end
      ),
      (
        def field_def(:role_spec) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roleSpec",
             kind: {:oneof, :node},
             label: :optional,
             name: :role_spec,
             tag: 218,
             type: {:message, PgQuery.RoleSpec}
           }}
        end

        def field_def("roleSpec") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roleSpec",
             kind: {:oneof, :node},
             label: :optional,
             name: :role_spec,
             tag: 218,
             type: {:message, PgQuery.RoleSpec}
           }}
        end

        def field_def("role_spec") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roleSpec",
             kind: {:oneof, :node},
             label: :optional,
             name: :role_spec,
             tag: 218,
             type: {:message, PgQuery.RoleSpec}
           }}
        end
      ),
      (
        def field_def(:trigger_transition) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "triggerTransition",
             kind: {:oneof, :node},
             label: :optional,
             name: :trigger_transition,
             tag: 219,
             type: {:message, PgQuery.TriggerTransition}
           }}
        end

        def field_def("triggerTransition") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "triggerTransition",
             kind: {:oneof, :node},
             label: :optional,
             name: :trigger_transition,
             tag: 219,
             type: {:message, PgQuery.TriggerTransition}
           }}
        end

        def field_def("trigger_transition") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "triggerTransition",
             kind: {:oneof, :node},
             label: :optional,
             name: :trigger_transition,
             tag: 219,
             type: {:message, PgQuery.TriggerTransition}
           }}
        end
      ),
      (
        def field_def(:partition_elem) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partitionElem",
             kind: {:oneof, :node},
             label: :optional,
             name: :partition_elem,
             tag: 220,
             type: {:message, PgQuery.PartitionElem}
           }}
        end

        def field_def("partitionElem") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partitionElem",
             kind: {:oneof, :node},
             label: :optional,
             name: :partition_elem,
             tag: 220,
             type: {:message, PgQuery.PartitionElem}
           }}
        end

        def field_def("partition_elem") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partitionElem",
             kind: {:oneof, :node},
             label: :optional,
             name: :partition_elem,
             tag: 220,
             type: {:message, PgQuery.PartitionElem}
           }}
        end
      ),
      (
        def field_def(:partition_spec) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partitionSpec",
             kind: {:oneof, :node},
             label: :optional,
             name: :partition_spec,
             tag: 221,
             type: {:message, PgQuery.PartitionSpec}
           }}
        end

        def field_def("partitionSpec") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partitionSpec",
             kind: {:oneof, :node},
             label: :optional,
             name: :partition_spec,
             tag: 221,
             type: {:message, PgQuery.PartitionSpec}
           }}
        end

        def field_def("partition_spec") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partitionSpec",
             kind: {:oneof, :node},
             label: :optional,
             name: :partition_spec,
             tag: 221,
             type: {:message, PgQuery.PartitionSpec}
           }}
        end
      ),
      (
        def field_def(:partition_bound_spec) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partitionBoundSpec",
             kind: {:oneof, :node},
             label: :optional,
             name: :partition_bound_spec,
             tag: 222,
             type: {:message, PgQuery.PartitionBoundSpec}
           }}
        end

        def field_def("partitionBoundSpec") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partitionBoundSpec",
             kind: {:oneof, :node},
             label: :optional,
             name: :partition_bound_spec,
             tag: 222,
             type: {:message, PgQuery.PartitionBoundSpec}
           }}
        end

        def field_def("partition_bound_spec") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partitionBoundSpec",
             kind: {:oneof, :node},
             label: :optional,
             name: :partition_bound_spec,
             tag: 222,
             type: {:message, PgQuery.PartitionBoundSpec}
           }}
        end
      ),
      (
        def field_def(:partition_range_datum) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partitionRangeDatum",
             kind: {:oneof, :node},
             label: :optional,
             name: :partition_range_datum,
             tag: 223,
             type: {:message, PgQuery.PartitionRangeDatum}
           }}
        end

        def field_def("partitionRangeDatum") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partitionRangeDatum",
             kind: {:oneof, :node},
             label: :optional,
             name: :partition_range_datum,
             tag: 223,
             type: {:message, PgQuery.PartitionRangeDatum}
           }}
        end

        def field_def("partition_range_datum") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partitionRangeDatum",
             kind: {:oneof, :node},
             label: :optional,
             name: :partition_range_datum,
             tag: 223,
             type: {:message, PgQuery.PartitionRangeDatum}
           }}
        end
      ),
      (
        def field_def(:partition_cmd) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partitionCmd",
             kind: {:oneof, :node},
             label: :optional,
             name: :partition_cmd,
             tag: 224,
             type: {:message, PgQuery.PartitionCmd}
           }}
        end

        def field_def("partitionCmd") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partitionCmd",
             kind: {:oneof, :node},
             label: :optional,
             name: :partition_cmd,
             tag: 224,
             type: {:message, PgQuery.PartitionCmd}
           }}
        end

        def field_def("partition_cmd") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partitionCmd",
             kind: {:oneof, :node},
             label: :optional,
             name: :partition_cmd,
             tag: 224,
             type: {:message, PgQuery.PartitionCmd}
           }}
        end
      ),
      (
        def field_def(:vacuum_relation) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "vacuumRelation",
             kind: {:oneof, :node},
             label: :optional,
             name: :vacuum_relation,
             tag: 225,
             type: {:message, PgQuery.VacuumRelation}
           }}
        end

        def field_def("vacuumRelation") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "vacuumRelation",
             kind: {:oneof, :node},
             label: :optional,
             name: :vacuum_relation,
             tag: 225,
             type: {:message, PgQuery.VacuumRelation}
           }}
        end

        def field_def("vacuum_relation") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "vacuumRelation",
             kind: {:oneof, :node},
             label: :optional,
             name: :vacuum_relation,
             tag: 225,
             type: {:message, PgQuery.VacuumRelation}
           }}
        end
      ),
      (
        def field_def(:publication_obj_spec) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "publicationObjSpec",
             kind: {:oneof, :node},
             label: :optional,
             name: :publication_obj_spec,
             tag: 226,
             type: {:message, PgQuery.PublicationObjSpec}
           }}
        end

        def field_def("publicationObjSpec") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "publicationObjSpec",
             kind: {:oneof, :node},
             label: :optional,
             name: :publication_obj_spec,
             tag: 226,
             type: {:message, PgQuery.PublicationObjSpec}
           }}
        end

        def field_def("publication_obj_spec") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "publicationObjSpec",
             kind: {:oneof, :node},
             label: :optional,
             name: :publication_obj_spec,
             tag: 226,
             type: {:message, PgQuery.PublicationObjSpec}
           }}
        end
      ),
      (
        def field_def(:publication_table) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "publicationTable",
             kind: {:oneof, :node},
             label: :optional,
             name: :publication_table,
             tag: 227,
             type: {:message, PgQuery.PublicationTable}
           }}
        end

        def field_def("publicationTable") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "publicationTable",
             kind: {:oneof, :node},
             label: :optional,
             name: :publication_table,
             tag: 227,
             type: {:message, PgQuery.PublicationTable}
           }}
        end

        def field_def("publication_table") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "publicationTable",
             kind: {:oneof, :node},
             label: :optional,
             name: :publication_table,
             tag: 227,
             type: {:message, PgQuery.PublicationTable}
           }}
        end
      ),
      (
        def field_def(:inline_code_block) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inlineCodeBlock",
             kind: {:oneof, :node},
             label: :optional,
             name: :inline_code_block,
             tag: 228,
             type: {:message, PgQuery.InlineCodeBlock}
           }}
        end

        def field_def("inlineCodeBlock") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inlineCodeBlock",
             kind: {:oneof, :node},
             label: :optional,
             name: :inline_code_block,
             tag: 228,
             type: {:message, PgQuery.InlineCodeBlock}
           }}
        end

        def field_def("inline_code_block") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inlineCodeBlock",
             kind: {:oneof, :node},
             label: :optional,
             name: :inline_code_block,
             tag: 228,
             type: {:message, PgQuery.InlineCodeBlock}
           }}
        end
      ),
      (
        def field_def(:call_context) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "callContext",
             kind: {:oneof, :node},
             label: :optional,
             name: :call_context,
             tag: 229,
             type: {:message, PgQuery.CallContext}
           }}
        end

        def field_def("callContext") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "callContext",
             kind: {:oneof, :node},
             label: :optional,
             name: :call_context,
             tag: 229,
             type: {:message, PgQuery.CallContext}
           }}
        end

        def field_def("call_context") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "callContext",
             kind: {:oneof, :node},
             label: :optional,
             name: :call_context,
             tag: 229,
             type: {:message, PgQuery.CallContext}
           }}
        end
      ),
      (
        def field_def(:integer) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "integer",
             kind: {:oneof, :node},
             label: :optional,
             name: :integer,
             tag: 230,
             type: {:message, PgQuery.Integer}
           }}
        end

        def field_def("integer") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "integer",
             kind: {:oneof, :node},
             label: :optional,
             name: :integer,
             tag: 230,
             type: {:message, PgQuery.Integer}
           }}
        end

        []
      ),
      (
        def field_def(:float) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "float",
             kind: {:oneof, :node},
             label: :optional,
             name: :float,
             tag: 231,
             type: {:message, PgQuery.Float}
           }}
        end

        def field_def("float") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "float",
             kind: {:oneof, :node},
             label: :optional,
             name: :float,
             tag: 231,
             type: {:message, PgQuery.Float}
           }}
        end

        []
      ),
      (
        def field_def(:boolean) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "boolean",
             kind: {:oneof, :node},
             label: :optional,
             name: :boolean,
             tag: 232,
             type: {:message, PgQuery.Boolean}
           }}
        end

        def field_def("boolean") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "boolean",
             kind: {:oneof, :node},
             label: :optional,
             name: :boolean,
             tag: 232,
             type: {:message, PgQuery.Boolean}
           }}
        end

        []
      ),
      (
        def field_def(:string) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "string",
             kind: {:oneof, :node},
             label: :optional,
             name: :string,
             tag: 233,
             type: {:message, PgQuery.String}
           }}
        end

        def field_def("string") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "string",
             kind: {:oneof, :node},
             label: :optional,
             name: :string,
             tag: 233,
             type: {:message, PgQuery.String}
           }}
        end

        []
      ),
      (
        def field_def(:bit_string) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bitString",
             kind: {:oneof, :node},
             label: :optional,
             name: :bit_string,
             tag: 234,
             type: {:message, PgQuery.BitString}
           }}
        end

        def field_def("bitString") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bitString",
             kind: {:oneof, :node},
             label: :optional,
             name: :bit_string,
             tag: 234,
             type: {:message, PgQuery.BitString}
           }}
        end

        def field_def("bit_string") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bitString",
             kind: {:oneof, :node},
             label: :optional,
             name: :bit_string,
             tag: 234,
             type: {:message, PgQuery.BitString}
           }}
        end
      ),
      (
        def field_def(:list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "list",
             kind: {:oneof, :node},
             label: :optional,
             name: :list,
             tag: 235,
             type: {:message, PgQuery.List}
           }}
        end

        def field_def("list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "list",
             kind: {:oneof, :node},
             label: :optional,
             name: :list,
             tag: 235,
             type: {:message, PgQuery.List}
           }}
        end

        []
      ),
      (
        def field_def(:int_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "intList",
             kind: {:oneof, :node},
             label: :optional,
             name: :int_list,
             tag: 236,
             type: {:message, PgQuery.IntList}
           }}
        end

        def field_def("intList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "intList",
             kind: {:oneof, :node},
             label: :optional,
             name: :int_list,
             tag: 236,
             type: {:message, PgQuery.IntList}
           }}
        end

        def field_def("int_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "intList",
             kind: {:oneof, :node},
             label: :optional,
             name: :int_list,
             tag: 236,
             type: {:message, PgQuery.IntList}
           }}
        end
      ),
      (
        def field_def(:oid_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oidList",
             kind: {:oneof, :node},
             label: :optional,
             name: :oid_list,
             tag: 237,
             type: {:message, PgQuery.OidList}
           }}
        end

        def field_def("oidList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oidList",
             kind: {:oneof, :node},
             label: :optional,
             name: :oid_list,
             tag: 237,
             type: {:message, PgQuery.OidList}
           }}
        end

        def field_def("oid_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oidList",
             kind: {:oneof, :node},
             label: :optional,
             name: :oid_list,
             tag: 237,
             type: {:message, PgQuery.OidList}
           }}
        end
      ),
      (
        def field_def(:a_const) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aConst",
             kind: {:oneof, :node},
             label: :optional,
             name: :a_const,
             tag: 238,
             type: {:message, PgQuery.A_Const}
           }}
        end

        def field_def("aConst") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aConst",
             kind: {:oneof, :node},
             label: :optional,
             name: :a_const,
             tag: 238,
             type: {:message, PgQuery.A_Const}
           }}
        end

        def field_def("a_const") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aConst",
             kind: {:oneof, :node},
             label: :optional,
             name: :a_const,
             tag: 238,
             type: {:message, PgQuery.A_Const}
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
    def default(:alias) do
      {:error, :no_default_value}
    end,
    def default(:range_var) do
      {:error, :no_default_value}
    end,
    def default(:table_func) do
      {:error, :no_default_value}
    end,
    def default(:var) do
      {:error, :no_default_value}
    end,
    def default(:param) do
      {:error, :no_default_value}
    end,
    def default(:aggref) do
      {:error, :no_default_value}
    end,
    def default(:grouping_func) do
      {:error, :no_default_value}
    end,
    def default(:window_func) do
      {:error, :no_default_value}
    end,
    def default(:subscripting_ref) do
      {:error, :no_default_value}
    end,
    def default(:func_expr) do
      {:error, :no_default_value}
    end,
    def default(:named_arg_expr) do
      {:error, :no_default_value}
    end,
    def default(:op_expr) do
      {:error, :no_default_value}
    end,
    def default(:distinct_expr) do
      {:error, :no_default_value}
    end,
    def default(:null_if_expr) do
      {:error, :no_default_value}
    end,
    def default(:scalar_array_op_expr) do
      {:error, :no_default_value}
    end,
    def default(:bool_expr) do
      {:error, :no_default_value}
    end,
    def default(:sub_link) do
      {:error, :no_default_value}
    end,
    def default(:sub_plan) do
      {:error, :no_default_value}
    end,
    def default(:alternative_sub_plan) do
      {:error, :no_default_value}
    end,
    def default(:field_select) do
      {:error, :no_default_value}
    end,
    def default(:field_store) do
      {:error, :no_default_value}
    end,
    def default(:relabel_type) do
      {:error, :no_default_value}
    end,
    def default(:coerce_via_io) do
      {:error, :no_default_value}
    end,
    def default(:array_coerce_expr) do
      {:error, :no_default_value}
    end,
    def default(:convert_rowtype_expr) do
      {:error, :no_default_value}
    end,
    def default(:collate_expr) do
      {:error, :no_default_value}
    end,
    def default(:case_expr) do
      {:error, :no_default_value}
    end,
    def default(:case_when) do
      {:error, :no_default_value}
    end,
    def default(:case_test_expr) do
      {:error, :no_default_value}
    end,
    def default(:array_expr) do
      {:error, :no_default_value}
    end,
    def default(:row_expr) do
      {:error, :no_default_value}
    end,
    def default(:row_compare_expr) do
      {:error, :no_default_value}
    end,
    def default(:coalesce_expr) do
      {:error, :no_default_value}
    end,
    def default(:min_max_expr) do
      {:error, :no_default_value}
    end,
    def default(:sqlvalue_function) do
      {:error, :no_default_value}
    end,
    def default(:xml_expr) do
      {:error, :no_default_value}
    end,
    def default(:null_test) do
      {:error, :no_default_value}
    end,
    def default(:boolean_test) do
      {:error, :no_default_value}
    end,
    def default(:coerce_to_domain) do
      {:error, :no_default_value}
    end,
    def default(:coerce_to_domain_value) do
      {:error, :no_default_value}
    end,
    def default(:set_to_default) do
      {:error, :no_default_value}
    end,
    def default(:current_of_expr) do
      {:error, :no_default_value}
    end,
    def default(:next_value_expr) do
      {:error, :no_default_value}
    end,
    def default(:inference_elem) do
      {:error, :no_default_value}
    end,
    def default(:target_entry) do
      {:error, :no_default_value}
    end,
    def default(:range_tbl_ref) do
      {:error, :no_default_value}
    end,
    def default(:join_expr) do
      {:error, :no_default_value}
    end,
    def default(:from_expr) do
      {:error, :no_default_value}
    end,
    def default(:on_conflict_expr) do
      {:error, :no_default_value}
    end,
    def default(:into_clause) do
      {:error, :no_default_value}
    end,
    def default(:merge_action) do
      {:error, :no_default_value}
    end,
    def default(:raw_stmt) do
      {:error, :no_default_value}
    end,
    def default(:query) do
      {:error, :no_default_value}
    end,
    def default(:insert_stmt) do
      {:error, :no_default_value}
    end,
    def default(:delete_stmt) do
      {:error, :no_default_value}
    end,
    def default(:update_stmt) do
      {:error, :no_default_value}
    end,
    def default(:merge_stmt) do
      {:error, :no_default_value}
    end,
    def default(:select_stmt) do
      {:error, :no_default_value}
    end,
    def default(:return_stmt) do
      {:error, :no_default_value}
    end,
    def default(:plassign_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_table_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_table_cmd) do
      {:error, :no_default_value}
    end,
    def default(:alter_domain_stmt) do
      {:error, :no_default_value}
    end,
    def default(:set_operation_stmt) do
      {:error, :no_default_value}
    end,
    def default(:grant_stmt) do
      {:error, :no_default_value}
    end,
    def default(:grant_role_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_default_privileges_stmt) do
      {:error, :no_default_value}
    end,
    def default(:close_portal_stmt) do
      {:error, :no_default_value}
    end,
    def default(:cluster_stmt) do
      {:error, :no_default_value}
    end,
    def default(:copy_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_stmt) do
      {:error, :no_default_value}
    end,
    def default(:define_stmt) do
      {:error, :no_default_value}
    end,
    def default(:drop_stmt) do
      {:error, :no_default_value}
    end,
    def default(:truncate_stmt) do
      {:error, :no_default_value}
    end,
    def default(:comment_stmt) do
      {:error, :no_default_value}
    end,
    def default(:fetch_stmt) do
      {:error, :no_default_value}
    end,
    def default(:index_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_function_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_function_stmt) do
      {:error, :no_default_value}
    end,
    def default(:do_stmt) do
      {:error, :no_default_value}
    end,
    def default(:rename_stmt) do
      {:error, :no_default_value}
    end,
    def default(:rule_stmt) do
      {:error, :no_default_value}
    end,
    def default(:notify_stmt) do
      {:error, :no_default_value}
    end,
    def default(:listen_stmt) do
      {:error, :no_default_value}
    end,
    def default(:unlisten_stmt) do
      {:error, :no_default_value}
    end,
    def default(:transaction_stmt) do
      {:error, :no_default_value}
    end,
    def default(:view_stmt) do
      {:error, :no_default_value}
    end,
    def default(:load_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_domain_stmt) do
      {:error, :no_default_value}
    end,
    def default(:createdb_stmt) do
      {:error, :no_default_value}
    end,
    def default(:dropdb_stmt) do
      {:error, :no_default_value}
    end,
    def default(:vacuum_stmt) do
      {:error, :no_default_value}
    end,
    def default(:explain_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_table_as_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_seq_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_seq_stmt) do
      {:error, :no_default_value}
    end,
    def default(:variable_set_stmt) do
      {:error, :no_default_value}
    end,
    def default(:variable_show_stmt) do
      {:error, :no_default_value}
    end,
    def default(:discard_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_trig_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_plang_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_role_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_role_stmt) do
      {:error, :no_default_value}
    end,
    def default(:drop_role_stmt) do
      {:error, :no_default_value}
    end,
    def default(:lock_stmt) do
      {:error, :no_default_value}
    end,
    def default(:constraints_set_stmt) do
      {:error, :no_default_value}
    end,
    def default(:reindex_stmt) do
      {:error, :no_default_value}
    end,
    def default(:check_point_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_schema_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_database_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_database_refresh_coll_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_database_set_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_role_set_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_conversion_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_cast_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_op_class_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_op_family_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_op_family_stmt) do
      {:error, :no_default_value}
    end,
    def default(:prepare_stmt) do
      {:error, :no_default_value}
    end,
    def default(:execute_stmt) do
      {:error, :no_default_value}
    end,
    def default(:deallocate_stmt) do
      {:error, :no_default_value}
    end,
    def default(:declare_cursor_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_table_space_stmt) do
      {:error, :no_default_value}
    end,
    def default(:drop_table_space_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_object_depends_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_object_schema_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_owner_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_operator_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_type_stmt) do
      {:error, :no_default_value}
    end,
    def default(:drop_owned_stmt) do
      {:error, :no_default_value}
    end,
    def default(:reassign_owned_stmt) do
      {:error, :no_default_value}
    end,
    def default(:composite_type_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_enum_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_range_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_enum_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_tsdictionary_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_tsconfiguration_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_fdw_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_fdw_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_foreign_server_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_foreign_server_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_user_mapping_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_user_mapping_stmt) do
      {:error, :no_default_value}
    end,
    def default(:drop_user_mapping_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_table_space_options_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_table_move_all_stmt) do
      {:error, :no_default_value}
    end,
    def default(:sec_label_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_foreign_table_stmt) do
      {:error, :no_default_value}
    end,
    def default(:import_foreign_schema_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_extension_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_extension_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_extension_contents_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_event_trig_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_event_trig_stmt) do
      {:error, :no_default_value}
    end,
    def default(:refresh_mat_view_stmt) do
      {:error, :no_default_value}
    end,
    def default(:replica_identity_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_system_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_policy_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_policy_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_transform_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_am_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_publication_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_publication_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_subscription_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_subscription_stmt) do
      {:error, :no_default_value}
    end,
    def default(:drop_subscription_stmt) do
      {:error, :no_default_value}
    end,
    def default(:create_stats_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_collation_stmt) do
      {:error, :no_default_value}
    end,
    def default(:call_stmt) do
      {:error, :no_default_value}
    end,
    def default(:alter_stats_stmt) do
      {:error, :no_default_value}
    end,
    def default(:a_expr) do
      {:error, :no_default_value}
    end,
    def default(:column_ref) do
      {:error, :no_default_value}
    end,
    def default(:param_ref) do
      {:error, :no_default_value}
    end,
    def default(:func_call) do
      {:error, :no_default_value}
    end,
    def default(:a_star) do
      {:error, :no_default_value}
    end,
    def default(:a_indices) do
      {:error, :no_default_value}
    end,
    def default(:a_indirection) do
      {:error, :no_default_value}
    end,
    def default(:a_array_expr) do
      {:error, :no_default_value}
    end,
    def default(:res_target) do
      {:error, :no_default_value}
    end,
    def default(:multi_assign_ref) do
      {:error, :no_default_value}
    end,
    def default(:type_cast) do
      {:error, :no_default_value}
    end,
    def default(:collate_clause) do
      {:error, :no_default_value}
    end,
    def default(:sort_by) do
      {:error, :no_default_value}
    end,
    def default(:window_def) do
      {:error, :no_default_value}
    end,
    def default(:range_subselect) do
      {:error, :no_default_value}
    end,
    def default(:range_function) do
      {:error, :no_default_value}
    end,
    def default(:range_table_sample) do
      {:error, :no_default_value}
    end,
    def default(:range_table_func) do
      {:error, :no_default_value}
    end,
    def default(:range_table_func_col) do
      {:error, :no_default_value}
    end,
    def default(:type_name) do
      {:error, :no_default_value}
    end,
    def default(:column_def) do
      {:error, :no_default_value}
    end,
    def default(:index_elem) do
      {:error, :no_default_value}
    end,
    def default(:stats_elem) do
      {:error, :no_default_value}
    end,
    def default(:constraint) do
      {:error, :no_default_value}
    end,
    def default(:def_elem) do
      {:error, :no_default_value}
    end,
    def default(:range_tbl_entry) do
      {:error, :no_default_value}
    end,
    def default(:range_tbl_function) do
      {:error, :no_default_value}
    end,
    def default(:table_sample_clause) do
      {:error, :no_default_value}
    end,
    def default(:with_check_option) do
      {:error, :no_default_value}
    end,
    def default(:sort_group_clause) do
      {:error, :no_default_value}
    end,
    def default(:grouping_set) do
      {:error, :no_default_value}
    end,
    def default(:window_clause) do
      {:error, :no_default_value}
    end,
    def default(:object_with_args) do
      {:error, :no_default_value}
    end,
    def default(:access_priv) do
      {:error, :no_default_value}
    end,
    def default(:create_op_class_item) do
      {:error, :no_default_value}
    end,
    def default(:table_like_clause) do
      {:error, :no_default_value}
    end,
    def default(:function_parameter) do
      {:error, :no_default_value}
    end,
    def default(:locking_clause) do
      {:error, :no_default_value}
    end,
    def default(:row_mark_clause) do
      {:error, :no_default_value}
    end,
    def default(:xml_serialize) do
      {:error, :no_default_value}
    end,
    def default(:with_clause) do
      {:error, :no_default_value}
    end,
    def default(:infer_clause) do
      {:error, :no_default_value}
    end,
    def default(:on_conflict_clause) do
      {:error, :no_default_value}
    end,
    def default(:ctesearch_clause) do
      {:error, :no_default_value}
    end,
    def default(:ctecycle_clause) do
      {:error, :no_default_value}
    end,
    def default(:common_table_expr) do
      {:error, :no_default_value}
    end,
    def default(:merge_when_clause) do
      {:error, :no_default_value}
    end,
    def default(:role_spec) do
      {:error, :no_default_value}
    end,
    def default(:trigger_transition) do
      {:error, :no_default_value}
    end,
    def default(:partition_elem) do
      {:error, :no_default_value}
    end,
    def default(:partition_spec) do
      {:error, :no_default_value}
    end,
    def default(:partition_bound_spec) do
      {:error, :no_default_value}
    end,
    def default(:partition_range_datum) do
      {:error, :no_default_value}
    end,
    def default(:partition_cmd) do
      {:error, :no_default_value}
    end,
    def default(:vacuum_relation) do
      {:error, :no_default_value}
    end,
    def default(:publication_obj_spec) do
      {:error, :no_default_value}
    end,
    def default(:publication_table) do
      {:error, :no_default_value}
    end,
    def default(:inline_code_block) do
      {:error, :no_default_value}
    end,
    def default(:call_context) do
      {:error, :no_default_value}
    end,
    def default(:integer) do
      {:error, :no_default_value}
    end,
    def default(:float) do
      {:error, :no_default_value}
    end,
    def default(:boolean) do
      {:error, :no_default_value}
    end,
    def default(:string) do
      {:error, :no_default_value}
    end,
    def default(:bit_string) do
      {:error, :no_default_value}
    end,
    def default(:list) do
      {:error, :no_default_value}
    end,
    def default(:int_list) do
      {:error, :no_default_value}
    end,
    def default(:oid_list) do
      {:error, :no_default_value}
    end,
    def default(:a_const) do
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
