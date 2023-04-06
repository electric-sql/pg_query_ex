# credo:disable-for-this-file
defmodule PgQuery.Constraint do
  @moduledoc false
  defstruct contype: :CONSTR_TYPE_UNDEFINED,
            conname: "",
            deferrable: false,
            initdeferred: false,
            location: 0,
            is_no_inherit: false,
            raw_expr: nil,
            cooked_expr: "",
            generated_when: "",
            nulls_not_distinct: false,
            keys: [],
            including: [],
            exclusions: [],
            options: [],
            indexname: "",
            indexspace: "",
            reset_default_tblspc: false,
            access_method: "",
            where_clause: nil,
            pktable: nil,
            fk_attrs: [],
            pk_attrs: [],
            fk_matchtype: "",
            fk_upd_action: "",
            fk_del_action: "",
            fk_del_set_cols: [],
            old_conpfeqop: [],
            old_pktable_oid: 0,
            skip_validation: false,
            initially_valid: false

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
        |> encode_contype(msg)
        |> encode_conname(msg)
        |> encode_deferrable(msg)
        |> encode_initdeferred(msg)
        |> encode_location(msg)
        |> encode_is_no_inherit(msg)
        |> encode_raw_expr(msg)
        |> encode_cooked_expr(msg)
        |> encode_generated_when(msg)
        |> encode_nulls_not_distinct(msg)
        |> encode_keys(msg)
        |> encode_including(msg)
        |> encode_exclusions(msg)
        |> encode_options(msg)
        |> encode_indexname(msg)
        |> encode_indexspace(msg)
        |> encode_reset_default_tblspc(msg)
        |> encode_access_method(msg)
        |> encode_where_clause(msg)
        |> encode_pktable(msg)
        |> encode_fk_attrs(msg)
        |> encode_pk_attrs(msg)
        |> encode_fk_matchtype(msg)
        |> encode_fk_upd_action(msg)
        |> encode_fk_del_action(msg)
        |> encode_fk_del_set_cols(msg)
        |> encode_old_conpfeqop(msg)
        |> encode_old_pktable_oid(msg)
        |> encode_skip_validation(msg)
        |> encode_initially_valid(msg)
      end
    )

    []

    [
      defp encode_contype(acc, msg) do
        try do
          if msg.contype == :CONSTR_TYPE_UNDEFINED do
            acc
          else
            [acc, "\b", msg.contype |> PgQuery.ConstrType.encode() |> Protox.Encode.encode_enum()]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:contype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_conname(acc, msg) do
        try do
          if msg.conname == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.conname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:conname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_deferrable(acc, msg) do
        try do
          if msg.deferrable == false do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_bool(msg.deferrable)]
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
            [acc, " ", Protox.Encode.encode_bool(msg.initdeferred)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:initdeferred, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_int32(msg.location)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:location, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_is_no_inherit(acc, msg) do
        try do
          if msg.is_no_inherit == false do
            acc
          else
            [acc, "0", Protox.Encode.encode_bool(msg.is_no_inherit)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_no_inherit, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_raw_expr(acc, msg) do
        try do
          if msg.raw_expr == nil do
            acc
          else
            [acc, ":", Protox.Encode.encode_message(msg.raw_expr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:raw_expr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_cooked_expr(acc, msg) do
        try do
          if msg.cooked_expr == "" do
            acc
          else
            [acc, "B", Protox.Encode.encode_string(msg.cooked_expr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:cooked_expr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_generated_when(acc, msg) do
        try do
          if msg.generated_when == "" do
            acc
          else
            [acc, "J", Protox.Encode.encode_string(msg.generated_when)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:generated_when, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_nulls_not_distinct(acc, msg) do
        try do
          if msg.nulls_not_distinct == false do
            acc
          else
            [acc, "P", Protox.Encode.encode_bool(msg.nulls_not_distinct)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:nulls_not_distinct, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_keys(acc, msg) do
        try do
          case msg.keys do
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
            reraise Protox.EncodingError.new(:keys, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_including(acc, msg) do
        try do
          case msg.including do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "b", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:including, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_exclusions(acc, msg) do
        try do
          case msg.exclusions do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "j", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:exclusions, "invalid field value"), __STACKTRACE__
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
                  [acc, "r", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:options, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_indexname(acc, msg) do
        try do
          if msg.indexname == "" do
            acc
          else
            [acc, "z", Protox.Encode.encode_string(msg.indexname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:indexname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_indexspace(acc, msg) do
        try do
          if msg.indexspace == "" do
            acc
          else
            [acc, "\x82\x01", Protox.Encode.encode_string(msg.indexspace)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:indexspace, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_reset_default_tblspc(acc, msg) do
        try do
          if msg.reset_default_tblspc == false do
            acc
          else
            [acc, "\x88\x01", Protox.Encode.encode_bool(msg.reset_default_tblspc)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:reset_default_tblspc, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_access_method(acc, msg) do
        try do
          if msg.access_method == "" do
            acc
          else
            [acc, "\x92\x01", Protox.Encode.encode_string(msg.access_method)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:access_method, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_where_clause(acc, msg) do
        try do
          if msg.where_clause == nil do
            acc
          else
            [acc, "\x9A\x01", Protox.Encode.encode_message(msg.where_clause)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:where_clause, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_pktable(acc, msg) do
        try do
          if msg.pktable == nil do
            acc
          else
            [acc, "\xA2\x01", Protox.Encode.encode_message(msg.pktable)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:pktable, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_fk_attrs(acc, msg) do
        try do
          case msg.fk_attrs do
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
            reraise Protox.EncodingError.new(:fk_attrs, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_pk_attrs(acc, msg) do
        try do
          case msg.pk_attrs do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\xB2\x01", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:pk_attrs, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_fk_matchtype(acc, msg) do
        try do
          if msg.fk_matchtype == "" do
            acc
          else
            [acc, "\xBA\x01", Protox.Encode.encode_string(msg.fk_matchtype)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:fk_matchtype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_fk_upd_action(acc, msg) do
        try do
          if msg.fk_upd_action == "" do
            acc
          else
            [acc, "\xC2\x01", Protox.Encode.encode_string(msg.fk_upd_action)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:fk_upd_action, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_fk_del_action(acc, msg) do
        try do
          if msg.fk_del_action == "" do
            acc
          else
            [acc, "\xCA\x01", Protox.Encode.encode_string(msg.fk_del_action)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:fk_del_action, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_fk_del_set_cols(acc, msg) do
        try do
          case msg.fk_del_set_cols do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\xD2\x01", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:fk_del_set_cols, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_old_conpfeqop(acc, msg) do
        try do
          case msg.old_conpfeqop do
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
            reraise Protox.EncodingError.new(:old_conpfeqop, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_old_pktable_oid(acc, msg) do
        try do
          if msg.old_pktable_oid == 0 do
            acc
          else
            [acc, "\xE0\x01", Protox.Encode.encode_uint32(msg.old_pktable_oid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:old_pktable_oid, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_skip_validation(acc, msg) do
        try do
          if msg.skip_validation == false do
            acc
          else
            [acc, "\xE8\x01", Protox.Encode.encode_bool(msg.skip_validation)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:skip_validation, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_initially_valid(acc, msg) do
        try do
          if msg.initially_valid == false do
            acc
          else
            [acc, "\xF0\x01", Protox.Encode.encode_bool(msg.initially_valid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:initially_valid, "invalid field value"),
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
          parse_key_value(bytes, struct(PgQuery.Constraint))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.ConstrType)
              {[contype: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[conname: delimited], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[deferrable: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[initdeferred: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[location: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_no_inherit: value], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 raw_expr:
                   Protox.MergeMessage.merge(msg.raw_expr, PgQuery.Node.decode!(delimited))
               ], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[cooked_expr: delimited], rest}

            {9, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[generated_when: delimited], rest}

            {10, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[nulls_not_distinct: value], rest}

            {11, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[keys: msg.keys ++ [PgQuery.Node.decode!(delimited)]], rest}

            {12, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[including: msg.including ++ [PgQuery.Node.decode!(delimited)]], rest}

            {13, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[exclusions: msg.exclusions ++ [PgQuery.Node.decode!(delimited)]], rest}

            {14, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[options: msg.options ++ [PgQuery.Node.decode!(delimited)]], rest}

            {15, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[indexname: delimited], rest}

            {16, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[indexspace: delimited], rest}

            {17, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[reset_default_tblspc: value], rest}

            {18, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[access_method: delimited], rest}

            {19, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 where_clause:
                   Protox.MergeMessage.merge(msg.where_clause, PgQuery.Node.decode!(delimited))
               ], rest}

            {20, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 pktable:
                   Protox.MergeMessage.merge(msg.pktable, PgQuery.RangeVar.decode!(delimited))
               ], rest}

            {21, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[fk_attrs: msg.fk_attrs ++ [PgQuery.Node.decode!(delimited)]], rest}

            {22, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[pk_attrs: msg.pk_attrs ++ [PgQuery.Node.decode!(delimited)]], rest}

            {23, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[fk_matchtype: delimited], rest}

            {24, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[fk_upd_action: delimited], rest}

            {25, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[fk_del_action: delimited], rest}

            {26, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[fk_del_set_cols: msg.fk_del_set_cols ++ [PgQuery.Node.decode!(delimited)]], rest}

            {27, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[old_conpfeqop: msg.old_conpfeqop ++ [PgQuery.Node.decode!(delimited)]], rest}

            {28, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[old_pktable_oid: value], rest}

            {29, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[skip_validation: value], rest}

            {30, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[initially_valid: value], rest}

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
        PgQuery.Constraint,
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
        1 => {:contype, {:scalar, :CONSTR_TYPE_UNDEFINED}, {:enum, PgQuery.ConstrType}},
        2 => {:conname, {:scalar, ""}, :string},
        3 => {:deferrable, {:scalar, false}, :bool},
        4 => {:initdeferred, {:scalar, false}, :bool},
        5 => {:location, {:scalar, 0}, :int32},
        6 => {:is_no_inherit, {:scalar, false}, :bool},
        7 => {:raw_expr, {:scalar, nil}, {:message, PgQuery.Node}},
        8 => {:cooked_expr, {:scalar, ""}, :string},
        9 => {:generated_when, {:scalar, ""}, :string},
        10 => {:nulls_not_distinct, {:scalar, false}, :bool},
        11 => {:keys, :unpacked, {:message, PgQuery.Node}},
        12 => {:including, :unpacked, {:message, PgQuery.Node}},
        13 => {:exclusions, :unpacked, {:message, PgQuery.Node}},
        14 => {:options, :unpacked, {:message, PgQuery.Node}},
        15 => {:indexname, {:scalar, ""}, :string},
        16 => {:indexspace, {:scalar, ""}, :string},
        17 => {:reset_default_tblspc, {:scalar, false}, :bool},
        18 => {:access_method, {:scalar, ""}, :string},
        19 => {:where_clause, {:scalar, nil}, {:message, PgQuery.Node}},
        20 => {:pktable, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        21 => {:fk_attrs, :unpacked, {:message, PgQuery.Node}},
        22 => {:pk_attrs, :unpacked, {:message, PgQuery.Node}},
        23 => {:fk_matchtype, {:scalar, ""}, :string},
        24 => {:fk_upd_action, {:scalar, ""}, :string},
        25 => {:fk_del_action, {:scalar, ""}, :string},
        26 => {:fk_del_set_cols, :unpacked, {:message, PgQuery.Node}},
        27 => {:old_conpfeqop, :unpacked, {:message, PgQuery.Node}},
        28 => {:old_pktable_oid, {:scalar, 0}, :uint32},
        29 => {:skip_validation, {:scalar, false}, :bool},
        30 => {:initially_valid, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        access_method: {18, {:scalar, ""}, :string},
        conname: {2, {:scalar, ""}, :string},
        contype: {1, {:scalar, :CONSTR_TYPE_UNDEFINED}, {:enum, PgQuery.ConstrType}},
        cooked_expr: {8, {:scalar, ""}, :string},
        deferrable: {3, {:scalar, false}, :bool},
        exclusions: {13, :unpacked, {:message, PgQuery.Node}},
        fk_attrs: {21, :unpacked, {:message, PgQuery.Node}},
        fk_del_action: {25, {:scalar, ""}, :string},
        fk_del_set_cols: {26, :unpacked, {:message, PgQuery.Node}},
        fk_matchtype: {23, {:scalar, ""}, :string},
        fk_upd_action: {24, {:scalar, ""}, :string},
        generated_when: {9, {:scalar, ""}, :string},
        including: {12, :unpacked, {:message, PgQuery.Node}},
        indexname: {15, {:scalar, ""}, :string},
        indexspace: {16, {:scalar, ""}, :string},
        initdeferred: {4, {:scalar, false}, :bool},
        initially_valid: {30, {:scalar, false}, :bool},
        is_no_inherit: {6, {:scalar, false}, :bool},
        keys: {11, :unpacked, {:message, PgQuery.Node}},
        location: {5, {:scalar, 0}, :int32},
        nulls_not_distinct: {10, {:scalar, false}, :bool},
        old_conpfeqop: {27, :unpacked, {:message, PgQuery.Node}},
        old_pktable_oid: {28, {:scalar, 0}, :uint32},
        options: {14, :unpacked, {:message, PgQuery.Node}},
        pk_attrs: {22, :unpacked, {:message, PgQuery.Node}},
        pktable: {20, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        raw_expr: {7, {:scalar, nil}, {:message, PgQuery.Node}},
        reset_default_tblspc: {17, {:scalar, false}, :bool},
        skip_validation: {29, {:scalar, false}, :bool},
        where_clause: {19, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "contype",
          kind: {:scalar, :CONSTR_TYPE_UNDEFINED},
          label: :optional,
          name: :contype,
          tag: 1,
          type: {:enum, PgQuery.ConstrType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "conname",
          kind: {:scalar, ""},
          label: :optional,
          name: :conname,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "deferrable",
          kind: {:scalar, false},
          label: :optional,
          name: :deferrable,
          tag: 3,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "initdeferred",
          kind: {:scalar, false},
          label: :optional,
          name: :initdeferred,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 5,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "isNoInherit",
          kind: {:scalar, false},
          label: :optional,
          name: :is_no_inherit,
          tag: 6,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "rawExpr",
          kind: {:scalar, nil},
          label: :optional,
          name: :raw_expr,
          tag: 7,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "cookedExpr",
          kind: {:scalar, ""},
          label: :optional,
          name: :cooked_expr,
          tag: 8,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "generatedWhen",
          kind: {:scalar, ""},
          label: :optional,
          name: :generated_when,
          tag: 9,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "nullsNotDistinct",
          kind: {:scalar, false},
          label: :optional,
          name: :nulls_not_distinct,
          tag: 10,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "keys",
          kind: :unpacked,
          label: :repeated,
          name: :keys,
          tag: 11,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "including",
          kind: :unpacked,
          label: :repeated,
          name: :including,
          tag: 12,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "exclusions",
          kind: :unpacked,
          label: :repeated,
          name: :exclusions,
          tag: 13,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "options",
          kind: :unpacked,
          label: :repeated,
          name: :options,
          tag: 14,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "indexname",
          kind: {:scalar, ""},
          label: :optional,
          name: :indexname,
          tag: 15,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "indexspace",
          kind: {:scalar, ""},
          label: :optional,
          name: :indexspace,
          tag: 16,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "resetDefaultTblspc",
          kind: {:scalar, false},
          label: :optional,
          name: :reset_default_tblspc,
          tag: 17,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "accessMethod",
          kind: {:scalar, ""},
          label: :optional,
          name: :access_method,
          tag: 18,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "whereClause",
          kind: {:scalar, nil},
          label: :optional,
          name: :where_clause,
          tag: 19,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "pktable",
          kind: {:scalar, nil},
          label: :optional,
          name: :pktable,
          tag: 20,
          type: {:message, PgQuery.RangeVar}
        },
        %{
          __struct__: Protox.Field,
          json_name: "fkAttrs",
          kind: :unpacked,
          label: :repeated,
          name: :fk_attrs,
          tag: 21,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "pkAttrs",
          kind: :unpacked,
          label: :repeated,
          name: :pk_attrs,
          tag: 22,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "fkMatchtype",
          kind: {:scalar, ""},
          label: :optional,
          name: :fk_matchtype,
          tag: 23,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "fkUpdAction",
          kind: {:scalar, ""},
          label: :optional,
          name: :fk_upd_action,
          tag: 24,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "fkDelAction",
          kind: {:scalar, ""},
          label: :optional,
          name: :fk_del_action,
          tag: 25,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "fkDelSetCols",
          kind: :unpacked,
          label: :repeated,
          name: :fk_del_set_cols,
          tag: 26,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "oldConpfeqop",
          kind: :unpacked,
          label: :repeated,
          name: :old_conpfeqop,
          tag: 27,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "oldPktableOid",
          kind: {:scalar, 0},
          label: :optional,
          name: :old_pktable_oid,
          tag: 28,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "skipValidation",
          kind: {:scalar, false},
          label: :optional,
          name: :skip_validation,
          tag: 29,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "initiallyValid",
          kind: {:scalar, false},
          label: :optional,
          name: :initially_valid,
          tag: 30,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:contype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contype",
             kind: {:scalar, :CONSTR_TYPE_UNDEFINED},
             label: :optional,
             name: :contype,
             tag: 1,
             type: {:enum, PgQuery.ConstrType}
           }}
        end

        def field_def("contype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contype",
             kind: {:scalar, :CONSTR_TYPE_UNDEFINED},
             label: :optional,
             name: :contype,
             tag: 1,
             type: {:enum, PgQuery.ConstrType}
           }}
        end

        []
      ),
      (
        def field_def(:conname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "conname",
             kind: {:scalar, ""},
             label: :optional,
             name: :conname,
             tag: 2,
             type: :string
           }}
        end

        def field_def("conname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "conname",
             kind: {:scalar, ""},
             label: :optional,
             name: :conname,
             tag: 2,
             type: :string
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
             tag: 3,
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
             tag: 3,
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
             tag: 4,
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
             tag: 4,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:location) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "location",
             kind: {:scalar, 0},
             label: :optional,
             name: :location,
             tag: 5,
             type: :int32
           }}
        end

        def field_def("location") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "location",
             kind: {:scalar, 0},
             label: :optional,
             name: :location,
             tag: 5,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:is_no_inherit) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isNoInherit",
             kind: {:scalar, false},
             label: :optional,
             name: :is_no_inherit,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("isNoInherit") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isNoInherit",
             kind: {:scalar, false},
             label: :optional,
             name: :is_no_inherit,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("is_no_inherit") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isNoInherit",
             kind: {:scalar, false},
             label: :optional,
             name: :is_no_inherit,
             tag: 6,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:raw_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rawExpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :raw_expr,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("rawExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rawExpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :raw_expr,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("raw_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rawExpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :raw_expr,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:cooked_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cookedExpr",
             kind: {:scalar, ""},
             label: :optional,
             name: :cooked_expr,
             tag: 8,
             type: :string
           }}
        end

        def field_def("cookedExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cookedExpr",
             kind: {:scalar, ""},
             label: :optional,
             name: :cooked_expr,
             tag: 8,
             type: :string
           }}
        end

        def field_def("cooked_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cookedExpr",
             kind: {:scalar, ""},
             label: :optional,
             name: :cooked_expr,
             tag: 8,
             type: :string
           }}
        end
      ),
      (
        def field_def(:generated_when) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "generatedWhen",
             kind: {:scalar, ""},
             label: :optional,
             name: :generated_when,
             tag: 9,
             type: :string
           }}
        end

        def field_def("generatedWhen") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "generatedWhen",
             kind: {:scalar, ""},
             label: :optional,
             name: :generated_when,
             tag: 9,
             type: :string
           }}
        end

        def field_def("generated_when") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "generatedWhen",
             kind: {:scalar, ""},
             label: :optional,
             name: :generated_when,
             tag: 9,
             type: :string
           }}
        end
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
             tag: 10,
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
             tag: 10,
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
             tag: 10,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:keys) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "keys",
             kind: :unpacked,
             label: :repeated,
             name: :keys,
             tag: 11,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("keys") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "keys",
             kind: :unpacked,
             label: :repeated,
             name: :keys,
             tag: 11,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:including) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "including",
             kind: :unpacked,
             label: :repeated,
             name: :including,
             tag: 12,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("including") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "including",
             kind: :unpacked,
             label: :repeated,
             name: :including,
             tag: 12,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:exclusions) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "exclusions",
             kind: :unpacked,
             label: :repeated,
             name: :exclusions,
             tag: 13,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("exclusions") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "exclusions",
             kind: :unpacked,
             label: :repeated,
             name: :exclusions,
             tag: 13,
             type: {:message, PgQuery.Node}
           }}
        end

        []
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
             tag: 14,
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
             tag: 14,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:indexname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexname",
             kind: {:scalar, ""},
             label: :optional,
             name: :indexname,
             tag: 15,
             type: :string
           }}
        end

        def field_def("indexname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexname",
             kind: {:scalar, ""},
             label: :optional,
             name: :indexname,
             tag: 15,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:indexspace) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexspace",
             kind: {:scalar, ""},
             label: :optional,
             name: :indexspace,
             tag: 16,
             type: :string
           }}
        end

        def field_def("indexspace") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexspace",
             kind: {:scalar, ""},
             label: :optional,
             name: :indexspace,
             tag: 16,
             type: :string
           }}
        end

        []
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
             tag: 17,
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
             tag: 17,
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
             tag: 17,
             type: :bool
           }}
        end
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
             tag: 18,
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
             tag: 18,
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
             tag: 18,
             type: :string
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
             tag: 19,
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
             tag: 19,
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
             tag: 19,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:pktable) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pktable",
             kind: {:scalar, nil},
             label: :optional,
             name: :pktable,
             tag: 20,
             type: {:message, PgQuery.RangeVar}
           }}
        end

        def field_def("pktable") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pktable",
             kind: {:scalar, nil},
             label: :optional,
             name: :pktable,
             tag: 20,
             type: {:message, PgQuery.RangeVar}
           }}
        end

        []
      ),
      (
        def field_def(:fk_attrs) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fkAttrs",
             kind: :unpacked,
             label: :repeated,
             name: :fk_attrs,
             tag: 21,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("fkAttrs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fkAttrs",
             kind: :unpacked,
             label: :repeated,
             name: :fk_attrs,
             tag: 21,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("fk_attrs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fkAttrs",
             kind: :unpacked,
             label: :repeated,
             name: :fk_attrs,
             tag: 21,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:pk_attrs) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pkAttrs",
             kind: :unpacked,
             label: :repeated,
             name: :pk_attrs,
             tag: 22,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("pkAttrs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pkAttrs",
             kind: :unpacked,
             label: :repeated,
             name: :pk_attrs,
             tag: 22,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("pk_attrs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pkAttrs",
             kind: :unpacked,
             label: :repeated,
             name: :pk_attrs,
             tag: 22,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:fk_matchtype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fkMatchtype",
             kind: {:scalar, ""},
             label: :optional,
             name: :fk_matchtype,
             tag: 23,
             type: :string
           }}
        end

        def field_def("fkMatchtype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fkMatchtype",
             kind: {:scalar, ""},
             label: :optional,
             name: :fk_matchtype,
             tag: 23,
             type: :string
           }}
        end

        def field_def("fk_matchtype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fkMatchtype",
             kind: {:scalar, ""},
             label: :optional,
             name: :fk_matchtype,
             tag: 23,
             type: :string
           }}
        end
      ),
      (
        def field_def(:fk_upd_action) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fkUpdAction",
             kind: {:scalar, ""},
             label: :optional,
             name: :fk_upd_action,
             tag: 24,
             type: :string
           }}
        end

        def field_def("fkUpdAction") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fkUpdAction",
             kind: {:scalar, ""},
             label: :optional,
             name: :fk_upd_action,
             tag: 24,
             type: :string
           }}
        end

        def field_def("fk_upd_action") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fkUpdAction",
             kind: {:scalar, ""},
             label: :optional,
             name: :fk_upd_action,
             tag: 24,
             type: :string
           }}
        end
      ),
      (
        def field_def(:fk_del_action) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fkDelAction",
             kind: {:scalar, ""},
             label: :optional,
             name: :fk_del_action,
             tag: 25,
             type: :string
           }}
        end

        def field_def("fkDelAction") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fkDelAction",
             kind: {:scalar, ""},
             label: :optional,
             name: :fk_del_action,
             tag: 25,
             type: :string
           }}
        end

        def field_def("fk_del_action") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fkDelAction",
             kind: {:scalar, ""},
             label: :optional,
             name: :fk_del_action,
             tag: 25,
             type: :string
           }}
        end
      ),
      (
        def field_def(:fk_del_set_cols) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fkDelSetCols",
             kind: :unpacked,
             label: :repeated,
             name: :fk_del_set_cols,
             tag: 26,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("fkDelSetCols") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fkDelSetCols",
             kind: :unpacked,
             label: :repeated,
             name: :fk_del_set_cols,
             tag: 26,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("fk_del_set_cols") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fkDelSetCols",
             kind: :unpacked,
             label: :repeated,
             name: :fk_del_set_cols,
             tag: 26,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:old_conpfeqop) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldConpfeqop",
             kind: :unpacked,
             label: :repeated,
             name: :old_conpfeqop,
             tag: 27,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("oldConpfeqop") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldConpfeqop",
             kind: :unpacked,
             label: :repeated,
             name: :old_conpfeqop,
             tag: 27,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("old_conpfeqop") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldConpfeqop",
             kind: :unpacked,
             label: :repeated,
             name: :old_conpfeqop,
             tag: 27,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:old_pktable_oid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldPktableOid",
             kind: {:scalar, 0},
             label: :optional,
             name: :old_pktable_oid,
             tag: 28,
             type: :uint32
           }}
        end

        def field_def("oldPktableOid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldPktableOid",
             kind: {:scalar, 0},
             label: :optional,
             name: :old_pktable_oid,
             tag: 28,
             type: :uint32
           }}
        end

        def field_def("old_pktable_oid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldPktableOid",
             kind: {:scalar, 0},
             label: :optional,
             name: :old_pktable_oid,
             tag: 28,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:skip_validation) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "skipValidation",
             kind: {:scalar, false},
             label: :optional,
             name: :skip_validation,
             tag: 29,
             type: :bool
           }}
        end

        def field_def("skipValidation") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "skipValidation",
             kind: {:scalar, false},
             label: :optional,
             name: :skip_validation,
             tag: 29,
             type: :bool
           }}
        end

        def field_def("skip_validation") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "skipValidation",
             kind: {:scalar, false},
             label: :optional,
             name: :skip_validation,
             tag: 29,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:initially_valid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "initiallyValid",
             kind: {:scalar, false},
             label: :optional,
             name: :initially_valid,
             tag: 30,
             type: :bool
           }}
        end

        def field_def("initiallyValid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "initiallyValid",
             kind: {:scalar, false},
             label: :optional,
             name: :initially_valid,
             tag: 30,
             type: :bool
           }}
        end

        def field_def("initially_valid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "initiallyValid",
             kind: {:scalar, false},
             label: :optional,
             name: :initially_valid,
             tag: 30,
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
    def default(:contype) do
      {:ok, :CONSTR_TYPE_UNDEFINED}
    end,
    def default(:conname) do
      {:ok, ""}
    end,
    def default(:deferrable) do
      {:ok, false}
    end,
    def default(:initdeferred) do
      {:ok, false}
    end,
    def default(:location) do
      {:ok, 0}
    end,
    def default(:is_no_inherit) do
      {:ok, false}
    end,
    def default(:raw_expr) do
      {:ok, nil}
    end,
    def default(:cooked_expr) do
      {:ok, ""}
    end,
    def default(:generated_when) do
      {:ok, ""}
    end,
    def default(:nulls_not_distinct) do
      {:ok, false}
    end,
    def default(:keys) do
      {:error, :no_default_value}
    end,
    def default(:including) do
      {:error, :no_default_value}
    end,
    def default(:exclusions) do
      {:error, :no_default_value}
    end,
    def default(:options) do
      {:error, :no_default_value}
    end,
    def default(:indexname) do
      {:ok, ""}
    end,
    def default(:indexspace) do
      {:ok, ""}
    end,
    def default(:reset_default_tblspc) do
      {:ok, false}
    end,
    def default(:access_method) do
      {:ok, ""}
    end,
    def default(:where_clause) do
      {:ok, nil}
    end,
    def default(:pktable) do
      {:ok, nil}
    end,
    def default(:fk_attrs) do
      {:error, :no_default_value}
    end,
    def default(:pk_attrs) do
      {:error, :no_default_value}
    end,
    def default(:fk_matchtype) do
      {:ok, ""}
    end,
    def default(:fk_upd_action) do
      {:ok, ""}
    end,
    def default(:fk_del_action) do
      {:ok, ""}
    end,
    def default(:fk_del_set_cols) do
      {:error, :no_default_value}
    end,
    def default(:old_conpfeqop) do
      {:error, :no_default_value}
    end,
    def default(:old_pktable_oid) do
      {:ok, 0}
    end,
    def default(:skip_validation) do
      {:ok, false}
    end,
    def default(:initially_valid) do
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
