# credo:disable-for-this-file
defmodule PgQuery.OpExpr do
  @moduledoc false
  defstruct xpr: nil,
            opno: 0,
            opfuncid: 0,
            opresulttype: 0,
            opretset: false,
            opcollid: 0,
            inputcollid: 0,
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
        |> encode_opno(msg)
        |> encode_opfuncid(msg)
        |> encode_opresulttype(msg)
        |> encode_opretset(msg)
        |> encode_opcollid(msg)
        |> encode_inputcollid(msg)
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
      defp encode_opno(acc, msg) do
        try do
          if msg.opno == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.opno)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:opno, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_opfuncid(acc, msg) do
        try do
          if msg.opfuncid == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.opfuncid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:opfuncid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_opresulttype(acc, msg) do
        try do
          if msg.opresulttype == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.opresulttype)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:opresulttype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_opretset(acc, msg) do
        try do
          if msg.opretset == false do
            acc
          else
            [acc, "(", Protox.Encode.encode_bool(msg.opretset)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:opretset, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_opcollid(acc, msg) do
        try do
          if msg.opcollid == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_uint32(msg.opcollid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:opcollid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_inputcollid(acc, msg) do
        try do
          if msg.inputcollid == 0 do
            acc
          else
            [acc, "8", Protox.Encode.encode_uint32(msg.inputcollid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:inputcollid, "invalid field value"), __STACKTRACE__
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
                  [acc, "B", Protox.Encode.encode_message(value)]
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
            [acc, "H", Protox.Encode.encode_int32(msg.location)]
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
          parse_key_value(bytes, struct(PgQuery.OpExpr))
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
              {[opno: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[opfuncid: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[opresulttype: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[opretset: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[opcollid: value], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[inputcollid: value], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[args: msg.args ++ [PgQuery.Node.decode!(delimited)]], rest}

            {9, _, bytes} ->
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
        PgQuery.OpExpr,
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
        2 => {:opno, {:scalar, 0}, :uint32},
        3 => {:opfuncid, {:scalar, 0}, :uint32},
        4 => {:opresulttype, {:scalar, 0}, :uint32},
        5 => {:opretset, {:scalar, false}, :bool},
        6 => {:opcollid, {:scalar, 0}, :uint32},
        7 => {:inputcollid, {:scalar, 0}, :uint32},
        8 => {:args, :unpacked, {:message, PgQuery.Node}},
        9 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        args: {8, :unpacked, {:message, PgQuery.Node}},
        inputcollid: {7, {:scalar, 0}, :uint32},
        location: {9, {:scalar, 0}, :int32},
        opcollid: {6, {:scalar, 0}, :uint32},
        opfuncid: {3, {:scalar, 0}, :uint32},
        opno: {2, {:scalar, 0}, :uint32},
        opresulttype: {4, {:scalar, 0}, :uint32},
        opretset: {5, {:scalar, false}, :bool},
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
          json_name: "opno",
          kind: {:scalar, 0},
          label: :optional,
          name: :opno,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "opfuncid",
          kind: {:scalar, 0},
          label: :optional,
          name: :opfuncid,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "opresulttype",
          kind: {:scalar, 0},
          label: :optional,
          name: :opresulttype,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "opretset",
          kind: {:scalar, false},
          label: :optional,
          name: :opretset,
          tag: 5,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "opcollid",
          kind: {:scalar, 0},
          label: :optional,
          name: :opcollid,
          tag: 6,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "inputcollid",
          kind: {:scalar, 0},
          label: :optional,
          name: :inputcollid,
          tag: 7,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "args",
          kind: :unpacked,
          label: :repeated,
          name: :args,
          tag: 8,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 9,
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
        def field_def(:opno) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opno",
             kind: {:scalar, 0},
             label: :optional,
             name: :opno,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("opno") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opno",
             kind: {:scalar, 0},
             label: :optional,
             name: :opno,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:opfuncid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opfuncid",
             kind: {:scalar, 0},
             label: :optional,
             name: :opfuncid,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("opfuncid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opfuncid",
             kind: {:scalar, 0},
             label: :optional,
             name: :opfuncid,
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:opresulttype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opresulttype",
             kind: {:scalar, 0},
             label: :optional,
             name: :opresulttype,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("opresulttype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opresulttype",
             kind: {:scalar, 0},
             label: :optional,
             name: :opresulttype,
             tag: 4,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:opretset) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opretset",
             kind: {:scalar, false},
             label: :optional,
             name: :opretset,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("opretset") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opretset",
             kind: {:scalar, false},
             label: :optional,
             name: :opretset,
             tag: 5,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:opcollid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opcollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :opcollid,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("opcollid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opcollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :opcollid,
             tag: 6,
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
             tag: 7,
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
             tag: 7,
             type: :uint32
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
             tag: 8,
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
             tag: 8,
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
             tag: 9,
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
             tag: 9,
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
    def default(:opno) do
      {:ok, 0}
    end,
    def default(:opfuncid) do
      {:ok, 0}
    end,
    def default(:opresulttype) do
      {:ok, 0}
    end,
    def default(:opretset) do
      {:ok, false}
    end,
    def default(:opcollid) do
      {:ok, 0}
    end,
    def default(:inputcollid) do
      {:ok, 0}
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
