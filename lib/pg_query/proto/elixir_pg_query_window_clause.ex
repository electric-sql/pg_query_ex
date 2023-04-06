# credo:disable-for-this-file
defmodule PgQuery.WindowClause do
  @moduledoc false
  defstruct name: "",
            refname: "",
            partition_clause: [],
            order_clause: [],
            frame_options: 0,
            start_offset: nil,
            end_offset: nil,
            run_condition: [],
            start_in_range_func: 0,
            end_in_range_func: 0,
            in_range_coll: 0,
            in_range_asc: false,
            in_range_nulls_first: false,
            winref: 0,
            copied_order: false

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
        |> encode_name(msg)
        |> encode_refname(msg)
        |> encode_partition_clause(msg)
        |> encode_order_clause(msg)
        |> encode_frame_options(msg)
        |> encode_start_offset(msg)
        |> encode_end_offset(msg)
        |> encode_run_condition(msg)
        |> encode_start_in_range_func(msg)
        |> encode_end_in_range_func(msg)
        |> encode_in_range_coll(msg)
        |> encode_in_range_asc(msg)
        |> encode_in_range_nulls_first(msg)
        |> encode_winref(msg)
        |> encode_copied_order(msg)
      end
    )

    []

    [
      defp encode_name(acc, msg) do
        try do
          if msg.name == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_refname(acc, msg) do
        try do
          if msg.refname == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.refname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:refname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_partition_clause(acc, msg) do
        try do
          case msg.partition_clause do
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
            reraise Protox.EncodingError.new(:partition_clause, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_order_clause(acc, msg) do
        try do
          case msg.order_clause do
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
            reraise Protox.EncodingError.new(:order_clause, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_frame_options(acc, msg) do
        try do
          if msg.frame_options == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_int32(msg.frame_options)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:frame_options, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_start_offset(acc, msg) do
        try do
          if msg.start_offset == nil do
            acc
          else
            [acc, "2", Protox.Encode.encode_message(msg.start_offset)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:start_offset, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_end_offset(acc, msg) do
        try do
          if msg.end_offset == nil do
            acc
          else
            [acc, ":", Protox.Encode.encode_message(msg.end_offset)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:end_offset, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_run_condition(acc, msg) do
        try do
          case msg.run_condition do
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
            reraise Protox.EncodingError.new(:run_condition, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_start_in_range_func(acc, msg) do
        try do
          if msg.start_in_range_func == 0 do
            acc
          else
            [acc, "H", Protox.Encode.encode_uint32(msg.start_in_range_func)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:start_in_range_func, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_end_in_range_func(acc, msg) do
        try do
          if msg.end_in_range_func == 0 do
            acc
          else
            [acc, "P", Protox.Encode.encode_uint32(msg.end_in_range_func)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:end_in_range_func, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_in_range_coll(acc, msg) do
        try do
          if msg.in_range_coll == 0 do
            acc
          else
            [acc, "X", Protox.Encode.encode_uint32(msg.in_range_coll)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:in_range_coll, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_in_range_asc(acc, msg) do
        try do
          if msg.in_range_asc == false do
            acc
          else
            [acc, "`", Protox.Encode.encode_bool(msg.in_range_asc)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:in_range_asc, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_in_range_nulls_first(acc, msg) do
        try do
          if msg.in_range_nulls_first == false do
            acc
          else
            [acc, "h", Protox.Encode.encode_bool(msg.in_range_nulls_first)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:in_range_nulls_first, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_winref(acc, msg) do
        try do
          if msg.winref == 0 do
            acc
          else
            [acc, "p", Protox.Encode.encode_uint32(msg.winref)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:winref, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_copied_order(acc, msg) do
        try do
          if msg.copied_order == false do
            acc
          else
            [acc, "x", Protox.Encode.encode_bool(msg.copied_order)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:copied_order, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.WindowClause))
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
              {[name: delimited], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[refname: delimited], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[partition_clause: msg.partition_clause ++ [PgQuery.Node.decode!(delimited)]],
               rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[order_clause: msg.order_clause ++ [PgQuery.Node.decode!(delimited)]], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[frame_options: value], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 start_offset:
                   Protox.MergeMessage.merge(msg.start_offset, PgQuery.Node.decode!(delimited))
               ], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 end_offset:
                   Protox.MergeMessage.merge(msg.end_offset, PgQuery.Node.decode!(delimited))
               ], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[run_condition: msg.run_condition ++ [PgQuery.Node.decode!(delimited)]], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[start_in_range_func: value], rest}

            {10, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[end_in_range_func: value], rest}

            {11, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[in_range_coll: value], rest}

            {12, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[in_range_asc: value], rest}

            {13, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[in_range_nulls_first: value], rest}

            {14, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[winref: value], rest}

            {15, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[copied_order: value], rest}

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
        PgQuery.WindowClause,
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
        1 => {:name, {:scalar, ""}, :string},
        2 => {:refname, {:scalar, ""}, :string},
        3 => {:partition_clause, :unpacked, {:message, PgQuery.Node}},
        4 => {:order_clause, :unpacked, {:message, PgQuery.Node}},
        5 => {:frame_options, {:scalar, 0}, :int32},
        6 => {:start_offset, {:scalar, nil}, {:message, PgQuery.Node}},
        7 => {:end_offset, {:scalar, nil}, {:message, PgQuery.Node}},
        8 => {:run_condition, :unpacked, {:message, PgQuery.Node}},
        9 => {:start_in_range_func, {:scalar, 0}, :uint32},
        10 => {:end_in_range_func, {:scalar, 0}, :uint32},
        11 => {:in_range_coll, {:scalar, 0}, :uint32},
        12 => {:in_range_asc, {:scalar, false}, :bool},
        13 => {:in_range_nulls_first, {:scalar, false}, :bool},
        14 => {:winref, {:scalar, 0}, :uint32},
        15 => {:copied_order, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        copied_order: {15, {:scalar, false}, :bool},
        end_in_range_func: {10, {:scalar, 0}, :uint32},
        end_offset: {7, {:scalar, nil}, {:message, PgQuery.Node}},
        frame_options: {5, {:scalar, 0}, :int32},
        in_range_asc: {12, {:scalar, false}, :bool},
        in_range_coll: {11, {:scalar, 0}, :uint32},
        in_range_nulls_first: {13, {:scalar, false}, :bool},
        name: {1, {:scalar, ""}, :string},
        order_clause: {4, :unpacked, {:message, PgQuery.Node}},
        partition_clause: {3, :unpacked, {:message, PgQuery.Node}},
        refname: {2, {:scalar, ""}, :string},
        run_condition: {8, :unpacked, {:message, PgQuery.Node}},
        start_in_range_func: {9, {:scalar, 0}, :uint32},
        start_offset: {6, {:scalar, nil}, {:message, PgQuery.Node}},
        winref: {14, {:scalar, 0}, :uint32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "name",
          kind: {:scalar, ""},
          label: :optional,
          name: :name,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "refname",
          kind: {:scalar, ""},
          label: :optional,
          name: :refname,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "partitionClause",
          kind: :unpacked,
          label: :repeated,
          name: :partition_clause,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "orderClause",
          kind: :unpacked,
          label: :repeated,
          name: :order_clause,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "frameOptions",
          kind: {:scalar, 0},
          label: :optional,
          name: :frame_options,
          tag: 5,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "startOffset",
          kind: {:scalar, nil},
          label: :optional,
          name: :start_offset,
          tag: 6,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "endOffset",
          kind: {:scalar, nil},
          label: :optional,
          name: :end_offset,
          tag: 7,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "runCondition",
          kind: :unpacked,
          label: :repeated,
          name: :run_condition,
          tag: 8,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "startInRangeFunc",
          kind: {:scalar, 0},
          label: :optional,
          name: :start_in_range_func,
          tag: 9,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "endInRangeFunc",
          kind: {:scalar, 0},
          label: :optional,
          name: :end_in_range_func,
          tag: 10,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "inRangeColl",
          kind: {:scalar, 0},
          label: :optional,
          name: :in_range_coll,
          tag: 11,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "inRangeAsc",
          kind: {:scalar, false},
          label: :optional,
          name: :in_range_asc,
          tag: 12,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "inRangeNullsFirst",
          kind: {:scalar, false},
          label: :optional,
          name: :in_range_nulls_first,
          tag: 13,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "winref",
          kind: {:scalar, 0},
          label: :optional,
          name: :winref,
          tag: 14,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "copiedOrder",
          kind: {:scalar, false},
          label: :optional,
          name: :copied_order,
          tag: 15,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, ""},
             label: :optional,
             name: :name,
             tag: 1,
             type: :string
           }}
        end

        def field_def("name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, ""},
             label: :optional,
             name: :name,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:refname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "refname",
             kind: {:scalar, ""},
             label: :optional,
             name: :refname,
             tag: 2,
             type: :string
           }}
        end

        def field_def("refname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "refname",
             kind: {:scalar, ""},
             label: :optional,
             name: :refname,
             tag: 2,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:partition_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partitionClause",
             kind: :unpacked,
             label: :repeated,
             name: :partition_clause,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("partitionClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partitionClause",
             kind: :unpacked,
             label: :repeated,
             name: :partition_clause,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("partition_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partitionClause",
             kind: :unpacked,
             label: :repeated,
             name: :partition_clause,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:order_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "orderClause",
             kind: :unpacked,
             label: :repeated,
             name: :order_clause,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("orderClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "orderClause",
             kind: :unpacked,
             label: :repeated,
             name: :order_clause,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("order_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "orderClause",
             kind: :unpacked,
             label: :repeated,
             name: :order_clause,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:frame_options) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "frameOptions",
             kind: {:scalar, 0},
             label: :optional,
             name: :frame_options,
             tag: 5,
             type: :int32
           }}
        end

        def field_def("frameOptions") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "frameOptions",
             kind: {:scalar, 0},
             label: :optional,
             name: :frame_options,
             tag: 5,
             type: :int32
           }}
        end

        def field_def("frame_options") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "frameOptions",
             kind: {:scalar, 0},
             label: :optional,
             name: :frame_options,
             tag: 5,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:start_offset) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startOffset",
             kind: {:scalar, nil},
             label: :optional,
             name: :start_offset,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("startOffset") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startOffset",
             kind: {:scalar, nil},
             label: :optional,
             name: :start_offset,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("start_offset") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startOffset",
             kind: {:scalar, nil},
             label: :optional,
             name: :start_offset,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:end_offset) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "endOffset",
             kind: {:scalar, nil},
             label: :optional,
             name: :end_offset,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("endOffset") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "endOffset",
             kind: {:scalar, nil},
             label: :optional,
             name: :end_offset,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("end_offset") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "endOffset",
             kind: {:scalar, nil},
             label: :optional,
             name: :end_offset,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:run_condition) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "runCondition",
             kind: :unpacked,
             label: :repeated,
             name: :run_condition,
             tag: 8,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("runCondition") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "runCondition",
             kind: :unpacked,
             label: :repeated,
             name: :run_condition,
             tag: 8,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("run_condition") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "runCondition",
             kind: :unpacked,
             label: :repeated,
             name: :run_condition,
             tag: 8,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:start_in_range_func) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startInRangeFunc",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_in_range_func,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("startInRangeFunc") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startInRangeFunc",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_in_range_func,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("start_in_range_func") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startInRangeFunc",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_in_range_func,
             tag: 9,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:end_in_range_func) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "endInRangeFunc",
             kind: {:scalar, 0},
             label: :optional,
             name: :end_in_range_func,
             tag: 10,
             type: :uint32
           }}
        end

        def field_def("endInRangeFunc") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "endInRangeFunc",
             kind: {:scalar, 0},
             label: :optional,
             name: :end_in_range_func,
             tag: 10,
             type: :uint32
           }}
        end

        def field_def("end_in_range_func") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "endInRangeFunc",
             kind: {:scalar, 0},
             label: :optional,
             name: :end_in_range_func,
             tag: 10,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:in_range_coll) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inRangeColl",
             kind: {:scalar, 0},
             label: :optional,
             name: :in_range_coll,
             tag: 11,
             type: :uint32
           }}
        end

        def field_def("inRangeColl") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inRangeColl",
             kind: {:scalar, 0},
             label: :optional,
             name: :in_range_coll,
             tag: 11,
             type: :uint32
           }}
        end

        def field_def("in_range_coll") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inRangeColl",
             kind: {:scalar, 0},
             label: :optional,
             name: :in_range_coll,
             tag: 11,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:in_range_asc) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inRangeAsc",
             kind: {:scalar, false},
             label: :optional,
             name: :in_range_asc,
             tag: 12,
             type: :bool
           }}
        end

        def field_def("inRangeAsc") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inRangeAsc",
             kind: {:scalar, false},
             label: :optional,
             name: :in_range_asc,
             tag: 12,
             type: :bool
           }}
        end

        def field_def("in_range_asc") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inRangeAsc",
             kind: {:scalar, false},
             label: :optional,
             name: :in_range_asc,
             tag: 12,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:in_range_nulls_first) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inRangeNullsFirst",
             kind: {:scalar, false},
             label: :optional,
             name: :in_range_nulls_first,
             tag: 13,
             type: :bool
           }}
        end

        def field_def("inRangeNullsFirst") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inRangeNullsFirst",
             kind: {:scalar, false},
             label: :optional,
             name: :in_range_nulls_first,
             tag: 13,
             type: :bool
           }}
        end

        def field_def("in_range_nulls_first") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inRangeNullsFirst",
             kind: {:scalar, false},
             label: :optional,
             name: :in_range_nulls_first,
             tag: 13,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:winref) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "winref",
             kind: {:scalar, 0},
             label: :optional,
             name: :winref,
             tag: 14,
             type: :uint32
           }}
        end

        def field_def("winref") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "winref",
             kind: {:scalar, 0},
             label: :optional,
             name: :winref,
             tag: 14,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:copied_order) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "copiedOrder",
             kind: {:scalar, false},
             label: :optional,
             name: :copied_order,
             tag: 15,
             type: :bool
           }}
        end

        def field_def("copiedOrder") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "copiedOrder",
             kind: {:scalar, false},
             label: :optional,
             name: :copied_order,
             tag: 15,
             type: :bool
           }}
        end

        def field_def("copied_order") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "copiedOrder",
             kind: {:scalar, false},
             label: :optional,
             name: :copied_order,
             tag: 15,
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
    def default(:name) do
      {:ok, ""}
    end,
    def default(:refname) do
      {:ok, ""}
    end,
    def default(:partition_clause) do
      {:error, :no_default_value}
    end,
    def default(:order_clause) do
      {:error, :no_default_value}
    end,
    def default(:frame_options) do
      {:ok, 0}
    end,
    def default(:start_offset) do
      {:ok, nil}
    end,
    def default(:end_offset) do
      {:ok, nil}
    end,
    def default(:run_condition) do
      {:error, :no_default_value}
    end,
    def default(:start_in_range_func) do
      {:ok, 0}
    end,
    def default(:end_in_range_func) do
      {:ok, 0}
    end,
    def default(:in_range_coll) do
      {:ok, 0}
    end,
    def default(:in_range_asc) do
      {:ok, false}
    end,
    def default(:in_range_nulls_first) do
      {:ok, false}
    end,
    def default(:winref) do
      {:ok, 0}
    end,
    def default(:copied_order) do
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
