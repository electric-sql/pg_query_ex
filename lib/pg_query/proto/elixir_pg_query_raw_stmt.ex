# credo:disable-for-this-file
defmodule PgQuery.RawStmt do
  @moduledoc false
  defstruct stmt: nil, stmt_location: 0, stmt_len: 0

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
        [] |> encode_stmt(msg) |> encode_stmt_location(msg) |> encode_stmt_len(msg)
      end
    )

    []

    [
      defp encode_stmt(acc, msg) do
        try do
          if msg.stmt == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.stmt)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_stmt_location(acc, msg) do
        try do
          if msg.stmt_location == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_int32(msg.stmt_location)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:stmt_location, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_stmt_len(acc, msg) do
        try do
          if msg.stmt_len == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_int32(msg.stmt_len)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:stmt_len, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.RawStmt))
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
              {[stmt: Protox.MergeMessage.merge(msg.stmt, PgQuery.Node.decode!(delimited))], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[stmt_location: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[stmt_len: value], rest}

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
        PgQuery.RawStmt,
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
        1 => {:stmt, {:scalar, nil}, {:message, PgQuery.Node}},
        2 => {:stmt_location, {:scalar, 0}, :int32},
        3 => {:stmt_len, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        stmt: {1, {:scalar, nil}, {:message, PgQuery.Node}},
        stmt_len: {3, {:scalar, 0}, :int32},
        stmt_location: {2, {:scalar, 0}, :int32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "stmt",
          kind: {:scalar, nil},
          label: :optional,
          name: :stmt,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "stmtLocation",
          kind: {:scalar, 0},
          label: :optional,
          name: :stmt_location,
          tag: 2,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "stmtLen",
          kind: {:scalar, 0},
          label: :optional,
          name: :stmt_len,
          tag: 3,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "stmt",
             kind: {:scalar, nil},
             label: :optional,
             name: :stmt,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "stmt",
             kind: {:scalar, nil},
             label: :optional,
             name: :stmt,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:stmt_location) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "stmtLocation",
             kind: {:scalar, 0},
             label: :optional,
             name: :stmt_location,
             tag: 2,
             type: :int32
           }}
        end

        def field_def("stmtLocation") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "stmtLocation",
             kind: {:scalar, 0},
             label: :optional,
             name: :stmt_location,
             tag: 2,
             type: :int32
           }}
        end

        def field_def("stmt_location") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "stmtLocation",
             kind: {:scalar, 0},
             label: :optional,
             name: :stmt_location,
             tag: 2,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:stmt_len) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "stmtLen",
             kind: {:scalar, 0},
             label: :optional,
             name: :stmt_len,
             tag: 3,
             type: :int32
           }}
        end

        def field_def("stmtLen") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "stmtLen",
             kind: {:scalar, 0},
             label: :optional,
             name: :stmt_len,
             tag: 3,
             type: :int32
           }}
        end

        def field_def("stmt_len") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "stmtLen",
             kind: {:scalar, 0},
             label: :optional,
             name: :stmt_len,
             tag: 3,
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
    def default(:stmt) do
      {:ok, nil}
    end,
    def default(:stmt_location) do
      {:ok, 0}
    end,
    def default(:stmt_len) do
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
