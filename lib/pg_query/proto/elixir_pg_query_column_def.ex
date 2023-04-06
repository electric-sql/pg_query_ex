# credo:disable-for-this-file
defmodule PgQuery.ColumnDef do
  @moduledoc false
  defstruct colname: "",
            type_name: nil,
            compression: "",
            inhcount: 0,
            is_local: false,
            is_not_null: false,
            is_from_type: false,
            storage: "",
            raw_default: nil,
            cooked_default: nil,
            identity: "",
            identity_sequence: nil,
            generated: "",
            coll_clause: nil,
            coll_oid: 0,
            constraints: [],
            fdwoptions: [],
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
        |> encode_colname(msg)
        |> encode_type_name(msg)
        |> encode_compression(msg)
        |> encode_inhcount(msg)
        |> encode_is_local(msg)
        |> encode_is_not_null(msg)
        |> encode_is_from_type(msg)
        |> encode_storage(msg)
        |> encode_raw_default(msg)
        |> encode_cooked_default(msg)
        |> encode_identity(msg)
        |> encode_identity_sequence(msg)
        |> encode_generated(msg)
        |> encode_coll_clause(msg)
        |> encode_coll_oid(msg)
        |> encode_constraints(msg)
        |> encode_fdwoptions(msg)
        |> encode_location(msg)
      end
    )

    []

    [
      defp encode_colname(acc, msg) do
        try do
          if msg.colname == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.colname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:colname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_type_name(acc, msg) do
        try do
          if msg.type_name == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.type_name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:type_name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_compression(acc, msg) do
        try do
          if msg.compression == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.compression)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:compression, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_inhcount(acc, msg) do
        try do
          if msg.inhcount == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_int32(msg.inhcount)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:inhcount, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_is_local(acc, msg) do
        try do
          if msg.is_local == false do
            acc
          else
            [acc, "(", Protox.Encode.encode_bool(msg.is_local)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_local, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_is_not_null(acc, msg) do
        try do
          if msg.is_not_null == false do
            acc
          else
            [acc, "0", Protox.Encode.encode_bool(msg.is_not_null)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_not_null, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_is_from_type(acc, msg) do
        try do
          if msg.is_from_type == false do
            acc
          else
            [acc, "8", Protox.Encode.encode_bool(msg.is_from_type)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_from_type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_storage(acc, msg) do
        try do
          if msg.storage == "" do
            acc
          else
            [acc, "B", Protox.Encode.encode_string(msg.storage)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:storage, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_raw_default(acc, msg) do
        try do
          if msg.raw_default == nil do
            acc
          else
            [acc, "J", Protox.Encode.encode_message(msg.raw_default)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:raw_default, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_cooked_default(acc, msg) do
        try do
          if msg.cooked_default == nil do
            acc
          else
            [acc, "R", Protox.Encode.encode_message(msg.cooked_default)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:cooked_default, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_identity(acc, msg) do
        try do
          if msg.identity == "" do
            acc
          else
            [acc, "Z", Protox.Encode.encode_string(msg.identity)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:identity, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_identity_sequence(acc, msg) do
        try do
          if msg.identity_sequence == nil do
            acc
          else
            [acc, "b", Protox.Encode.encode_message(msg.identity_sequence)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:identity_sequence, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_generated(acc, msg) do
        try do
          if msg.generated == "" do
            acc
          else
            [acc, "j", Protox.Encode.encode_string(msg.generated)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:generated, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_coll_clause(acc, msg) do
        try do
          if msg.coll_clause == nil do
            acc
          else
            [acc, "r", Protox.Encode.encode_message(msg.coll_clause)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:coll_clause, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_coll_oid(acc, msg) do
        try do
          if msg.coll_oid == 0 do
            acc
          else
            [acc, "x", Protox.Encode.encode_uint32(msg.coll_oid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:coll_oid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_constraints(acc, msg) do
        try do
          case msg.constraints do
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
            reraise Protox.EncodingError.new(:constraints, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_fdwoptions(acc, msg) do
        try do
          case msg.fdwoptions do
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
            reraise Protox.EncodingError.new(:fdwoptions, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "\x90\x01", Protox.Encode.encode_int32(msg.location)]
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
          parse_key_value(bytes, struct(PgQuery.ColumnDef))
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
              {[colname: delimited], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 type_name:
                   Protox.MergeMessage.merge(msg.type_name, PgQuery.TypeName.decode!(delimited))
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[compression: delimited], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[inhcount: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_local: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_not_null: value], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_from_type: value], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[storage: delimited], rest}

            {9, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 raw_default:
                   Protox.MergeMessage.merge(msg.raw_default, PgQuery.Node.decode!(delimited))
               ], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 cooked_default:
                   Protox.MergeMessage.merge(msg.cooked_default, PgQuery.Node.decode!(delimited))
               ], rest}

            {11, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[identity: delimited], rest}

            {12, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 identity_sequence:
                   Protox.MergeMessage.merge(
                     msg.identity_sequence,
                     PgQuery.RangeVar.decode!(delimited)
                   )
               ], rest}

            {13, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[generated: delimited], rest}

            {14, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 coll_clause:
                   Protox.MergeMessage.merge(
                     msg.coll_clause,
                     PgQuery.CollateClause.decode!(delimited)
                   )
               ], rest}

            {15, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[coll_oid: value], rest}

            {16, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[constraints: msg.constraints ++ [PgQuery.Node.decode!(delimited)]], rest}

            {17, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[fdwoptions: msg.fdwoptions ++ [PgQuery.Node.decode!(delimited)]], rest}

            {18, _, bytes} ->
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
        PgQuery.ColumnDef,
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
        1 => {:colname, {:scalar, ""}, :string},
        2 => {:type_name, {:scalar, nil}, {:message, PgQuery.TypeName}},
        3 => {:compression, {:scalar, ""}, :string},
        4 => {:inhcount, {:scalar, 0}, :int32},
        5 => {:is_local, {:scalar, false}, :bool},
        6 => {:is_not_null, {:scalar, false}, :bool},
        7 => {:is_from_type, {:scalar, false}, :bool},
        8 => {:storage, {:scalar, ""}, :string},
        9 => {:raw_default, {:scalar, nil}, {:message, PgQuery.Node}},
        10 => {:cooked_default, {:scalar, nil}, {:message, PgQuery.Node}},
        11 => {:identity, {:scalar, ""}, :string},
        12 => {:identity_sequence, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        13 => {:generated, {:scalar, ""}, :string},
        14 => {:coll_clause, {:scalar, nil}, {:message, PgQuery.CollateClause}},
        15 => {:coll_oid, {:scalar, 0}, :uint32},
        16 => {:constraints, :unpacked, {:message, PgQuery.Node}},
        17 => {:fdwoptions, :unpacked, {:message, PgQuery.Node}},
        18 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        coll_clause: {14, {:scalar, nil}, {:message, PgQuery.CollateClause}},
        coll_oid: {15, {:scalar, 0}, :uint32},
        colname: {1, {:scalar, ""}, :string},
        compression: {3, {:scalar, ""}, :string},
        constraints: {16, :unpacked, {:message, PgQuery.Node}},
        cooked_default: {10, {:scalar, nil}, {:message, PgQuery.Node}},
        fdwoptions: {17, :unpacked, {:message, PgQuery.Node}},
        generated: {13, {:scalar, ""}, :string},
        identity: {11, {:scalar, ""}, :string},
        identity_sequence: {12, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        inhcount: {4, {:scalar, 0}, :int32},
        is_from_type: {7, {:scalar, false}, :bool},
        is_local: {5, {:scalar, false}, :bool},
        is_not_null: {6, {:scalar, false}, :bool},
        location: {18, {:scalar, 0}, :int32},
        raw_default: {9, {:scalar, nil}, {:message, PgQuery.Node}},
        storage: {8, {:scalar, ""}, :string},
        type_name: {2, {:scalar, nil}, {:message, PgQuery.TypeName}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "colname",
          kind: {:scalar, ""},
          label: :optional,
          name: :colname,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "typeName",
          kind: {:scalar, nil},
          label: :optional,
          name: :type_name,
          tag: 2,
          type: {:message, PgQuery.TypeName}
        },
        %{
          __struct__: Protox.Field,
          json_name: "compression",
          kind: {:scalar, ""},
          label: :optional,
          name: :compression,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "inhcount",
          kind: {:scalar, 0},
          label: :optional,
          name: :inhcount,
          tag: 4,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "isLocal",
          kind: {:scalar, false},
          label: :optional,
          name: :is_local,
          tag: 5,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "isNotNull",
          kind: {:scalar, false},
          label: :optional,
          name: :is_not_null,
          tag: 6,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "isFromType",
          kind: {:scalar, false},
          label: :optional,
          name: :is_from_type,
          tag: 7,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "storage",
          kind: {:scalar, ""},
          label: :optional,
          name: :storage,
          tag: 8,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "rawDefault",
          kind: {:scalar, nil},
          label: :optional,
          name: :raw_default,
          tag: 9,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "cookedDefault",
          kind: {:scalar, nil},
          label: :optional,
          name: :cooked_default,
          tag: 10,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "identity",
          kind: {:scalar, ""},
          label: :optional,
          name: :identity,
          tag: 11,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "identitySequence",
          kind: {:scalar, nil},
          label: :optional,
          name: :identity_sequence,
          tag: 12,
          type: {:message, PgQuery.RangeVar}
        },
        %{
          __struct__: Protox.Field,
          json_name: "generated",
          kind: {:scalar, ""},
          label: :optional,
          name: :generated,
          tag: 13,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "collClause",
          kind: {:scalar, nil},
          label: :optional,
          name: :coll_clause,
          tag: 14,
          type: {:message, PgQuery.CollateClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "collOid",
          kind: {:scalar, 0},
          label: :optional,
          name: :coll_oid,
          tag: 15,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "constraints",
          kind: :unpacked,
          label: :repeated,
          name: :constraints,
          tag: 16,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "fdwoptions",
          kind: :unpacked,
          label: :repeated,
          name: :fdwoptions,
          tag: 17,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 18,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:colname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colname",
             kind: {:scalar, ""},
             label: :optional,
             name: :colname,
             tag: 1,
             type: :string
           }}
        end

        def field_def("colname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colname",
             kind: {:scalar, ""},
             label: :optional,
             name: :colname,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:type_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeName",
             kind: {:scalar, nil},
             label: :optional,
             name: :type_name,
             tag: 2,
             type: {:message, PgQuery.TypeName}
           }}
        end

        def field_def("typeName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeName",
             kind: {:scalar, nil},
             label: :optional,
             name: :type_name,
             tag: 2,
             type: {:message, PgQuery.TypeName}
           }}
        end

        def field_def("type_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeName",
             kind: {:scalar, nil},
             label: :optional,
             name: :type_name,
             tag: 2,
             type: {:message, PgQuery.TypeName}
           }}
        end
      ),
      (
        def field_def(:compression) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "compression",
             kind: {:scalar, ""},
             label: :optional,
             name: :compression,
             tag: 3,
             type: :string
           }}
        end

        def field_def("compression") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "compression",
             kind: {:scalar, ""},
             label: :optional,
             name: :compression,
             tag: 3,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:inhcount) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inhcount",
             kind: {:scalar, 0},
             label: :optional,
             name: :inhcount,
             tag: 4,
             type: :int32
           }}
        end

        def field_def("inhcount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inhcount",
             kind: {:scalar, 0},
             label: :optional,
             name: :inhcount,
             tag: 4,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:is_local) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isLocal",
             kind: {:scalar, false},
             label: :optional,
             name: :is_local,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("isLocal") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isLocal",
             kind: {:scalar, false},
             label: :optional,
             name: :is_local,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("is_local") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isLocal",
             kind: {:scalar, false},
             label: :optional,
             name: :is_local,
             tag: 5,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:is_not_null) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isNotNull",
             kind: {:scalar, false},
             label: :optional,
             name: :is_not_null,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("isNotNull") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isNotNull",
             kind: {:scalar, false},
             label: :optional,
             name: :is_not_null,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("is_not_null") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isNotNull",
             kind: {:scalar, false},
             label: :optional,
             name: :is_not_null,
             tag: 6,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:is_from_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isFromType",
             kind: {:scalar, false},
             label: :optional,
             name: :is_from_type,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("isFromType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isFromType",
             kind: {:scalar, false},
             label: :optional,
             name: :is_from_type,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("is_from_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isFromType",
             kind: {:scalar, false},
             label: :optional,
             name: :is_from_type,
             tag: 7,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:storage) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "storage",
             kind: {:scalar, ""},
             label: :optional,
             name: :storage,
             tag: 8,
             type: :string
           }}
        end

        def field_def("storage") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "storage",
             kind: {:scalar, ""},
             label: :optional,
             name: :storage,
             tag: 8,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:raw_default) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rawDefault",
             kind: {:scalar, nil},
             label: :optional,
             name: :raw_default,
             tag: 9,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("rawDefault") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rawDefault",
             kind: {:scalar, nil},
             label: :optional,
             name: :raw_default,
             tag: 9,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("raw_default") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rawDefault",
             kind: {:scalar, nil},
             label: :optional,
             name: :raw_default,
             tag: 9,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:cooked_default) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cookedDefault",
             kind: {:scalar, nil},
             label: :optional,
             name: :cooked_default,
             tag: 10,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("cookedDefault") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cookedDefault",
             kind: {:scalar, nil},
             label: :optional,
             name: :cooked_default,
             tag: 10,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("cooked_default") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cookedDefault",
             kind: {:scalar, nil},
             label: :optional,
             name: :cooked_default,
             tag: 10,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:identity) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "identity",
             kind: {:scalar, ""},
             label: :optional,
             name: :identity,
             tag: 11,
             type: :string
           }}
        end

        def field_def("identity") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "identity",
             kind: {:scalar, ""},
             label: :optional,
             name: :identity,
             tag: 11,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:identity_sequence) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "identitySequence",
             kind: {:scalar, nil},
             label: :optional,
             name: :identity_sequence,
             tag: 12,
             type: {:message, PgQuery.RangeVar}
           }}
        end

        def field_def("identitySequence") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "identitySequence",
             kind: {:scalar, nil},
             label: :optional,
             name: :identity_sequence,
             tag: 12,
             type: {:message, PgQuery.RangeVar}
           }}
        end

        def field_def("identity_sequence") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "identitySequence",
             kind: {:scalar, nil},
             label: :optional,
             name: :identity_sequence,
             tag: 12,
             type: {:message, PgQuery.RangeVar}
           }}
        end
      ),
      (
        def field_def(:generated) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "generated",
             kind: {:scalar, ""},
             label: :optional,
             name: :generated,
             tag: 13,
             type: :string
           }}
        end

        def field_def("generated") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "generated",
             kind: {:scalar, ""},
             label: :optional,
             name: :generated,
             tag: 13,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:coll_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :coll_clause,
             tag: 14,
             type: {:message, PgQuery.CollateClause}
           }}
        end

        def field_def("collClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :coll_clause,
             tag: 14,
             type: {:message, PgQuery.CollateClause}
           }}
        end

        def field_def("coll_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :coll_clause,
             tag: 14,
             type: {:message, PgQuery.CollateClause}
           }}
        end
      ),
      (
        def field_def(:coll_oid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collOid",
             kind: {:scalar, 0},
             label: :optional,
             name: :coll_oid,
             tag: 15,
             type: :uint32
           }}
        end

        def field_def("collOid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collOid",
             kind: {:scalar, 0},
             label: :optional,
             name: :coll_oid,
             tag: 15,
             type: :uint32
           }}
        end

        def field_def("coll_oid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collOid",
             kind: {:scalar, 0},
             label: :optional,
             name: :coll_oid,
             tag: 15,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:constraints) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "constraints",
             kind: :unpacked,
             label: :repeated,
             name: :constraints,
             tag: 16,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("constraints") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "constraints",
             kind: :unpacked,
             label: :repeated,
             name: :constraints,
             tag: 16,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:fdwoptions) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fdwoptions",
             kind: :unpacked,
             label: :repeated,
             name: :fdwoptions,
             tag: 17,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("fdwoptions") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fdwoptions",
             kind: :unpacked,
             label: :repeated,
             name: :fdwoptions,
             tag: 17,
             type: {:message, PgQuery.Node}
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
             tag: 18,
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
             tag: 18,
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
    def default(:colname) do
      {:ok, ""}
    end,
    def default(:type_name) do
      {:ok, nil}
    end,
    def default(:compression) do
      {:ok, ""}
    end,
    def default(:inhcount) do
      {:ok, 0}
    end,
    def default(:is_local) do
      {:ok, false}
    end,
    def default(:is_not_null) do
      {:ok, false}
    end,
    def default(:is_from_type) do
      {:ok, false}
    end,
    def default(:storage) do
      {:ok, ""}
    end,
    def default(:raw_default) do
      {:ok, nil}
    end,
    def default(:cooked_default) do
      {:ok, nil}
    end,
    def default(:identity) do
      {:ok, ""}
    end,
    def default(:identity_sequence) do
      {:ok, nil}
    end,
    def default(:generated) do
      {:ok, ""}
    end,
    def default(:coll_clause) do
      {:ok, nil}
    end,
    def default(:coll_oid) do
      {:ok, 0}
    end,
    def default(:constraints) do
      {:error, :no_default_value}
    end,
    def default(:fdwoptions) do
      {:error, :no_default_value}
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
