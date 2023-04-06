# credo:disable-for-this-file
defmodule PgQuery.CurrentOfExpr do
  @moduledoc false
  defstruct xpr: nil, cvarno: 0, cursor_name: "", cursor_param: 0

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
        |> encode_cvarno(msg)
        |> encode_cursor_name(msg)
        |> encode_cursor_param(msg)
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
      defp encode_cvarno(acc, msg) do
        try do
          if msg.cvarno == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.cvarno)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:cvarno, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_cursor_name(acc, msg) do
        try do
          if msg.cursor_name == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.cursor_name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:cursor_name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_cursor_param(acc, msg) do
        try do
          if msg.cursor_param == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_int32(msg.cursor_param)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:cursor_param, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.CurrentOfExpr))
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
              {[cvarno: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[cursor_name: delimited], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[cursor_param: value], rest}

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
        PgQuery.CurrentOfExpr,
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
        2 => {:cvarno, {:scalar, 0}, :uint32},
        3 => {:cursor_name, {:scalar, ""}, :string},
        4 => {:cursor_param, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        cursor_name: {3, {:scalar, ""}, :string},
        cursor_param: {4, {:scalar, 0}, :int32},
        cvarno: {2, {:scalar, 0}, :uint32},
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
          json_name: "cvarno",
          kind: {:scalar, 0},
          label: :optional,
          name: :cvarno,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "cursorName",
          kind: {:scalar, ""},
          label: :optional,
          name: :cursor_name,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "cursorParam",
          kind: {:scalar, 0},
          label: :optional,
          name: :cursor_param,
          tag: 4,
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
        def field_def(:cvarno) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cvarno",
             kind: {:scalar, 0},
             label: :optional,
             name: :cvarno,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("cvarno") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cvarno",
             kind: {:scalar, 0},
             label: :optional,
             name: :cvarno,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:cursor_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cursorName",
             kind: {:scalar, ""},
             label: :optional,
             name: :cursor_name,
             tag: 3,
             type: :string
           }}
        end

        def field_def("cursorName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cursorName",
             kind: {:scalar, ""},
             label: :optional,
             name: :cursor_name,
             tag: 3,
             type: :string
           }}
        end

        def field_def("cursor_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cursorName",
             kind: {:scalar, ""},
             label: :optional,
             name: :cursor_name,
             tag: 3,
             type: :string
           }}
        end
      ),
      (
        def field_def(:cursor_param) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cursorParam",
             kind: {:scalar, 0},
             label: :optional,
             name: :cursor_param,
             tag: 4,
             type: :int32
           }}
        end

        def field_def("cursorParam") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cursorParam",
             kind: {:scalar, 0},
             label: :optional,
             name: :cursor_param,
             tag: 4,
             type: :int32
           }}
        end

        def field_def("cursor_param") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cursorParam",
             kind: {:scalar, 0},
             label: :optional,
             name: :cursor_param,
             tag: 4,
             type: :int32
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
    def default(:cvarno) do
      {:ok, 0}
    end,
    def default(:cursor_name) do
      {:ok, ""}
    end,
    def default(:cursor_param) do
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
