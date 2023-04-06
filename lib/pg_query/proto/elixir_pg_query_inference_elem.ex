# credo:disable-for-this-file
defmodule PgQuery.InferenceElem do
  @moduledoc false
  defstruct xpr: nil, expr: nil, infercollid: 0, inferopclass: 0

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
        |> encode_expr(msg)
        |> encode_infercollid(msg)
        |> encode_inferopclass(msg)
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
      defp encode_expr(acc, msg) do
        try do
          if msg.expr == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.expr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:expr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_infercollid(acc, msg) do
        try do
          if msg.infercollid == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.infercollid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:infercollid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_inferopclass(acc, msg) do
        try do
          if msg.inferopclass == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.inferopclass)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:inferopclass, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.InferenceElem))
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
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[expr: Protox.MergeMessage.merge(msg.expr, PgQuery.Node.decode!(delimited))], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[infercollid: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[inferopclass: value], rest}

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
        PgQuery.InferenceElem,
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
        2 => {:expr, {:scalar, nil}, {:message, PgQuery.Node}},
        3 => {:infercollid, {:scalar, 0}, :uint32},
        4 => {:inferopclass, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        expr: {2, {:scalar, nil}, {:message, PgQuery.Node}},
        infercollid: {3, {:scalar, 0}, :uint32},
        inferopclass: {4, {:scalar, 0}, :uint32},
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
          json_name: "expr",
          kind: {:scalar, nil},
          label: :optional,
          name: :expr,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "infercollid",
          kind: {:scalar, 0},
          label: :optional,
          name: :infercollid,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "inferopclass",
          kind: {:scalar, 0},
          label: :optional,
          name: :inferopclass,
          tag: 4,
          type: :uint32
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
        def field_def(:expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "expr",
             kind: {:scalar, nil},
             label: :optional,
             name: :expr,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "expr",
             kind: {:scalar, nil},
             label: :optional,
             name: :expr,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:infercollid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "infercollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :infercollid,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("infercollid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "infercollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :infercollid,
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:inferopclass) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inferopclass",
             kind: {:scalar, 0},
             label: :optional,
             name: :inferopclass,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("inferopclass") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inferopclass",
             kind: {:scalar, 0},
             label: :optional,
             name: :inferopclass,
             tag: 4,
             type: :uint32
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
    def default(:expr) do
      {:ok, nil}
    end,
    def default(:infercollid) do
      {:ok, 0}
    end,
    def default(:inferopclass) do
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
