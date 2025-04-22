# credo:disable-for-this-file
defmodule PgQuery.RangeTblEntry do
  @moduledoc false
  defstruct alias: nil,
            eref: nil,
            rtekind: :RTEKIND_UNDEFINED,
            relid: 0,
            inh: false,
            relkind: "",
            rellockmode: 0,
            perminfoindex: 0,
            tablesample: nil,
            subquery: nil,
            security_barrier: false,
            jointype: :JOIN_TYPE_UNDEFINED,
            joinmergedcols: 0,
            joinaliasvars: [],
            joinleftcols: [],
            joinrightcols: [],
            join_using_alias: nil,
            functions: [],
            funcordinality: false,
            tablefunc: nil,
            values_lists: [],
            ctename: "",
            ctelevelsup: 0,
            self_reference: false,
            coltypes: [],
            coltypmods: [],
            colcollations: [],
            enrname: "",
            enrtuples: 0.0,
            lateral: false,
            in_from_cl: false,
            security_quals: []

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
        |> encode_alias(msg)
        |> encode_eref(msg)
        |> encode_rtekind(msg)
        |> encode_relid(msg)
        |> encode_inh(msg)
        |> encode_relkind(msg)
        |> encode_rellockmode(msg)
        |> encode_perminfoindex(msg)
        |> encode_tablesample(msg)
        |> encode_subquery(msg)
        |> encode_security_barrier(msg)
        |> encode_jointype(msg)
        |> encode_joinmergedcols(msg)
        |> encode_joinaliasvars(msg)
        |> encode_joinleftcols(msg)
        |> encode_joinrightcols(msg)
        |> encode_join_using_alias(msg)
        |> encode_functions(msg)
        |> encode_funcordinality(msg)
        |> encode_tablefunc(msg)
        |> encode_values_lists(msg)
        |> encode_ctename(msg)
        |> encode_ctelevelsup(msg)
        |> encode_self_reference(msg)
        |> encode_coltypes(msg)
        |> encode_coltypmods(msg)
        |> encode_colcollations(msg)
        |> encode_enrname(msg)
        |> encode_enrtuples(msg)
        |> encode_lateral(msg)
        |> encode_in_from_cl(msg)
        |> encode_security_quals(msg)
      end
    )

    []

    [
      defp encode_alias(acc, msg) do
        try do
          if msg.alias == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.alias)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alias, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_eref(acc, msg) do
        try do
          if msg.eref == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.eref)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:eref, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rtekind(acc, msg) do
        try do
          if msg.rtekind == :RTEKIND_UNDEFINED do
            acc
          else
            [acc, "\x18", msg.rtekind |> PgQuery.RTEKind.encode() |> Protox.Encode.encode_enum()]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rtekind, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_relid(acc, msg) do
        try do
          if msg.relid == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.relid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:relid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_inh(acc, msg) do
        try do
          if msg.inh == false do
            acc
          else
            [acc, "(", Protox.Encode.encode_bool(msg.inh)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:inh, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_relkind(acc, msg) do
        try do
          if msg.relkind == "" do
            acc
          else
            [acc, "2", Protox.Encode.encode_string(msg.relkind)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:relkind, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rellockmode(acc, msg) do
        try do
          if msg.rellockmode == 0 do
            acc
          else
            [acc, "8", Protox.Encode.encode_int32(msg.rellockmode)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rellockmode, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_perminfoindex(acc, msg) do
        try do
          if msg.perminfoindex == 0 do
            acc
          else
            [acc, "@", Protox.Encode.encode_uint32(msg.perminfoindex)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:perminfoindex, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_tablesample(acc, msg) do
        try do
          if msg.tablesample == nil do
            acc
          else
            [acc, "J", Protox.Encode.encode_message(msg.tablesample)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:tablesample, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_subquery(acc, msg) do
        try do
          if msg.subquery == nil do
            acc
          else
            [acc, "R", Protox.Encode.encode_message(msg.subquery)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:subquery, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_security_barrier(acc, msg) do
        try do
          if msg.security_barrier == false do
            acc
          else
            [acc, "X", Protox.Encode.encode_bool(msg.security_barrier)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:security_barrier, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_jointype(acc, msg) do
        try do
          if msg.jointype == :JOIN_TYPE_UNDEFINED do
            acc
          else
            [acc, "`", msg.jointype |> PgQuery.JoinType.encode() |> Protox.Encode.encode_enum()]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:jointype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_joinmergedcols(acc, msg) do
        try do
          if msg.joinmergedcols == 0 do
            acc
          else
            [acc, "h", Protox.Encode.encode_int32(msg.joinmergedcols)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:joinmergedcols, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_joinaliasvars(acc, msg) do
        try do
          case msg.joinaliasvars do
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
            reraise Protox.EncodingError.new(:joinaliasvars, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_joinleftcols(acc, msg) do
        try do
          case msg.joinleftcols do
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
            reraise Protox.EncodingError.new(:joinleftcols, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_joinrightcols(acc, msg) do
        try do
          case msg.joinrightcols do
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
            reraise Protox.EncodingError.new(:joinrightcols, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_join_using_alias(acc, msg) do
        try do
          if msg.join_using_alias == nil do
            acc
          else
            [acc, "\x8A\x01", Protox.Encode.encode_message(msg.join_using_alias)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:join_using_alias, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_functions(acc, msg) do
        try do
          case msg.functions do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x92\x01", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:functions, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_funcordinality(acc, msg) do
        try do
          if msg.funcordinality == false do
            acc
          else
            [acc, "\x98\x01", Protox.Encode.encode_bool(msg.funcordinality)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:funcordinality, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_tablefunc(acc, msg) do
        try do
          if msg.tablefunc == nil do
            acc
          else
            [acc, "\xA2\x01", Protox.Encode.encode_message(msg.tablefunc)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:tablefunc, "invalid field value"), __STACKTRACE__
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
                  [acc, "\xAA\x01", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:values_lists, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ctename(acc, msg) do
        try do
          if msg.ctename == "" do
            acc
          else
            [acc, "\xB2\x01", Protox.Encode.encode_string(msg.ctename)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ctename, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ctelevelsup(acc, msg) do
        try do
          if msg.ctelevelsup == 0 do
            acc
          else
            [acc, "\xB8\x01", Protox.Encode.encode_uint32(msg.ctelevelsup)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ctelevelsup, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_self_reference(acc, msg) do
        try do
          if msg.self_reference == false do
            acc
          else
            [acc, "\xC0\x01", Protox.Encode.encode_bool(msg.self_reference)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:self_reference, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_coltypes(acc, msg) do
        try do
          case msg.coltypes do
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
            reraise Protox.EncodingError.new(:coltypes, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_coltypmods(acc, msg) do
        try do
          case msg.coltypmods do
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
            reraise Protox.EncodingError.new(:coltypmods, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_colcollations(acc, msg) do
        try do
          case msg.colcollations do
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
            reraise Protox.EncodingError.new(:colcollations, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_enrname(acc, msg) do
        try do
          if msg.enrname == "" do
            acc
          else
            [acc, "\xE2\x01", Protox.Encode.encode_string(msg.enrname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:enrname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_enrtuples(acc, msg) do
        try do
          if msg.enrtuples == 0.0 do
            acc
          else
            [acc, "\xE9\x01", Protox.Encode.encode_double(msg.enrtuples)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:enrtuples, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_lateral(acc, msg) do
        try do
          if msg.lateral == false do
            acc
          else
            [acc, "\xF0\x01", Protox.Encode.encode_bool(msg.lateral)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:lateral, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_in_from_cl(acc, msg) do
        try do
          if msg.in_from_cl == false do
            acc
          else
            [acc, "\xF8\x01", Protox.Encode.encode_bool(msg.in_from_cl)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:in_from_cl, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_security_quals(acc, msg) do
        try do
          case msg.security_quals do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x82\x02", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:security_quals, "invalid field value"),
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
          parse_key_value(bytes, struct(PgQuery.RangeTblEntry))
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

              {[alias: Protox.MergeMessage.merge(msg.alias, PgQuery.Alias.decode!(delimited))],
               rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[eref: Protox.MergeMessage.merge(msg.eref, PgQuery.Alias.decode!(delimited))],
               rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.RTEKind)
              {[rtekind: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[relid: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[inh: value], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[relkind: delimited], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[rellockmode: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[perminfoindex: value], rest}

            {9, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 tablesample:
                   Protox.MergeMessage.merge(
                     msg.tablesample,
                     PgQuery.TableSampleClause.decode!(delimited)
                   )
               ], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 subquery:
                   Protox.MergeMessage.merge(msg.subquery, PgQuery.Query.decode!(delimited))
               ], rest}

            {11, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[security_barrier: value], rest}

            {12, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.JoinType)
              {[jointype: value], rest}

            {13, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[joinmergedcols: value], rest}

            {14, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[joinaliasvars: msg.joinaliasvars ++ [PgQuery.Node.decode!(delimited)]], rest}

            {15, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[joinleftcols: msg.joinleftcols ++ [PgQuery.Node.decode!(delimited)]], rest}

            {16, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[joinrightcols: msg.joinrightcols ++ [PgQuery.Node.decode!(delimited)]], rest}

            {17, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 join_using_alias:
                   Protox.MergeMessage.merge(
                     msg.join_using_alias,
                     PgQuery.Alias.decode!(delimited)
                   )
               ], rest}

            {18, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[functions: msg.functions ++ [PgQuery.Node.decode!(delimited)]], rest}

            {19, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[funcordinality: value], rest}

            {20, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 tablefunc:
                   Protox.MergeMessage.merge(msg.tablefunc, PgQuery.TableFunc.decode!(delimited))
               ], rest}

            {21, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[values_lists: msg.values_lists ++ [PgQuery.Node.decode!(delimited)]], rest}

            {22, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[ctename: delimited], rest}

            {23, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[ctelevelsup: value], rest}

            {24, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[self_reference: value], rest}

            {25, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[coltypes: msg.coltypes ++ [PgQuery.Node.decode!(delimited)]], rest}

            {26, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[coltypmods: msg.coltypmods ++ [PgQuery.Node.decode!(delimited)]], rest}

            {27, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[colcollations: msg.colcollations ++ [PgQuery.Node.decode!(delimited)]], rest}

            {28, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[enrname: delimited], rest}

            {29, _, bytes} ->
              {value, rest} = Protox.Decode.parse_double(bytes)
              {[enrtuples: value], rest}

            {30, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[lateral: value], rest}

            {31, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[in_from_cl: value], rest}

            {32, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[security_quals: msg.security_quals ++ [PgQuery.Node.decode!(delimited)]], rest}

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
        PgQuery.RangeTblEntry,
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
        1 => {:alias, {:scalar, nil}, {:message, PgQuery.Alias}},
        2 => {:eref, {:scalar, nil}, {:message, PgQuery.Alias}},
        3 => {:rtekind, {:scalar, :RTEKIND_UNDEFINED}, {:enum, PgQuery.RTEKind}},
        4 => {:relid, {:scalar, 0}, :uint32},
        5 => {:inh, {:scalar, false}, :bool},
        6 => {:relkind, {:scalar, ""}, :string},
        7 => {:rellockmode, {:scalar, 0}, :int32},
        8 => {:perminfoindex, {:scalar, 0}, :uint32},
        9 => {:tablesample, {:scalar, nil}, {:message, PgQuery.TableSampleClause}},
        10 => {:subquery, {:scalar, nil}, {:message, PgQuery.Query}},
        11 => {:security_barrier, {:scalar, false}, :bool},
        12 => {:jointype, {:scalar, :JOIN_TYPE_UNDEFINED}, {:enum, PgQuery.JoinType}},
        13 => {:joinmergedcols, {:scalar, 0}, :int32},
        14 => {:joinaliasvars, :unpacked, {:message, PgQuery.Node}},
        15 => {:joinleftcols, :unpacked, {:message, PgQuery.Node}},
        16 => {:joinrightcols, :unpacked, {:message, PgQuery.Node}},
        17 => {:join_using_alias, {:scalar, nil}, {:message, PgQuery.Alias}},
        18 => {:functions, :unpacked, {:message, PgQuery.Node}},
        19 => {:funcordinality, {:scalar, false}, :bool},
        20 => {:tablefunc, {:scalar, nil}, {:message, PgQuery.TableFunc}},
        21 => {:values_lists, :unpacked, {:message, PgQuery.Node}},
        22 => {:ctename, {:scalar, ""}, :string},
        23 => {:ctelevelsup, {:scalar, 0}, :uint32},
        24 => {:self_reference, {:scalar, false}, :bool},
        25 => {:coltypes, :unpacked, {:message, PgQuery.Node}},
        26 => {:coltypmods, :unpacked, {:message, PgQuery.Node}},
        27 => {:colcollations, :unpacked, {:message, PgQuery.Node}},
        28 => {:enrname, {:scalar, ""}, :string},
        29 => {:enrtuples, {:scalar, 0.0}, :double},
        30 => {:lateral, {:scalar, false}, :bool},
        31 => {:in_from_cl, {:scalar, false}, :bool},
        32 => {:security_quals, :unpacked, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        alias: {1, {:scalar, nil}, {:message, PgQuery.Alias}},
        colcollations: {27, :unpacked, {:message, PgQuery.Node}},
        coltypes: {25, :unpacked, {:message, PgQuery.Node}},
        coltypmods: {26, :unpacked, {:message, PgQuery.Node}},
        ctelevelsup: {23, {:scalar, 0}, :uint32},
        ctename: {22, {:scalar, ""}, :string},
        enrname: {28, {:scalar, ""}, :string},
        enrtuples: {29, {:scalar, 0.0}, :double},
        eref: {2, {:scalar, nil}, {:message, PgQuery.Alias}},
        funcordinality: {19, {:scalar, false}, :bool},
        functions: {18, :unpacked, {:message, PgQuery.Node}},
        in_from_cl: {31, {:scalar, false}, :bool},
        inh: {5, {:scalar, false}, :bool},
        join_using_alias: {17, {:scalar, nil}, {:message, PgQuery.Alias}},
        joinaliasvars: {14, :unpacked, {:message, PgQuery.Node}},
        joinleftcols: {15, :unpacked, {:message, PgQuery.Node}},
        joinmergedcols: {13, {:scalar, 0}, :int32},
        joinrightcols: {16, :unpacked, {:message, PgQuery.Node}},
        jointype: {12, {:scalar, :JOIN_TYPE_UNDEFINED}, {:enum, PgQuery.JoinType}},
        lateral: {30, {:scalar, false}, :bool},
        perminfoindex: {8, {:scalar, 0}, :uint32},
        relid: {4, {:scalar, 0}, :uint32},
        relkind: {6, {:scalar, ""}, :string},
        rellockmode: {7, {:scalar, 0}, :int32},
        rtekind: {3, {:scalar, :RTEKIND_UNDEFINED}, {:enum, PgQuery.RTEKind}},
        security_barrier: {11, {:scalar, false}, :bool},
        security_quals: {32, :unpacked, {:message, PgQuery.Node}},
        self_reference: {24, {:scalar, false}, :bool},
        subquery: {10, {:scalar, nil}, {:message, PgQuery.Query}},
        tablefunc: {20, {:scalar, nil}, {:message, PgQuery.TableFunc}},
        tablesample: {9, {:scalar, nil}, {:message, PgQuery.TableSampleClause}},
        values_lists: {21, :unpacked, {:message, PgQuery.Node}}
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
          kind: {:scalar, nil},
          label: :optional,
          name: :alias,
          tag: 1,
          type: {:message, PgQuery.Alias}
        },
        %{
          __struct__: Protox.Field,
          json_name: "eref",
          kind: {:scalar, nil},
          label: :optional,
          name: :eref,
          tag: 2,
          type: {:message, PgQuery.Alias}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rtekind",
          kind: {:scalar, :RTEKIND_UNDEFINED},
          label: :optional,
          name: :rtekind,
          tag: 3,
          type: {:enum, PgQuery.RTEKind}
        },
        %{
          __struct__: Protox.Field,
          json_name: "relid",
          kind: {:scalar, 0},
          label: :optional,
          name: :relid,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "inh",
          kind: {:scalar, false},
          label: :optional,
          name: :inh,
          tag: 5,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "relkind",
          kind: {:scalar, ""},
          label: :optional,
          name: :relkind,
          tag: 6,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "rellockmode",
          kind: {:scalar, 0},
          label: :optional,
          name: :rellockmode,
          tag: 7,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "perminfoindex",
          kind: {:scalar, 0},
          label: :optional,
          name: :perminfoindex,
          tag: 8,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "tablesample",
          kind: {:scalar, nil},
          label: :optional,
          name: :tablesample,
          tag: 9,
          type: {:message, PgQuery.TableSampleClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "subquery",
          kind: {:scalar, nil},
          label: :optional,
          name: :subquery,
          tag: 10,
          type: {:message, PgQuery.Query}
        },
        %{
          __struct__: Protox.Field,
          json_name: "securityBarrier",
          kind: {:scalar, false},
          label: :optional,
          name: :security_barrier,
          tag: 11,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "jointype",
          kind: {:scalar, :JOIN_TYPE_UNDEFINED},
          label: :optional,
          name: :jointype,
          tag: 12,
          type: {:enum, PgQuery.JoinType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "joinmergedcols",
          kind: {:scalar, 0},
          label: :optional,
          name: :joinmergedcols,
          tag: 13,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "joinaliasvars",
          kind: :unpacked,
          label: :repeated,
          name: :joinaliasvars,
          tag: 14,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "joinleftcols",
          kind: :unpacked,
          label: :repeated,
          name: :joinleftcols,
          tag: 15,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "joinrightcols",
          kind: :unpacked,
          label: :repeated,
          name: :joinrightcols,
          tag: 16,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "joinUsingAlias",
          kind: {:scalar, nil},
          label: :optional,
          name: :join_using_alias,
          tag: 17,
          type: {:message, PgQuery.Alias}
        },
        %{
          __struct__: Protox.Field,
          json_name: "functions",
          kind: :unpacked,
          label: :repeated,
          name: :functions,
          tag: 18,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "funcordinality",
          kind: {:scalar, false},
          label: :optional,
          name: :funcordinality,
          tag: 19,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "tablefunc",
          kind: {:scalar, nil},
          label: :optional,
          name: :tablefunc,
          tag: 20,
          type: {:message, PgQuery.TableFunc}
        },
        %{
          __struct__: Protox.Field,
          json_name: "valuesLists",
          kind: :unpacked,
          label: :repeated,
          name: :values_lists,
          tag: 21,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "ctename",
          kind: {:scalar, ""},
          label: :optional,
          name: :ctename,
          tag: 22,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "ctelevelsup",
          kind: {:scalar, 0},
          label: :optional,
          name: :ctelevelsup,
          tag: 23,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "selfReference",
          kind: {:scalar, false},
          label: :optional,
          name: :self_reference,
          tag: 24,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "coltypes",
          kind: :unpacked,
          label: :repeated,
          name: :coltypes,
          tag: 25,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "coltypmods",
          kind: :unpacked,
          label: :repeated,
          name: :coltypmods,
          tag: 26,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "colcollations",
          kind: :unpacked,
          label: :repeated,
          name: :colcollations,
          tag: 27,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "enrname",
          kind: {:scalar, ""},
          label: :optional,
          name: :enrname,
          tag: 28,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "enrtuples",
          kind: {:scalar, 0.0},
          label: :optional,
          name: :enrtuples,
          tag: 29,
          type: :double
        },
        %{
          __struct__: Protox.Field,
          json_name: "lateral",
          kind: {:scalar, false},
          label: :optional,
          name: :lateral,
          tag: 30,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "inFromCl",
          kind: {:scalar, false},
          label: :optional,
          name: :in_from_cl,
          tag: 31,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "securityQuals",
          kind: :unpacked,
          label: :repeated,
          name: :security_quals,
          tag: 32,
          type: {:message, PgQuery.Node}
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
             kind: {:scalar, nil},
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
             kind: {:scalar, nil},
             label: :optional,
             name: :alias,
             tag: 1,
             type: {:message, PgQuery.Alias}
           }}
        end

        []
      ),
      (
        def field_def(:eref) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "eref",
             kind: {:scalar, nil},
             label: :optional,
             name: :eref,
             tag: 2,
             type: {:message, PgQuery.Alias}
           }}
        end

        def field_def("eref") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "eref",
             kind: {:scalar, nil},
             label: :optional,
             name: :eref,
             tag: 2,
             type: {:message, PgQuery.Alias}
           }}
        end

        []
      ),
      (
        def field_def(:rtekind) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rtekind",
             kind: {:scalar, :RTEKIND_UNDEFINED},
             label: :optional,
             name: :rtekind,
             tag: 3,
             type: {:enum, PgQuery.RTEKind}
           }}
        end

        def field_def("rtekind") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rtekind",
             kind: {:scalar, :RTEKIND_UNDEFINED},
             label: :optional,
             name: :rtekind,
             tag: 3,
             type: {:enum, PgQuery.RTEKind}
           }}
        end

        []
      ),
      (
        def field_def(:relid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relid",
             kind: {:scalar, 0},
             label: :optional,
             name: :relid,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("relid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relid",
             kind: {:scalar, 0},
             label: :optional,
             name: :relid,
             tag: 4,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:inh) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inh",
             kind: {:scalar, false},
             label: :optional,
             name: :inh,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("inh") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inh",
             kind: {:scalar, false},
             label: :optional,
             name: :inh,
             tag: 5,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:relkind) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relkind",
             kind: {:scalar, ""},
             label: :optional,
             name: :relkind,
             tag: 6,
             type: :string
           }}
        end

        def field_def("relkind") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relkind",
             kind: {:scalar, ""},
             label: :optional,
             name: :relkind,
             tag: 6,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:rellockmode) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rellockmode",
             kind: {:scalar, 0},
             label: :optional,
             name: :rellockmode,
             tag: 7,
             type: :int32
           }}
        end

        def field_def("rellockmode") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rellockmode",
             kind: {:scalar, 0},
             label: :optional,
             name: :rellockmode,
             tag: 7,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:perminfoindex) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "perminfoindex",
             kind: {:scalar, 0},
             label: :optional,
             name: :perminfoindex,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("perminfoindex") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "perminfoindex",
             kind: {:scalar, 0},
             label: :optional,
             name: :perminfoindex,
             tag: 8,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:tablesample) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tablesample",
             kind: {:scalar, nil},
             label: :optional,
             name: :tablesample,
             tag: 9,
             type: {:message, PgQuery.TableSampleClause}
           }}
        end

        def field_def("tablesample") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tablesample",
             kind: {:scalar, nil},
             label: :optional,
             name: :tablesample,
             tag: 9,
             type: {:message, PgQuery.TableSampleClause}
           }}
        end

        []
      ),
      (
        def field_def(:subquery) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subquery",
             kind: {:scalar, nil},
             label: :optional,
             name: :subquery,
             tag: 10,
             type: {:message, PgQuery.Query}
           }}
        end

        def field_def("subquery") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subquery",
             kind: {:scalar, nil},
             label: :optional,
             name: :subquery,
             tag: 10,
             type: {:message, PgQuery.Query}
           }}
        end

        []
      ),
      (
        def field_def(:security_barrier) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "securityBarrier",
             kind: {:scalar, false},
             label: :optional,
             name: :security_barrier,
             tag: 11,
             type: :bool
           }}
        end

        def field_def("securityBarrier") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "securityBarrier",
             kind: {:scalar, false},
             label: :optional,
             name: :security_barrier,
             tag: 11,
             type: :bool
           }}
        end

        def field_def("security_barrier") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "securityBarrier",
             kind: {:scalar, false},
             label: :optional,
             name: :security_barrier,
             tag: 11,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:jointype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "jointype",
             kind: {:scalar, :JOIN_TYPE_UNDEFINED},
             label: :optional,
             name: :jointype,
             tag: 12,
             type: {:enum, PgQuery.JoinType}
           }}
        end

        def field_def("jointype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "jointype",
             kind: {:scalar, :JOIN_TYPE_UNDEFINED},
             label: :optional,
             name: :jointype,
             tag: 12,
             type: {:enum, PgQuery.JoinType}
           }}
        end

        []
      ),
      (
        def field_def(:joinmergedcols) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "joinmergedcols",
             kind: {:scalar, 0},
             label: :optional,
             name: :joinmergedcols,
             tag: 13,
             type: :int32
           }}
        end

        def field_def("joinmergedcols") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "joinmergedcols",
             kind: {:scalar, 0},
             label: :optional,
             name: :joinmergedcols,
             tag: 13,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:joinaliasvars) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "joinaliasvars",
             kind: :unpacked,
             label: :repeated,
             name: :joinaliasvars,
             tag: 14,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("joinaliasvars") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "joinaliasvars",
             kind: :unpacked,
             label: :repeated,
             name: :joinaliasvars,
             tag: 14,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:joinleftcols) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "joinleftcols",
             kind: :unpacked,
             label: :repeated,
             name: :joinleftcols,
             tag: 15,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("joinleftcols") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "joinleftcols",
             kind: :unpacked,
             label: :repeated,
             name: :joinleftcols,
             tag: 15,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:joinrightcols) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "joinrightcols",
             kind: :unpacked,
             label: :repeated,
             name: :joinrightcols,
             tag: 16,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("joinrightcols") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "joinrightcols",
             kind: :unpacked,
             label: :repeated,
             name: :joinrightcols,
             tag: 16,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:join_using_alias) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "joinUsingAlias",
             kind: {:scalar, nil},
             label: :optional,
             name: :join_using_alias,
             tag: 17,
             type: {:message, PgQuery.Alias}
           }}
        end

        def field_def("joinUsingAlias") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "joinUsingAlias",
             kind: {:scalar, nil},
             label: :optional,
             name: :join_using_alias,
             tag: 17,
             type: {:message, PgQuery.Alias}
           }}
        end

        def field_def("join_using_alias") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "joinUsingAlias",
             kind: {:scalar, nil},
             label: :optional,
             name: :join_using_alias,
             tag: 17,
             type: {:message, PgQuery.Alias}
           }}
        end
      ),
      (
        def field_def(:functions) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "functions",
             kind: :unpacked,
             label: :repeated,
             name: :functions,
             tag: 18,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("functions") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "functions",
             kind: :unpacked,
             label: :repeated,
             name: :functions,
             tag: 18,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:funcordinality) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcordinality",
             kind: {:scalar, false},
             label: :optional,
             name: :funcordinality,
             tag: 19,
             type: :bool
           }}
        end

        def field_def("funcordinality") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcordinality",
             kind: {:scalar, false},
             label: :optional,
             name: :funcordinality,
             tag: 19,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:tablefunc) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tablefunc",
             kind: {:scalar, nil},
             label: :optional,
             name: :tablefunc,
             tag: 20,
             type: {:message, PgQuery.TableFunc}
           }}
        end

        def field_def("tablefunc") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tablefunc",
             kind: {:scalar, nil},
             label: :optional,
             name: :tablefunc,
             tag: 20,
             type: {:message, PgQuery.TableFunc}
           }}
        end

        []
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
             tag: 21,
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
             tag: 21,
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
             tag: 21,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:ctename) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctename",
             kind: {:scalar, ""},
             label: :optional,
             name: :ctename,
             tag: 22,
             type: :string
           }}
        end

        def field_def("ctename") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctename",
             kind: {:scalar, ""},
             label: :optional,
             name: :ctename,
             tag: 22,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:ctelevelsup) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctelevelsup",
             kind: {:scalar, 0},
             label: :optional,
             name: :ctelevelsup,
             tag: 23,
             type: :uint32
           }}
        end

        def field_def("ctelevelsup") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctelevelsup",
             kind: {:scalar, 0},
             label: :optional,
             name: :ctelevelsup,
             tag: 23,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:self_reference) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "selfReference",
             kind: {:scalar, false},
             label: :optional,
             name: :self_reference,
             tag: 24,
             type: :bool
           }}
        end

        def field_def("selfReference") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "selfReference",
             kind: {:scalar, false},
             label: :optional,
             name: :self_reference,
             tag: 24,
             type: :bool
           }}
        end

        def field_def("self_reference") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "selfReference",
             kind: {:scalar, false},
             label: :optional,
             name: :self_reference,
             tag: 24,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:coltypes) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coltypes",
             kind: :unpacked,
             label: :repeated,
             name: :coltypes,
             tag: 25,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("coltypes") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coltypes",
             kind: :unpacked,
             label: :repeated,
             name: :coltypes,
             tag: 25,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:coltypmods) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coltypmods",
             kind: :unpacked,
             label: :repeated,
             name: :coltypmods,
             tag: 26,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("coltypmods") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coltypmods",
             kind: :unpacked,
             label: :repeated,
             name: :coltypmods,
             tag: 26,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:colcollations) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colcollations",
             kind: :unpacked,
             label: :repeated,
             name: :colcollations,
             tag: 27,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("colcollations") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colcollations",
             kind: :unpacked,
             label: :repeated,
             name: :colcollations,
             tag: 27,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:enrname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enrname",
             kind: {:scalar, ""},
             label: :optional,
             name: :enrname,
             tag: 28,
             type: :string
           }}
        end

        def field_def("enrname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enrname",
             kind: {:scalar, ""},
             label: :optional,
             name: :enrname,
             tag: 28,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:enrtuples) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enrtuples",
             kind: {:scalar, 0.0},
             label: :optional,
             name: :enrtuples,
             tag: 29,
             type: :double
           }}
        end

        def field_def("enrtuples") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enrtuples",
             kind: {:scalar, 0.0},
             label: :optional,
             name: :enrtuples,
             tag: 29,
             type: :double
           }}
        end

        []
      ),
      (
        def field_def(:lateral) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lateral",
             kind: {:scalar, false},
             label: :optional,
             name: :lateral,
             tag: 30,
             type: :bool
           }}
        end

        def field_def("lateral") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lateral",
             kind: {:scalar, false},
             label: :optional,
             name: :lateral,
             tag: 30,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:in_from_cl) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inFromCl",
             kind: {:scalar, false},
             label: :optional,
             name: :in_from_cl,
             tag: 31,
             type: :bool
           }}
        end

        def field_def("inFromCl") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inFromCl",
             kind: {:scalar, false},
             label: :optional,
             name: :in_from_cl,
             tag: 31,
             type: :bool
           }}
        end

        def field_def("in_from_cl") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inFromCl",
             kind: {:scalar, false},
             label: :optional,
             name: :in_from_cl,
             tag: 31,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:security_quals) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "securityQuals",
             kind: :unpacked,
             label: :repeated,
             name: :security_quals,
             tag: 32,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("securityQuals") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "securityQuals",
             kind: :unpacked,
             label: :repeated,
             name: :security_quals,
             tag: 32,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("security_quals") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "securityQuals",
             kind: :unpacked,
             label: :repeated,
             name: :security_quals,
             tag: 32,
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
    def default(:alias) do
      {:ok, nil}
    end,
    def default(:eref) do
      {:ok, nil}
    end,
    def default(:rtekind) do
      {:ok, :RTEKIND_UNDEFINED}
    end,
    def default(:relid) do
      {:ok, 0}
    end,
    def default(:inh) do
      {:ok, false}
    end,
    def default(:relkind) do
      {:ok, ""}
    end,
    def default(:rellockmode) do
      {:ok, 0}
    end,
    def default(:perminfoindex) do
      {:ok, 0}
    end,
    def default(:tablesample) do
      {:ok, nil}
    end,
    def default(:subquery) do
      {:ok, nil}
    end,
    def default(:security_barrier) do
      {:ok, false}
    end,
    def default(:jointype) do
      {:ok, :JOIN_TYPE_UNDEFINED}
    end,
    def default(:joinmergedcols) do
      {:ok, 0}
    end,
    def default(:joinaliasvars) do
      {:error, :no_default_value}
    end,
    def default(:joinleftcols) do
      {:error, :no_default_value}
    end,
    def default(:joinrightcols) do
      {:error, :no_default_value}
    end,
    def default(:join_using_alias) do
      {:ok, nil}
    end,
    def default(:functions) do
      {:error, :no_default_value}
    end,
    def default(:funcordinality) do
      {:ok, false}
    end,
    def default(:tablefunc) do
      {:ok, nil}
    end,
    def default(:values_lists) do
      {:error, :no_default_value}
    end,
    def default(:ctename) do
      {:ok, ""}
    end,
    def default(:ctelevelsup) do
      {:ok, 0}
    end,
    def default(:self_reference) do
      {:ok, false}
    end,
    def default(:coltypes) do
      {:error, :no_default_value}
    end,
    def default(:coltypmods) do
      {:error, :no_default_value}
    end,
    def default(:colcollations) do
      {:error, :no_default_value}
    end,
    def default(:enrname) do
      {:ok, ""}
    end,
    def default(:enrtuples) do
      {:ok, 0.0}
    end,
    def default(:lateral) do
      {:ok, false}
    end,
    def default(:in_from_cl) do
      {:ok, false}
    end,
    def default(:security_quals) do
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
