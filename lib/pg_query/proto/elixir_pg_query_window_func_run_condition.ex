# credo:disable-for-this-file
defmodule PgQuery.WindowFuncRunCondition do
  @moduledoc false
  defstruct xpr: nil, opno: 0, inputcollid: 0, wfunc_left: false, arg: nil

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
        |> encode_inputcollid(msg)
        |> encode_wfunc_left(msg)
        |> encode_arg(msg)
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
      defp encode_inputcollid(acc, msg) do
        try do
          if msg.inputcollid == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.inputcollid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:inputcollid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_wfunc_left(acc, msg) do
        try do
          if msg.wfunc_left == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.wfunc_left)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:wfunc_left, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_arg(acc, msg) do
        try do
          if msg.arg == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.arg)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:arg, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.WindowFuncRunCondition))
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
              {[inputcollid: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[wfunc_left: value], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[arg: Protox.MergeMessage.merge(msg.arg, PgQuery.Node.decode!(delimited))], rest}

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
        PgQuery.WindowFuncRunCondition,
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
        3 => {:inputcollid, {:scalar, 0}, :uint32},
        4 => {:wfunc_left, {:scalar, false}, :bool},
        5 => {:arg, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        arg: {5, {:scalar, nil}, {:message, PgQuery.Node}},
        inputcollid: {3, {:scalar, 0}, :uint32},
        opno: {2, {:scalar, 0}, :uint32},
        wfunc_left: {4, {:scalar, false}, :bool},
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
          json_name: "inputcollid",
          kind: {:scalar, 0},
          label: :optional,
          name: :inputcollid,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "wfuncLeft",
          kind: {:scalar, false},
          label: :optional,
          name: :wfunc_left,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "arg",
          kind: {:scalar, nil},
          label: :optional,
          name: :arg,
          tag: 5,
          type: {:message, PgQuery.Node}
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
        def field_def(:inputcollid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inputcollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :inputcollid,
             tag: 3,
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
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:wfunc_left) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "wfuncLeft",
             kind: {:scalar, false},
             label: :optional,
             name: :wfunc_left,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("wfuncLeft") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "wfuncLeft",
             kind: {:scalar, false},
             label: :optional,
             name: :wfunc_left,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("wfunc_left") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "wfuncLeft",
             kind: {:scalar, false},
             label: :optional,
             name: :wfunc_left,
             tag: 4,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:arg) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arg",
             kind: {:scalar, nil},
             label: :optional,
             name: :arg,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("arg") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arg",
             kind: {:scalar, nil},
             label: :optional,
             name: :arg,
             tag: 5,
             type: {:message, PgQuery.Node}
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
    def default(:inputcollid) do
      {:ok, 0}
    end,
    def default(:wfunc_left) do
      {:ok, false}
    end,
    def default(:arg) do
      {:ok, nil}
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
