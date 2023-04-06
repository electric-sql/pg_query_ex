# credo:disable-for-this-file
defmodule PgQuery.SubPlan do
  @moduledoc false
  defstruct xpr: nil,
            sub_link_type: :SUB_LINK_TYPE_UNDEFINED,
            testexpr: nil,
            param_ids: [],
            plan_id: 0,
            plan_name: "",
            first_col_type: 0,
            first_col_typmod: 0,
            first_col_collation: 0,
            use_hash_table: false,
            unknown_eq_false: false,
            parallel_safe: false,
            set_param: [],
            par_param: [],
            args: [],
            startup_cost: 0.0,
            per_call_cost: 0.0

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
        |> encode_xpr(msg)
        |> encode_sub_link_type(msg)
        |> encode_testexpr(msg)
        |> encode_param_ids(msg)
        |> encode_plan_id(msg)
        |> encode_plan_name(msg)
        |> encode_first_col_type(msg)
        |> encode_first_col_typmod(msg)
        |> encode_first_col_collation(msg)
        |> encode_use_hash_table(msg)
        |> encode_unknown_eq_false(msg)
        |> encode_parallel_safe(msg)
        |> encode_set_param(msg)
        |> encode_par_param(msg)
        |> encode_args(msg)
        |> encode_startup_cost(msg)
        |> encode_per_call_cost(msg)
      end
    )

    []

    [
      defp encode_xpr(acc, msg) do
        try do
          if msg.xpr == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.xpr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:xpr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_sub_link_type(acc, msg) do
        try do
          if msg.sub_link_type == :SUB_LINK_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "\x10",
              msg.sub_link_type |> PgQuery.SubLinkType.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sub_link_type, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_testexpr(acc, msg) do
        try do
          if msg.testexpr == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.testexpr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:testexpr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_param_ids(acc, msg) do
        try do
          case msg.param_ids do
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
            reraise Protox.EncodingError.new(:param_ids, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_plan_id(acc, msg) do
        try do
          if msg.plan_id == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_int32(msg.plan_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:plan_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_plan_name(acc, msg) do
        try do
          if msg.plan_name == "" do
            acc
          else
            [acc, "2", Protox.Encode.encode_string(msg.plan_name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:plan_name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_first_col_type(acc, msg) do
        try do
          if msg.first_col_type == 0 do
            acc
          else
            [acc, "8", Protox.Encode.encode_uint32(msg.first_col_type)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:first_col_type, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_first_col_typmod(acc, msg) do
        try do
          if msg.first_col_typmod == 0 do
            acc
          else
            [acc, "@", Protox.Encode.encode_int32(msg.first_col_typmod)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:first_col_typmod, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_first_col_collation(acc, msg) do
        try do
          if msg.first_col_collation == 0 do
            acc
          else
            [acc, "H", Protox.Encode.encode_uint32(msg.first_col_collation)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:first_col_collation, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_use_hash_table(acc, msg) do
        try do
          if msg.use_hash_table == false do
            acc
          else
            [acc, "P", Protox.Encode.encode_bool(msg.use_hash_table)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:use_hash_table, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_unknown_eq_false(acc, msg) do
        try do
          if msg.unknown_eq_false == false do
            acc
          else
            [acc, "X", Protox.Encode.encode_bool(msg.unknown_eq_false)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:unknown_eq_false, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_parallel_safe(acc, msg) do
        try do
          if msg.parallel_safe == false do
            acc
          else
            [acc, "`", Protox.Encode.encode_bool(msg.parallel_safe)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:parallel_safe, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_set_param(acc, msg) do
        try do
          case msg.set_param do
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
            reraise Protox.EncodingError.new(:set_param, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_par_param(acc, msg) do
        try do
          case msg.par_param do
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
            reraise Protox.EncodingError.new(:par_param, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_args(acc, msg) do
        try do
          case msg.args do
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
            reraise Protox.EncodingError.new(:args, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_startup_cost(acc, msg) do
        try do
          if msg.startup_cost == 0.0 do
            acc
          else
            [acc, "\x81\x01", Protox.Encode.encode_double(msg.startup_cost)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:startup_cost, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_per_call_cost(acc, msg) do
        try do
          if msg.per_call_cost == 0.0 do
            acc
          else
            [acc, "\x89\x01", Protox.Encode.encode_double(msg.per_call_cost)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:per_call_cost, "invalid field value"),
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
          parse_key_value(bytes, struct(PgQuery.SubPlan))
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
              {[xpr: Protox.MergeMessage.merge(msg.xpr, PgQuery.Node.decode!(delimited))], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.SubLinkType)
              {[sub_link_type: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 testexpr:
                   Protox.MergeMessage.merge(msg.testexpr, PgQuery.Node.decode!(delimited))
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[param_ids: msg.param_ids ++ [PgQuery.Node.decode!(delimited)]], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[plan_id: value], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[plan_name: delimited], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[first_col_type: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[first_col_typmod: value], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[first_col_collation: value], rest}

            {10, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[use_hash_table: value], rest}

            {11, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[unknown_eq_false: value], rest}

            {12, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[parallel_safe: value], rest}

            {13, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[set_param: msg.set_param ++ [PgQuery.Node.decode!(delimited)]], rest}

            {14, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[par_param: msg.par_param ++ [PgQuery.Node.decode!(delimited)]], rest}

            {15, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[args: msg.args ++ [PgQuery.Node.decode!(delimited)]], rest}

            {16, _, bytes} ->
              {value, rest} = Protox.Decode.parse_double(bytes)
              {[startup_cost: value], rest}

            {17, _, bytes} ->
              {value, rest} = Protox.Decode.parse_double(bytes)
              {[per_call_cost: value], rest}

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
        PgQuery.SubPlan,
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
        1 => {:xpr, {:scalar, nil}, {:message, PgQuery.Node}},
        2 => {:sub_link_type, {:scalar, :SUB_LINK_TYPE_UNDEFINED}, {:enum, PgQuery.SubLinkType}},
        3 => {:testexpr, {:scalar, nil}, {:message, PgQuery.Node}},
        4 => {:param_ids, :unpacked, {:message, PgQuery.Node}},
        5 => {:plan_id, {:scalar, 0}, :int32},
        6 => {:plan_name, {:scalar, ""}, :string},
        7 => {:first_col_type, {:scalar, 0}, :uint32},
        8 => {:first_col_typmod, {:scalar, 0}, :int32},
        9 => {:first_col_collation, {:scalar, 0}, :uint32},
        10 => {:use_hash_table, {:scalar, false}, :bool},
        11 => {:unknown_eq_false, {:scalar, false}, :bool},
        12 => {:parallel_safe, {:scalar, false}, :bool},
        13 => {:set_param, :unpacked, {:message, PgQuery.Node}},
        14 => {:par_param, :unpacked, {:message, PgQuery.Node}},
        15 => {:args, :unpacked, {:message, PgQuery.Node}},
        16 => {:startup_cost, {:scalar, 0.0}, :double},
        17 => {:per_call_cost, {:scalar, 0.0}, :double}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        args: {15, :unpacked, {:message, PgQuery.Node}},
        first_col_collation: {9, {:scalar, 0}, :uint32},
        first_col_type: {7, {:scalar, 0}, :uint32},
        first_col_typmod: {8, {:scalar, 0}, :int32},
        par_param: {14, :unpacked, {:message, PgQuery.Node}},
        parallel_safe: {12, {:scalar, false}, :bool},
        param_ids: {4, :unpacked, {:message, PgQuery.Node}},
        per_call_cost: {17, {:scalar, 0.0}, :double},
        plan_id: {5, {:scalar, 0}, :int32},
        plan_name: {6, {:scalar, ""}, :string},
        set_param: {13, :unpacked, {:message, PgQuery.Node}},
        startup_cost: {16, {:scalar, 0.0}, :double},
        sub_link_type: {2, {:scalar, :SUB_LINK_TYPE_UNDEFINED}, {:enum, PgQuery.SubLinkType}},
        testexpr: {3, {:scalar, nil}, {:message, PgQuery.Node}},
        unknown_eq_false: {11, {:scalar, false}, :bool},
        use_hash_table: {10, {:scalar, false}, :bool},
        xpr: {1, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "xpr",
          kind: {:scalar, nil},
          label: :optional,
          name: :xpr,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "subLinkType",
          kind: {:scalar, :SUB_LINK_TYPE_UNDEFINED},
          label: :optional,
          name: :sub_link_type,
          tag: 2,
          type: {:enum, PgQuery.SubLinkType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "testexpr",
          kind: {:scalar, nil},
          label: :optional,
          name: :testexpr,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "paramIds",
          kind: :unpacked,
          label: :repeated,
          name: :param_ids,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "planId",
          kind: {:scalar, 0},
          label: :optional,
          name: :plan_id,
          tag: 5,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "planName",
          kind: {:scalar, ""},
          label: :optional,
          name: :plan_name,
          tag: 6,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "firstColType",
          kind: {:scalar, 0},
          label: :optional,
          name: :first_col_type,
          tag: 7,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "firstColTypmod",
          kind: {:scalar, 0},
          label: :optional,
          name: :first_col_typmod,
          tag: 8,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "firstColCollation",
          kind: {:scalar, 0},
          label: :optional,
          name: :first_col_collation,
          tag: 9,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "useHashTable",
          kind: {:scalar, false},
          label: :optional,
          name: :use_hash_table,
          tag: 10,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "unknownEqFalse",
          kind: {:scalar, false},
          label: :optional,
          name: :unknown_eq_false,
          tag: 11,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "parallelSafe",
          kind: {:scalar, false},
          label: :optional,
          name: :parallel_safe,
          tag: 12,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "setParam",
          kind: :unpacked,
          label: :repeated,
          name: :set_param,
          tag: 13,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "parParam",
          kind: :unpacked,
          label: :repeated,
          name: :par_param,
          tag: 14,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "args",
          kind: :unpacked,
          label: :repeated,
          name: :args,
          tag: 15,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "startupCost",
          kind: {:scalar, 0.0},
          label: :optional,
          name: :startup_cost,
          tag: 16,
          type: :double
        },
        %{
          __struct__: Protox.Field,
          json_name: "perCallCost",
          kind: {:scalar, 0.0},
          label: :optional,
          name: :per_call_cost,
          tag: 17,
          type: :double
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:xpr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :xpr,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("xpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :xpr,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:sub_link_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subLinkType",
             kind: {:scalar, :SUB_LINK_TYPE_UNDEFINED},
             label: :optional,
             name: :sub_link_type,
             tag: 2,
             type: {:enum, PgQuery.SubLinkType}
           }}
        end

        def field_def("subLinkType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subLinkType",
             kind: {:scalar, :SUB_LINK_TYPE_UNDEFINED},
             label: :optional,
             name: :sub_link_type,
             tag: 2,
             type: {:enum, PgQuery.SubLinkType}
           }}
        end

        def field_def("sub_link_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subLinkType",
             kind: {:scalar, :SUB_LINK_TYPE_UNDEFINED},
             label: :optional,
             name: :sub_link_type,
             tag: 2,
             type: {:enum, PgQuery.SubLinkType}
           }}
        end
      ),
      (
        def field_def(:testexpr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "testexpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :testexpr,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("testexpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "testexpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :testexpr,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:param_ids) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paramIds",
             kind: :unpacked,
             label: :repeated,
             name: :param_ids,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("paramIds") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paramIds",
             kind: :unpacked,
             label: :repeated,
             name: :param_ids,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("param_ids") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paramIds",
             kind: :unpacked,
             label: :repeated,
             name: :param_ids,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:plan_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "planId",
             kind: {:scalar, 0},
             label: :optional,
             name: :plan_id,
             tag: 5,
             type: :int32
           }}
        end

        def field_def("planId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "planId",
             kind: {:scalar, 0},
             label: :optional,
             name: :plan_id,
             tag: 5,
             type: :int32
           }}
        end

        def field_def("plan_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "planId",
             kind: {:scalar, 0},
             label: :optional,
             name: :plan_id,
             tag: 5,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:plan_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "planName",
             kind: {:scalar, ""},
             label: :optional,
             name: :plan_name,
             tag: 6,
             type: :string
           }}
        end

        def field_def("planName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "planName",
             kind: {:scalar, ""},
             label: :optional,
             name: :plan_name,
             tag: 6,
             type: :string
           }}
        end

        def field_def("plan_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "planName",
             kind: {:scalar, ""},
             label: :optional,
             name: :plan_name,
             tag: 6,
             type: :string
           }}
        end
      ),
      (
        def field_def(:first_col_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "firstColType",
             kind: {:scalar, 0},
             label: :optional,
             name: :first_col_type,
             tag: 7,
             type: :uint32
           }}
        end

        def field_def("firstColType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "firstColType",
             kind: {:scalar, 0},
             label: :optional,
             name: :first_col_type,
             tag: 7,
             type: :uint32
           }}
        end

        def field_def("first_col_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "firstColType",
             kind: {:scalar, 0},
             label: :optional,
             name: :first_col_type,
             tag: 7,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:first_col_typmod) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "firstColTypmod",
             kind: {:scalar, 0},
             label: :optional,
             name: :first_col_typmod,
             tag: 8,
             type: :int32
           }}
        end

        def field_def("firstColTypmod") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "firstColTypmod",
             kind: {:scalar, 0},
             label: :optional,
             name: :first_col_typmod,
             tag: 8,
             type: :int32
           }}
        end

        def field_def("first_col_typmod") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "firstColTypmod",
             kind: {:scalar, 0},
             label: :optional,
             name: :first_col_typmod,
             tag: 8,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:first_col_collation) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "firstColCollation",
             kind: {:scalar, 0},
             label: :optional,
             name: :first_col_collation,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("firstColCollation") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "firstColCollation",
             kind: {:scalar, 0},
             label: :optional,
             name: :first_col_collation,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("first_col_collation") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "firstColCollation",
             kind: {:scalar, 0},
             label: :optional,
             name: :first_col_collation,
             tag: 9,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:use_hash_table) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "useHashTable",
             kind: {:scalar, false},
             label: :optional,
             name: :use_hash_table,
             tag: 10,
             type: :bool
           }}
        end

        def field_def("useHashTable") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "useHashTable",
             kind: {:scalar, false},
             label: :optional,
             name: :use_hash_table,
             tag: 10,
             type: :bool
           }}
        end

        def field_def("use_hash_table") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "useHashTable",
             kind: {:scalar, false},
             label: :optional,
             name: :use_hash_table,
             tag: 10,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:unknown_eq_false) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "unknownEqFalse",
             kind: {:scalar, false},
             label: :optional,
             name: :unknown_eq_false,
             tag: 11,
             type: :bool
           }}
        end

        def field_def("unknownEqFalse") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "unknownEqFalse",
             kind: {:scalar, false},
             label: :optional,
             name: :unknown_eq_false,
             tag: 11,
             type: :bool
           }}
        end

        def field_def("unknown_eq_false") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "unknownEqFalse",
             kind: {:scalar, false},
             label: :optional,
             name: :unknown_eq_false,
             tag: 11,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:parallel_safe) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "parallelSafe",
             kind: {:scalar, false},
             label: :optional,
             name: :parallel_safe,
             tag: 12,
             type: :bool
           }}
        end

        def field_def("parallelSafe") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "parallelSafe",
             kind: {:scalar, false},
             label: :optional,
             name: :parallel_safe,
             tag: 12,
             type: :bool
           }}
        end

        def field_def("parallel_safe") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "parallelSafe",
             kind: {:scalar, false},
             label: :optional,
             name: :parallel_safe,
             tag: 12,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:set_param) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "setParam",
             kind: :unpacked,
             label: :repeated,
             name: :set_param,
             tag: 13,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("setParam") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "setParam",
             kind: :unpacked,
             label: :repeated,
             name: :set_param,
             tag: 13,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("set_param") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "setParam",
             kind: :unpacked,
             label: :repeated,
             name: :set_param,
             tag: 13,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:par_param) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "parParam",
             kind: :unpacked,
             label: :repeated,
             name: :par_param,
             tag: 14,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("parParam") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "parParam",
             kind: :unpacked,
             label: :repeated,
             name: :par_param,
             tag: 14,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("par_param") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "parParam",
             kind: :unpacked,
             label: :repeated,
             name: :par_param,
             tag: 14,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:args) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "args",
             kind: :unpacked,
             label: :repeated,
             name: :args,
             tag: 15,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("args") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "args",
             kind: :unpacked,
             label: :repeated,
             name: :args,
             tag: 15,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:startup_cost) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startupCost",
             kind: {:scalar, 0.0},
             label: :optional,
             name: :startup_cost,
             tag: 16,
             type: :double
           }}
        end

        def field_def("startupCost") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startupCost",
             kind: {:scalar, 0.0},
             label: :optional,
             name: :startup_cost,
             tag: 16,
             type: :double
           }}
        end

        def field_def("startup_cost") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startupCost",
             kind: {:scalar, 0.0},
             label: :optional,
             name: :startup_cost,
             tag: 16,
             type: :double
           }}
        end
      ),
      (
        def field_def(:per_call_cost) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "perCallCost",
             kind: {:scalar, 0.0},
             label: :optional,
             name: :per_call_cost,
             tag: 17,
             type: :double
           }}
        end

        def field_def("perCallCost") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "perCallCost",
             kind: {:scalar, 0.0},
             label: :optional,
             name: :per_call_cost,
             tag: 17,
             type: :double
           }}
        end

        def field_def("per_call_cost") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "perCallCost",
             kind: {:scalar, 0.0},
             label: :optional,
             name: :per_call_cost,
             tag: 17,
             type: :double
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
    def default(:xpr) do
      {:ok, nil}
    end,
    def default(:sub_link_type) do
      {:ok, :SUB_LINK_TYPE_UNDEFINED}
    end,
    def default(:testexpr) do
      {:ok, nil}
    end,
    def default(:param_ids) do
      {:error, :no_default_value}
    end,
    def default(:plan_id) do
      {:ok, 0}
    end,
    def default(:plan_name) do
      {:ok, ""}
    end,
    def default(:first_col_type) do
      {:ok, 0}
    end,
    def default(:first_col_typmod) do
      {:ok, 0}
    end,
    def default(:first_col_collation) do
      {:ok, 0}
    end,
    def default(:use_hash_table) do
      {:ok, false}
    end,
    def default(:unknown_eq_false) do
      {:ok, false}
    end,
    def default(:parallel_safe) do
      {:ok, false}
    end,
    def default(:set_param) do
      {:error, :no_default_value}
    end,
    def default(:par_param) do
      {:error, :no_default_value}
    end,
    def default(:args) do
      {:error, :no_default_value}
    end,
    def default(:startup_cost) do
      {:ok, 0.0}
    end,
    def default(:per_call_cost) do
      {:ok, 0.0}
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
