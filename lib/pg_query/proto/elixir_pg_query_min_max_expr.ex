# credo:disable-for-this-file
defmodule PgQuery.MinMaxExpr do
  @moduledoc false
  defstruct xpr: nil,
            minmaxtype: 0,
            minmaxcollid: 0,
            inputcollid: 0,
            op: :MIN_MAX_OP_UNDEFINED,
            args: [],
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
        |> encode_xpr(msg)
        |> encode_minmaxtype(msg)
        |> encode_minmaxcollid(msg)
        |> encode_inputcollid(msg)
        |> encode_op(msg)
        |> encode_args(msg)
        |> encode_location(msg)
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
      defp encode_minmaxtype(acc, msg) do
        try do
          if msg.minmaxtype == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.minmaxtype)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:minmaxtype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_minmaxcollid(acc, msg) do
        try do
          if msg.minmaxcollid == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.minmaxcollid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:minmaxcollid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_inputcollid(acc, msg) do
        try do
          if msg.inputcollid == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.inputcollid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:inputcollid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_op(acc, msg) do
        try do
          if msg.op == :MIN_MAX_OP_UNDEFINED do
            acc
          else
            [acc, "(", msg.op |> PgQuery.MinMaxOp.encode() |> Protox.Encode.encode_enum()]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:op, "invalid field value"), __STACKTRACE__
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
                  [acc, "2", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:args, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "8", Protox.Encode.encode_int32(msg.location)]
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
          parse_key_value(bytes, struct(PgQuery.MinMaxExpr))
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
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[minmaxtype: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[minmaxcollid: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[inputcollid: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.MinMaxOp)
              {[op: value], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[args: msg.args ++ [PgQuery.Node.decode!(delimited)]], rest}

            {7, _, bytes} ->
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
        PgQuery.MinMaxExpr,
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
        2 => {:minmaxtype, {:scalar, 0}, :uint32},
        3 => {:minmaxcollid, {:scalar, 0}, :uint32},
        4 => {:inputcollid, {:scalar, 0}, :uint32},
        5 => {:op, {:scalar, :MIN_MAX_OP_UNDEFINED}, {:enum, PgQuery.MinMaxOp}},
        6 => {:args, :unpacked, {:message, PgQuery.Node}},
        7 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        args: {6, :unpacked, {:message, PgQuery.Node}},
        inputcollid: {4, {:scalar, 0}, :uint32},
        location: {7, {:scalar, 0}, :int32},
        minmaxcollid: {3, {:scalar, 0}, :uint32},
        minmaxtype: {2, {:scalar, 0}, :uint32},
        op: {5, {:scalar, :MIN_MAX_OP_UNDEFINED}, {:enum, PgQuery.MinMaxOp}},
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
          json_name: "minmaxtype",
          kind: {:scalar, 0},
          label: :optional,
          name: :minmaxtype,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "minmaxcollid",
          kind: {:scalar, 0},
          label: :optional,
          name: :minmaxcollid,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "inputcollid",
          kind: {:scalar, 0},
          label: :optional,
          name: :inputcollid,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "op",
          kind: {:scalar, :MIN_MAX_OP_UNDEFINED},
          label: :optional,
          name: :op,
          tag: 5,
          type: {:enum, PgQuery.MinMaxOp}
        },
        %{
          __struct__: Protox.Field,
          json_name: "args",
          kind: :unpacked,
          label: :repeated,
          name: :args,
          tag: 6,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 7,
          type: :int32
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
        def field_def(:minmaxtype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "minmaxtype",
             kind: {:scalar, 0},
             label: :optional,
             name: :minmaxtype,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("minmaxtype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "minmaxtype",
             kind: {:scalar, 0},
             label: :optional,
             name: :minmaxtype,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:minmaxcollid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "minmaxcollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :minmaxcollid,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("minmaxcollid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "minmaxcollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :minmaxcollid,
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:inputcollid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inputcollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :inputcollid,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("inputcollid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inputcollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :inputcollid,
             tag: 4,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:op) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "op",
             kind: {:scalar, :MIN_MAX_OP_UNDEFINED},
             label: :optional,
             name: :op,
             tag: 5,
             type: {:enum, PgQuery.MinMaxOp}
           }}
        end

        def field_def("op") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "op",
             kind: {:scalar, :MIN_MAX_OP_UNDEFINED},
             label: :optional,
             name: :op,
             tag: 5,
             type: {:enum, PgQuery.MinMaxOp}
           }}
        end

        []
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
             tag: 6,
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
             tag: 6,
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
             tag: 7,
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
             tag: 7,
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
    def default(:xpr) do
      {:ok, nil}
    end,
    def default(:minmaxtype) do
      {:ok, 0}
    end,
    def default(:minmaxcollid) do
      {:ok, 0}
    end,
    def default(:inputcollid) do
      {:ok, 0}
    end,
    def default(:op) do
      {:ok, :MIN_MAX_OP_UNDEFINED}
    end,
    def default(:args) do
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
