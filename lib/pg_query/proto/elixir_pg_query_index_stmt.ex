# credo:disable-for-this-file
defmodule PgQuery.IndexStmt do
  @moduledoc false
  defstruct idxname: "",
            relation: nil,
            access_method: "",
            table_space: "",
            index_params: [],
            index_including_params: [],
            options: [],
            where_clause: nil,
            exclude_op_names: [],
            idxcomment: "",
            index_oid: 0,
            old_node: 0,
            old_create_subid: 0,
            old_first_relfilenode_subid: 0,
            unique: false,
            nulls_not_distinct: false,
            primary: false,
            isconstraint: false,
            deferrable: false,
            initdeferred: false,
            transformed: false,
            concurrent: false,
            if_not_exists: false,
            reset_default_tblspc: false

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
        |> encode_idxname(msg)
        |> encode_relation(msg)
        |> encode_access_method(msg)
        |> encode_table_space(msg)
        |> encode_index_params(msg)
        |> encode_index_including_params(msg)
        |> encode_options(msg)
        |> encode_where_clause(msg)
        |> encode_exclude_op_names(msg)
        |> encode_idxcomment(msg)
        |> encode_index_oid(msg)
        |> encode_old_node(msg)
        |> encode_old_create_subid(msg)
        |> encode_old_first_relfilenode_subid(msg)
        |> encode_unique(msg)
        |> encode_nulls_not_distinct(msg)
        |> encode_primary(msg)
        |> encode_isconstraint(msg)
        |> encode_deferrable(msg)
        |> encode_initdeferred(msg)
        |> encode_transformed(msg)
        |> encode_concurrent(msg)
        |> encode_if_not_exists(msg)
        |> encode_reset_default_tblspc(msg)
      end
    )

    []

    [
      defp encode_idxname(acc, msg) do
        try do
          if msg.idxname == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.idxname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:idxname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_relation(acc, msg) do
        try do
          if msg.relation == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.relation)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:relation, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_access_method(acc, msg) do
        try do
          if msg.access_method == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.access_method)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:access_method, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_table_space(acc, msg) do
        try do
          if msg.table_space == "" do
            acc
          else
            [acc, "\"", Protox.Encode.encode_string(msg.table_space)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:table_space, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_index_params(acc, msg) do
        try do
          case msg.index_params do
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
            reraise Protox.EncodingError.new(:index_params, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_index_including_params(acc, msg) do
        try do
          case msg.index_including_params do
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
            reraise Protox.EncodingError.new(:index_including_params, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_options(acc, msg) do
        try do
          case msg.options do
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
            reraise Protox.EncodingError.new(:options, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_where_clause(acc, msg) do
        try do
          if msg.where_clause == nil do
            acc
          else
            [acc, "B", Protox.Encode.encode_message(msg.where_clause)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:where_clause, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_exclude_op_names(acc, msg) do
        try do
          case msg.exclude_op_names do
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
            reraise Protox.EncodingError.new(:exclude_op_names, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_idxcomment(acc, msg) do
        try do
          if msg.idxcomment == "" do
            acc
          else
            [acc, "R", Protox.Encode.encode_string(msg.idxcomment)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:idxcomment, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_index_oid(acc, msg) do
        try do
          if msg.index_oid == 0 do
            acc
          else
            [acc, "X", Protox.Encode.encode_uint32(msg.index_oid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:index_oid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_old_node(acc, msg) do
        try do
          if msg.old_node == 0 do
            acc
          else
            [acc, "`", Protox.Encode.encode_uint32(msg.old_node)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:old_node, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_old_create_subid(acc, msg) do
        try do
          if msg.old_create_subid == 0 do
            acc
          else
            [acc, "h", Protox.Encode.encode_uint32(msg.old_create_subid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:old_create_subid, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_old_first_relfilenode_subid(acc, msg) do
        try do
          if msg.old_first_relfilenode_subid == 0 do
            acc
          else
            [acc, "p", Protox.Encode.encode_uint32(msg.old_first_relfilenode_subid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:old_first_relfilenode_subid, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_unique(acc, msg) do
        try do
          if msg.unique == false do
            acc
          else
            [acc, "x", Protox.Encode.encode_bool(msg.unique)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:unique, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_nulls_not_distinct(acc, msg) do
        try do
          if msg.nulls_not_distinct == false do
            acc
          else
            [acc, "\x80\x01", Protox.Encode.encode_bool(msg.nulls_not_distinct)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:nulls_not_distinct, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_primary(acc, msg) do
        try do
          if msg.primary == false do
            acc
          else
            [acc, "\x88\x01", Protox.Encode.encode_bool(msg.primary)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:primary, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_isconstraint(acc, msg) do
        try do
          if msg.isconstraint == false do
            acc
          else
            [acc, "\x90\x01", Protox.Encode.encode_bool(msg.isconstraint)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:isconstraint, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_deferrable(acc, msg) do
        try do
          if msg.deferrable == false do
            acc
          else
            [acc, "\x98\x01", Protox.Encode.encode_bool(msg.deferrable)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:deferrable, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_initdeferred(acc, msg) do
        try do
          if msg.initdeferred == false do
            acc
          else
            [acc, "\xA0\x01", Protox.Encode.encode_bool(msg.initdeferred)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:initdeferred, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_transformed(acc, msg) do
        try do
          if msg.transformed == false do
            acc
          else
            [acc, "\xA8\x01", Protox.Encode.encode_bool(msg.transformed)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:transformed, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_concurrent(acc, msg) do
        try do
          if msg.concurrent == false do
            acc
          else
            [acc, "\xB0\x01", Protox.Encode.encode_bool(msg.concurrent)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:concurrent, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_if_not_exists(acc, msg) do
        try do
          if msg.if_not_exists == false do
            acc
          else
            [acc, "\xB8\x01", Protox.Encode.encode_bool(msg.if_not_exists)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:if_not_exists, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_reset_default_tblspc(acc, msg) do
        try do
          if msg.reset_default_tblspc == false do
            acc
          else
            [acc, "\xC0\x01", Protox.Encode.encode_bool(msg.reset_default_tblspc)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:reset_default_tblspc, "invalid field value"),
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
          parse_key_value(bytes, struct(PgQuery.IndexStmt))
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
              {[idxname: delimited], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 relation:
                   Protox.MergeMessage.merge(msg.relation, PgQuery.RangeVar.decode!(delimited))
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[access_method: delimited], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[table_space: delimited], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[index_params: msg.index_params ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 index_including_params:
                   msg.index_including_params ++ [PgQuery.Node.decode!(delimited)]
               ], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[options: msg.options ++ [PgQuery.Node.decode!(delimited)]], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 where_clause:
                   Protox.MergeMessage.merge(msg.where_clause, PgQuery.Node.decode!(delimited))
               ], rest}

            {9, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[exclude_op_names: msg.exclude_op_names ++ [PgQuery.Node.decode!(delimited)]],
               rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[idxcomment: delimited], rest}

            {11, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[index_oid: value], rest}

            {12, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[old_node: value], rest}

            {13, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[old_create_subid: value], rest}

            {14, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[old_first_relfilenode_subid: value], rest}

            {15, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[unique: value], rest}

            {16, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[nulls_not_distinct: value], rest}

            {17, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[primary: value], rest}

            {18, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[isconstraint: value], rest}

            {19, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[deferrable: value], rest}

            {20, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[initdeferred: value], rest}

            {21, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[transformed: value], rest}

            {22, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[concurrent: value], rest}

            {23, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[if_not_exists: value], rest}

            {24, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[reset_default_tblspc: value], rest}

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
        PgQuery.IndexStmt,
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
        1 => {:idxname, {:scalar, ""}, :string},
        2 => {:relation, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        3 => {:access_method, {:scalar, ""}, :string},
        4 => {:table_space, {:scalar, ""}, :string},
        5 => {:index_params, :unpacked, {:message, PgQuery.Node}},
        6 => {:index_including_params, :unpacked, {:message, PgQuery.Node}},
        7 => {:options, :unpacked, {:message, PgQuery.Node}},
        8 => {:where_clause, {:scalar, nil}, {:message, PgQuery.Node}},
        9 => {:exclude_op_names, :unpacked, {:message, PgQuery.Node}},
        10 => {:idxcomment, {:scalar, ""}, :string},
        11 => {:index_oid, {:scalar, 0}, :uint32},
        12 => {:old_node, {:scalar, 0}, :uint32},
        13 => {:old_create_subid, {:scalar, 0}, :uint32},
        14 => {:old_first_relfilenode_subid, {:scalar, 0}, :uint32},
        15 => {:unique, {:scalar, false}, :bool},
        16 => {:nulls_not_distinct, {:scalar, false}, :bool},
        17 => {:primary, {:scalar, false}, :bool},
        18 => {:isconstraint, {:scalar, false}, :bool},
        19 => {:deferrable, {:scalar, false}, :bool},
        20 => {:initdeferred, {:scalar, false}, :bool},
        21 => {:transformed, {:scalar, false}, :bool},
        22 => {:concurrent, {:scalar, false}, :bool},
        23 => {:if_not_exists, {:scalar, false}, :bool},
        24 => {:reset_default_tblspc, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        access_method: {3, {:scalar, ""}, :string},
        concurrent: {22, {:scalar, false}, :bool},
        deferrable: {19, {:scalar, false}, :bool},
        exclude_op_names: {9, :unpacked, {:message, PgQuery.Node}},
        idxcomment: {10, {:scalar, ""}, :string},
        idxname: {1, {:scalar, ""}, :string},
        if_not_exists: {23, {:scalar, false}, :bool},
        index_including_params: {6, :unpacked, {:message, PgQuery.Node}},
        index_oid: {11, {:scalar, 0}, :uint32},
        index_params: {5, :unpacked, {:message, PgQuery.Node}},
        initdeferred: {20, {:scalar, false}, :bool},
        isconstraint: {18, {:scalar, false}, :bool},
        nulls_not_distinct: {16, {:scalar, false}, :bool},
        old_create_subid: {13, {:scalar, 0}, :uint32},
        old_first_relfilenode_subid: {14, {:scalar, 0}, :uint32},
        old_node: {12, {:scalar, 0}, :uint32},
        options: {7, :unpacked, {:message, PgQuery.Node}},
        primary: {17, {:scalar, false}, :bool},
        relation: {2, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        reset_default_tblspc: {24, {:scalar, false}, :bool},
        table_space: {4, {:scalar, ""}, :string},
        transformed: {21, {:scalar, false}, :bool},
        unique: {15, {:scalar, false}, :bool},
        where_clause: {8, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "idxname",
          kind: {:scalar, ""},
          label: :optional,
          name: :idxname,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "relation",
          kind: {:scalar, nil},
          label: :optional,
          name: :relation,
          tag: 2,
          type: {:message, PgQuery.RangeVar}
        },
        %{
          __struct__: Protox.Field,
          json_name: "accessMethod",
          kind: {:scalar, ""},
          label: :optional,
          name: :access_method,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "tableSpace",
          kind: {:scalar, ""},
          label: :optional,
          name: :table_space,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "indexParams",
          kind: :unpacked,
          label: :repeated,
          name: :index_params,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "indexIncludingParams",
          kind: :unpacked,
          label: :repeated,
          name: :index_including_params,
          tag: 6,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "options",
          kind: :unpacked,
          label: :repeated,
          name: :options,
          tag: 7,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "whereClause",
          kind: {:scalar, nil},
          label: :optional,
          name: :where_clause,
          tag: 8,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "excludeOpNames",
          kind: :unpacked,
          label: :repeated,
          name: :exclude_op_names,
          tag: 9,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "idxcomment",
          kind: {:scalar, ""},
          label: :optional,
          name: :idxcomment,
          tag: 10,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "indexOid",
          kind: {:scalar, 0},
          label: :optional,
          name: :index_oid,
          tag: 11,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "oldNode",
          kind: {:scalar, 0},
          label: :optional,
          name: :old_node,
          tag: 12,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "oldCreateSubid",
          kind: {:scalar, 0},
          label: :optional,
          name: :old_create_subid,
          tag: 13,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "oldFirstRelfilenodeSubid",
          kind: {:scalar, 0},
          label: :optional,
          name: :old_first_relfilenode_subid,
          tag: 14,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "unique",
          kind: {:scalar, false},
          label: :optional,
          name: :unique,
          tag: 15,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "nullsNotDistinct",
          kind: {:scalar, false},
          label: :optional,
          name: :nulls_not_distinct,
          tag: 16,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "primary",
          kind: {:scalar, false},
          label: :optional,
          name: :primary,
          tag: 17,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "isconstraint",
          kind: {:scalar, false},
          label: :optional,
          name: :isconstraint,
          tag: 18,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "deferrable",
          kind: {:scalar, false},
          label: :optional,
          name: :deferrable,
          tag: 19,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "initdeferred",
          kind: {:scalar, false},
          label: :optional,
          name: :initdeferred,
          tag: 20,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "transformed",
          kind: {:scalar, false},
          label: :optional,
          name: :transformed,
          tag: 21,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "concurrent",
          kind: {:scalar, false},
          label: :optional,
          name: :concurrent,
          tag: 22,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "ifNotExists",
          kind: {:scalar, false},
          label: :optional,
          name: :if_not_exists,
          tag: 23,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "resetDefaultTblspc",
          kind: {:scalar, false},
          label: :optional,
          name: :reset_default_tblspc,
          tag: 24,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:idxname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "idxname",
             kind: {:scalar, ""},
             label: :optional,
             name: :idxname,
             tag: 1,
             type: :string
           }}
        end

        def field_def("idxname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "idxname",
             kind: {:scalar, ""},
             label: :optional,
             name: :idxname,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:relation) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relation",
             kind: {:scalar, nil},
             label: :optional,
             name: :relation,
             tag: 2,
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
             tag: 2,
             type: {:message, PgQuery.RangeVar}
           }}
        end

        []
      ),
      (
        def field_def(:access_method) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accessMethod",
             kind: {:scalar, ""},
             label: :optional,
             name: :access_method,
             tag: 3,
             type: :string
           }}
        end

        def field_def("accessMethod") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accessMethod",
             kind: {:scalar, ""},
             label: :optional,
             name: :access_method,
             tag: 3,
             type: :string
           }}
        end

        def field_def("access_method") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accessMethod",
             kind: {:scalar, ""},
             label: :optional,
             name: :access_method,
             tag: 3,
             type: :string
           }}
        end
      ),
      (
        def field_def(:table_space) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableSpace",
             kind: {:scalar, ""},
             label: :optional,
             name: :table_space,
             tag: 4,
             type: :string
           }}
        end

        def field_def("tableSpace") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableSpace",
             kind: {:scalar, ""},
             label: :optional,
             name: :table_space,
             tag: 4,
             type: :string
           }}
        end

        def field_def("table_space") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableSpace",
             kind: {:scalar, ""},
             label: :optional,
             name: :table_space,
             tag: 4,
             type: :string
           }}
        end
      ),
      (
        def field_def(:index_params) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexParams",
             kind: :unpacked,
             label: :repeated,
             name: :index_params,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("indexParams") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexParams",
             kind: :unpacked,
             label: :repeated,
             name: :index_params,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("index_params") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexParams",
             kind: :unpacked,
             label: :repeated,
             name: :index_params,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:index_including_params) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexIncludingParams",
             kind: :unpacked,
             label: :repeated,
             name: :index_including_params,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("indexIncludingParams") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexIncludingParams",
             kind: :unpacked,
             label: :repeated,
             name: :index_including_params,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("index_including_params") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexIncludingParams",
             kind: :unpacked,
             label: :repeated,
             name: :index_including_params,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:options) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "options",
             kind: :unpacked,
             label: :repeated,
             name: :options,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("options") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "options",
             kind: :unpacked,
             label: :repeated,
             name: :options,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        []
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
             tag: 8,
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
             tag: 8,
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
             tag: 8,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:exclude_op_names) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "excludeOpNames",
             kind: :unpacked,
             label: :repeated,
             name: :exclude_op_names,
             tag: 9,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("excludeOpNames") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "excludeOpNames",
             kind: :unpacked,
             label: :repeated,
             name: :exclude_op_names,
             tag: 9,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("exclude_op_names") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "excludeOpNames",
             kind: :unpacked,
             label: :repeated,
             name: :exclude_op_names,
             tag: 9,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:idxcomment) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "idxcomment",
             kind: {:scalar, ""},
             label: :optional,
             name: :idxcomment,
             tag: 10,
             type: :string
           }}
        end

        def field_def("idxcomment") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "idxcomment",
             kind: {:scalar, ""},
             label: :optional,
             name: :idxcomment,
             tag: 10,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:index_oid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexOid",
             kind: {:scalar, 0},
             label: :optional,
             name: :index_oid,
             tag: 11,
             type: :uint32
           }}
        end

        def field_def("indexOid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexOid",
             kind: {:scalar, 0},
             label: :optional,
             name: :index_oid,
             tag: 11,
             type: :uint32
           }}
        end

        def field_def("index_oid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexOid",
             kind: {:scalar, 0},
             label: :optional,
             name: :index_oid,
             tag: 11,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:old_node) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldNode",
             kind: {:scalar, 0},
             label: :optional,
             name: :old_node,
             tag: 12,
             type: :uint32
           }}
        end

        def field_def("oldNode") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldNode",
             kind: {:scalar, 0},
             label: :optional,
             name: :old_node,
             tag: 12,
             type: :uint32
           }}
        end

        def field_def("old_node") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldNode",
             kind: {:scalar, 0},
             label: :optional,
             name: :old_node,
             tag: 12,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:old_create_subid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldCreateSubid",
             kind: {:scalar, 0},
             label: :optional,
             name: :old_create_subid,
             tag: 13,
             type: :uint32
           }}
        end

        def field_def("oldCreateSubid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldCreateSubid",
             kind: {:scalar, 0},
             label: :optional,
             name: :old_create_subid,
             tag: 13,
             type: :uint32
           }}
        end

        def field_def("old_create_subid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldCreateSubid",
             kind: {:scalar, 0},
             label: :optional,
             name: :old_create_subid,
             tag: 13,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:old_first_relfilenode_subid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldFirstRelfilenodeSubid",
             kind: {:scalar, 0},
             label: :optional,
             name: :old_first_relfilenode_subid,
             tag: 14,
             type: :uint32
           }}
        end

        def field_def("oldFirstRelfilenodeSubid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldFirstRelfilenodeSubid",
             kind: {:scalar, 0},
             label: :optional,
             name: :old_first_relfilenode_subid,
             tag: 14,
             type: :uint32
           }}
        end

        def field_def("old_first_relfilenode_subid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldFirstRelfilenodeSubid",
             kind: {:scalar, 0},
             label: :optional,
             name: :old_first_relfilenode_subid,
             tag: 14,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:unique) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "unique",
             kind: {:scalar, false},
             label: :optional,
             name: :unique,
             tag: 15,
             type: :bool
           }}
        end

        def field_def("unique") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "unique",
             kind: {:scalar, false},
             label: :optional,
             name: :unique,
             tag: 15,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:nulls_not_distinct) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nullsNotDistinct",
             kind: {:scalar, false},
             label: :optional,
             name: :nulls_not_distinct,
             tag: 16,
             type: :bool
           }}
        end

        def field_def("nullsNotDistinct") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nullsNotDistinct",
             kind: {:scalar, false},
             label: :optional,
             name: :nulls_not_distinct,
             tag: 16,
             type: :bool
           }}
        end

        def field_def("nulls_not_distinct") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nullsNotDistinct",
             kind: {:scalar, false},
             label: :optional,
             name: :nulls_not_distinct,
             tag: 16,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:primary) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "primary",
             kind: {:scalar, false},
             label: :optional,
             name: :primary,
             tag: 17,
             type: :bool
           }}
        end

        def field_def("primary") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "primary",
             kind: {:scalar, false},
             label: :optional,
             name: :primary,
             tag: 17,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:isconstraint) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isconstraint",
             kind: {:scalar, false},
             label: :optional,
             name: :isconstraint,
             tag: 18,
             type: :bool
           }}
        end

        def field_def("isconstraint") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isconstraint",
             kind: {:scalar, false},
             label: :optional,
             name: :isconstraint,
             tag: 18,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:deferrable) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "deferrable",
             kind: {:scalar, false},
             label: :optional,
             name: :deferrable,
             tag: 19,
             type: :bool
           }}
        end

        def field_def("deferrable") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "deferrable",
             kind: {:scalar, false},
             label: :optional,
             name: :deferrable,
             tag: 19,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:initdeferred) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "initdeferred",
             kind: {:scalar, false},
             label: :optional,
             name: :initdeferred,
             tag: 20,
             type: :bool
           }}
        end

        def field_def("initdeferred") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "initdeferred",
             kind: {:scalar, false},
             label: :optional,
             name: :initdeferred,
             tag: 20,
             type: :bool
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
             tag: 21,
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
             tag: 21,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:concurrent) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "concurrent",
             kind: {:scalar, false},
             label: :optional,
             name: :concurrent,
             tag: 22,
             type: :bool
           }}
        end

        def field_def("concurrent") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "concurrent",
             kind: {:scalar, false},
             label: :optional,
             name: :concurrent,
             tag: 22,
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
             tag: 23,
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
             tag: 23,
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
             tag: 23,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:reset_default_tblspc) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resetDefaultTblspc",
             kind: {:scalar, false},
             label: :optional,
             name: :reset_default_tblspc,
             tag: 24,
             type: :bool
           }}
        end

        def field_def("resetDefaultTblspc") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resetDefaultTblspc",
             kind: {:scalar, false},
             label: :optional,
             name: :reset_default_tblspc,
             tag: 24,
             type: :bool
           }}
        end

        def field_def("reset_default_tblspc") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resetDefaultTblspc",
             kind: {:scalar, false},
             label: :optional,
             name: :reset_default_tblspc,
             tag: 24,
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
    def default(:idxname) do
      {:ok, ""}
    end,
    def default(:relation) do
      {:ok, nil}
    end,
    def default(:access_method) do
      {:ok, ""}
    end,
    def default(:table_space) do
      {:ok, ""}
    end,
    def default(:index_params) do
      {:error, :no_default_value}
    end,
    def default(:index_including_params) do
      {:error, :no_default_value}
    end,
    def default(:options) do
      {:error, :no_default_value}
    end,
    def default(:where_clause) do
      {:ok, nil}
    end,
    def default(:exclude_op_names) do
      {:error, :no_default_value}
    end,
    def default(:idxcomment) do
      {:ok, ""}
    end,
    def default(:index_oid) do
      {:ok, 0}
    end,
    def default(:old_node) do
      {:ok, 0}
    end,
    def default(:old_create_subid) do
      {:ok, 0}
    end,
    def default(:old_first_relfilenode_subid) do
      {:ok, 0}
    end,
    def default(:unique) do
      {:ok, false}
    end,
    def default(:nulls_not_distinct) do
      {:ok, false}
    end,
    def default(:primary) do
      {:ok, false}
    end,
    def default(:isconstraint) do
      {:ok, false}
    end,
    def default(:deferrable) do
      {:ok, false}
    end,
    def default(:initdeferred) do
      {:ok, false}
    end,
    def default(:transformed) do
      {:ok, false}
    end,
    def default(:concurrent) do
      {:ok, false}
    end,
    def default(:if_not_exists) do
      {:ok, false}
    end,
    def default(:reset_default_tblspc) do
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
