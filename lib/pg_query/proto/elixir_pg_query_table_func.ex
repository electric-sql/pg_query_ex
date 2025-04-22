# credo:disable-for-this-file
defmodule PgQuery.TableFunc do
  @moduledoc false
  defstruct functype: :TABLE_FUNC_TYPE_UNDEFINED,
            ns_uris: [],
            ns_names: [],
            docexpr: nil,
            rowexpr: nil,
            colnames: [],
            coltypes: [],
            coltypmods: [],
            colcollations: [],
            colexprs: [],
            coldefexprs: [],
            colvalexprs: [],
            passingvalexprs: [],
            notnulls: [],
            plan: nil,
            ordinalitycol: 0,
            location: 0

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
        |> encode_functype(msg)
        |> encode_ns_uris(msg)
        |> encode_ns_names(msg)
        |> encode_docexpr(msg)
        |> encode_rowexpr(msg)
        |> encode_colnames(msg)
        |> encode_coltypes(msg)
        |> encode_coltypmods(msg)
        |> encode_colcollations(msg)
        |> encode_colexprs(msg)
        |> encode_coldefexprs(msg)
        |> encode_colvalexprs(msg)
        |> encode_passingvalexprs(msg)
        |> encode_notnulls(msg)
        |> encode_plan(msg)
        |> encode_ordinalitycol(msg)
        |> encode_location(msg)
      end
    )

    []

    [
      defp encode_functype(acc, msg) do
        try do
          if msg.functype == :TABLE_FUNC_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "\b",
              msg.functype |> PgQuery.TableFuncType.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:functype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ns_uris(acc, msg) do
        try do
          case msg.ns_uris do
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
            reraise Protox.EncodingError.new(:ns_uris, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ns_names(acc, msg) do
        try do
          case msg.ns_names do
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
            reraise Protox.EncodingError.new(:ns_names, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_docexpr(acc, msg) do
        try do
          if msg.docexpr == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.docexpr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:docexpr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rowexpr(acc, msg) do
        try do
          if msg.rowexpr == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.rowexpr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rowexpr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_colnames(acc, msg) do
        try do
          case msg.colnames do
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
            reraise Protox.EncodingError.new(:colnames, "invalid field value"), __STACKTRACE__
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
                  [acc, ":", Protox.Encode.encode_message(value)]
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
                  [acc, "B", Protox.Encode.encode_message(value)]
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
                  [acc, "J", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:colcollations, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_colexprs(acc, msg) do
        try do
          case msg.colexprs do
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
            reraise Protox.EncodingError.new(:colexprs, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_coldefexprs(acc, msg) do
        try do
          case msg.coldefexprs do
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
            reraise Protox.EncodingError.new(:coldefexprs, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_colvalexprs(acc, msg) do
        try do
          case msg.colvalexprs do
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
            reraise Protox.EncodingError.new(:colvalexprs, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_passingvalexprs(acc, msg) do
        try do
          case msg.passingvalexprs do
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
            reraise Protox.EncodingError.new(:passingvalexprs, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_notnulls(acc, msg) do
        try do
          case msg.notnulls do
            [] ->
              acc

            values ->
              [
                acc,
                "r",
                (
                  {bytes, len} =
                    Enum.reduce(values, {[], 0}, fn value, {acc, len} ->
                      value_bytes = :binary.list_to_bin([Protox.Encode.encode_uint64(value)])
                      {[acc, value_bytes], len + byte_size(value_bytes)}
                    end)

                  [Protox.Varint.encode(len), bytes]
                )
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:notnulls, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_plan(acc, msg) do
        try do
          if msg.plan == nil do
            acc
          else
            [acc, "z", Protox.Encode.encode_message(msg.plan)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:plan, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ordinalitycol(acc, msg) do
        try do
          if msg.ordinalitycol == 0 do
            acc
          else
            [acc, "\x80\x01", Protox.Encode.encode_int32(msg.ordinalitycol)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ordinalitycol, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "\x88\x01", Protox.Encode.encode_int32(msg.location)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:location, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.TableFunc))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.TableFuncType)
              {[functype: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[ns_uris: msg.ns_uris ++ [PgQuery.Node.decode!(delimited)]], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[ns_names: msg.ns_names ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[docexpr: Protox.MergeMessage.merge(msg.docexpr, PgQuery.Node.decode!(delimited))],
               rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[rowexpr: Protox.MergeMessage.merge(msg.rowexpr, PgQuery.Node.decode!(delimited))],
               rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[colnames: msg.colnames ++ [PgQuery.Node.decode!(delimited)]], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[coltypes: msg.coltypes ++ [PgQuery.Node.decode!(delimited)]], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[coltypmods: msg.coltypmods ++ [PgQuery.Node.decode!(delimited)]], rest}

            {9, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[colcollations: msg.colcollations ++ [PgQuery.Node.decode!(delimited)]], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[colexprs: msg.colexprs ++ [PgQuery.Node.decode!(delimited)]], rest}

            {11, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[coldefexprs: msg.coldefexprs ++ [PgQuery.Node.decode!(delimited)]], rest}

            {12, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[colvalexprs: msg.colvalexprs ++ [PgQuery.Node.decode!(delimited)]], rest}

            {13, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[passingvalexprs: msg.passingvalexprs ++ [PgQuery.Node.decode!(delimited)]], rest}

            {14, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[notnulls: msg.notnulls ++ Protox.Decode.parse_repeated_uint64([], delimited)],
               rest}

            {14, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint64(bytes)
              {[notnulls: msg.notnulls ++ [value]], rest}

            {15, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[plan: Protox.MergeMessage.merge(msg.plan, PgQuery.Node.decode!(delimited))], rest}

            {16, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[ordinalitycol: value], rest}

            {17, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[location: value], rest}

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
        PgQuery.TableFunc,
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
        1 => {:functype, {:scalar, :TABLE_FUNC_TYPE_UNDEFINED}, {:enum, PgQuery.TableFuncType}},
        2 => {:ns_uris, :unpacked, {:message, PgQuery.Node}},
        3 => {:ns_names, :unpacked, {:message, PgQuery.Node}},
        4 => {:docexpr, {:scalar, nil}, {:message, PgQuery.Node}},
        5 => {:rowexpr, {:scalar, nil}, {:message, PgQuery.Node}},
        6 => {:colnames, :unpacked, {:message, PgQuery.Node}},
        7 => {:coltypes, :unpacked, {:message, PgQuery.Node}},
        8 => {:coltypmods, :unpacked, {:message, PgQuery.Node}},
        9 => {:colcollations, :unpacked, {:message, PgQuery.Node}},
        10 => {:colexprs, :unpacked, {:message, PgQuery.Node}},
        11 => {:coldefexprs, :unpacked, {:message, PgQuery.Node}},
        12 => {:colvalexprs, :unpacked, {:message, PgQuery.Node}},
        13 => {:passingvalexprs, :unpacked, {:message, PgQuery.Node}},
        14 => {:notnulls, :packed, :uint64},
        15 => {:plan, {:scalar, nil}, {:message, PgQuery.Node}},
        16 => {:ordinalitycol, {:scalar, 0}, :int32},
        17 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        colcollations: {9, :unpacked, {:message, PgQuery.Node}},
        coldefexprs: {11, :unpacked, {:message, PgQuery.Node}},
        colexprs: {10, :unpacked, {:message, PgQuery.Node}},
        colnames: {6, :unpacked, {:message, PgQuery.Node}},
        coltypes: {7, :unpacked, {:message, PgQuery.Node}},
        coltypmods: {8, :unpacked, {:message, PgQuery.Node}},
        colvalexprs: {12, :unpacked, {:message, PgQuery.Node}},
        docexpr: {4, {:scalar, nil}, {:message, PgQuery.Node}},
        functype: {1, {:scalar, :TABLE_FUNC_TYPE_UNDEFINED}, {:enum, PgQuery.TableFuncType}},
        location: {17, {:scalar, 0}, :int32},
        notnulls: {14, :packed, :uint64},
        ns_names: {3, :unpacked, {:message, PgQuery.Node}},
        ns_uris: {2, :unpacked, {:message, PgQuery.Node}},
        ordinalitycol: {16, {:scalar, 0}, :int32},
        passingvalexprs: {13, :unpacked, {:message, PgQuery.Node}},
        plan: {15, {:scalar, nil}, {:message, PgQuery.Node}},
        rowexpr: {5, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "functype",
          kind: {:scalar, :TABLE_FUNC_TYPE_UNDEFINED},
          label: :optional,
          name: :functype,
          tag: 1,
          type: {:enum, PgQuery.TableFuncType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "nsUris",
          kind: :unpacked,
          label: :repeated,
          name: :ns_uris,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "nsNames",
          kind: :unpacked,
          label: :repeated,
          name: :ns_names,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "docexpr",
          kind: {:scalar, nil},
          label: :optional,
          name: :docexpr,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rowexpr",
          kind: {:scalar, nil},
          label: :optional,
          name: :rowexpr,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "colnames",
          kind: :unpacked,
          label: :repeated,
          name: :colnames,
          tag: 6,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "coltypes",
          kind: :unpacked,
          label: :repeated,
          name: :coltypes,
          tag: 7,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "coltypmods",
          kind: :unpacked,
          label: :repeated,
          name: :coltypmods,
          tag: 8,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "colcollations",
          kind: :unpacked,
          label: :repeated,
          name: :colcollations,
          tag: 9,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "colexprs",
          kind: :unpacked,
          label: :repeated,
          name: :colexprs,
          tag: 10,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "coldefexprs",
          kind: :unpacked,
          label: :repeated,
          name: :coldefexprs,
          tag: 11,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "colvalexprs",
          kind: :unpacked,
          label: :repeated,
          name: :colvalexprs,
          tag: 12,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "passingvalexprs",
          kind: :unpacked,
          label: :repeated,
          name: :passingvalexprs,
          tag: 13,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "notnulls",
          kind: :packed,
          label: :repeated,
          name: :notnulls,
          tag: 14,
          type: :uint64
        },
        %{
          __struct__: Protox.Field,
          json_name: "plan",
          kind: {:scalar, nil},
          label: :optional,
          name: :plan,
          tag: 15,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "ordinalitycol",
          kind: {:scalar, 0},
          label: :optional,
          name: :ordinalitycol,
          tag: 16,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 17,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:functype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "functype",
             kind: {:scalar, :TABLE_FUNC_TYPE_UNDEFINED},
             label: :optional,
             name: :functype,
             tag: 1,
             type: {:enum, PgQuery.TableFuncType}
           }}
        end

        def field_def("functype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "functype",
             kind: {:scalar, :TABLE_FUNC_TYPE_UNDEFINED},
             label: :optional,
             name: :functype,
             tag: 1,
             type: {:enum, PgQuery.TableFuncType}
           }}
        end

        []
      ),
      (
        def field_def(:ns_uris) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nsUris",
             kind: :unpacked,
             label: :repeated,
             name: :ns_uris,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("nsUris") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nsUris",
             kind: :unpacked,
             label: :repeated,
             name: :ns_uris,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("ns_uris") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nsUris",
             kind: :unpacked,
             label: :repeated,
             name: :ns_uris,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:ns_names) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nsNames",
             kind: :unpacked,
             label: :repeated,
             name: :ns_names,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("nsNames") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nsNames",
             kind: :unpacked,
             label: :repeated,
             name: :ns_names,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("ns_names") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nsNames",
             kind: :unpacked,
             label: :repeated,
             name: :ns_names,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:docexpr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "docexpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :docexpr,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("docexpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "docexpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :docexpr,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:rowexpr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowexpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :rowexpr,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("rowexpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowexpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :rowexpr,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:colnames) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colnames",
             kind: :unpacked,
             label: :repeated,
             name: :colnames,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("colnames") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colnames",
             kind: :unpacked,
             label: :repeated,
             name: :colnames,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        []
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
             tag: 7,
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
             tag: 7,
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
             tag: 8,
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
             tag: 8,
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
             tag: 9,
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
             tag: 9,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:colexprs) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colexprs",
             kind: :unpacked,
             label: :repeated,
             name: :colexprs,
             tag: 10,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("colexprs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colexprs",
             kind: :unpacked,
             label: :repeated,
             name: :colexprs,
             tag: 10,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:coldefexprs) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coldefexprs",
             kind: :unpacked,
             label: :repeated,
             name: :coldefexprs,
             tag: 11,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("coldefexprs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coldefexprs",
             kind: :unpacked,
             label: :repeated,
             name: :coldefexprs,
             tag: 11,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:colvalexprs) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colvalexprs",
             kind: :unpacked,
             label: :repeated,
             name: :colvalexprs,
             tag: 12,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("colvalexprs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colvalexprs",
             kind: :unpacked,
             label: :repeated,
             name: :colvalexprs,
             tag: 12,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:passingvalexprs) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "passingvalexprs",
             kind: :unpacked,
             label: :repeated,
             name: :passingvalexprs,
             tag: 13,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("passingvalexprs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "passingvalexprs",
             kind: :unpacked,
             label: :repeated,
             name: :passingvalexprs,
             tag: 13,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:notnulls) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "notnulls",
             kind: :packed,
             label: :repeated,
             name: :notnulls,
             tag: 14,
             type: :uint64
           }}
        end

        def field_def("notnulls") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "notnulls",
             kind: :packed,
             label: :repeated,
             name: :notnulls,
             tag: 14,
             type: :uint64
           }}
        end

        []
      ),
      (
        def field_def(:plan) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "plan",
             kind: {:scalar, nil},
             label: :optional,
             name: :plan,
             tag: 15,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("plan") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "plan",
             kind: {:scalar, nil},
             label: :optional,
             name: :plan,
             tag: 15,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:ordinalitycol) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ordinalitycol",
             kind: {:scalar, 0},
             label: :optional,
             name: :ordinalitycol,
             tag: 16,
             type: :int32
           }}
        end

        def field_def("ordinalitycol") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ordinalitycol",
             kind: {:scalar, 0},
             label: :optional,
             name: :ordinalitycol,
             tag: 16,
             type: :int32
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
             tag: 17,
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
             tag: 17,
             type: :int32
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
    def default(:functype) do
      {:ok, :TABLE_FUNC_TYPE_UNDEFINED}
    end,
    def default(:ns_uris) do
      {:error, :no_default_value}
    end,
    def default(:ns_names) do
      {:error, :no_default_value}
    end,
    def default(:docexpr) do
      {:ok, nil}
    end,
    def default(:rowexpr) do
      {:ok, nil}
    end,
    def default(:colnames) do
      {:error, :no_default_value}
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
    def default(:colexprs) do
      {:error, :no_default_value}
    end,
    def default(:coldefexprs) do
      {:error, :no_default_value}
    end,
    def default(:colvalexprs) do
      {:error, :no_default_value}
    end,
    def default(:passingvalexprs) do
      {:error, :no_default_value}
    end,
    def default(:notnulls) do
      {:error, :no_default_value}
    end,
    def default(:plan) do
      {:ok, nil}
    end,
    def default(:ordinalitycol) do
      {:ok, 0}
    end,
    def default(:location) do
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
