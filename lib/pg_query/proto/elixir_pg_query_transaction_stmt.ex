# credo:disable-for-this-file
defmodule PgQuery.TransactionStmt do
  @moduledoc false
  defstruct kind: :TRANSACTION_STMT_KIND_UNDEFINED,
            options: [],
            savepoint_name: "",
            gid: "",
            chain: false

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
        |> encode_kind(msg)
        |> encode_options(msg)
        |> encode_savepoint_name(msg)
        |> encode_gid(msg)
        |> encode_chain(msg)
      end
    )

    []

    [
      defp encode_kind(acc, msg) do
        try do
          if msg.kind == :TRANSACTION_STMT_KIND_UNDEFINED do
            acc
          else
            [
              acc,
              "\b",
              msg.kind |> PgQuery.TransactionStmtKind.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:kind, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_options(acc, msg) do
        try do
          case msg.options do
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
            reraise Protox.EncodingError.new(:options, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_savepoint_name(acc, msg) do
        try do
          if msg.savepoint_name == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.savepoint_name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:savepoint_name, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_gid(acc, msg) do
        try do
          if msg.gid == "" do
            acc
          else
            [acc, "\"", Protox.Encode.encode_string(msg.gid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:gid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_chain(acc, msg) do
        try do
          if msg.chain == false do
            acc
          else
            [acc, "(", Protox.Encode.encode_bool(msg.chain)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:chain, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.TransactionStmt))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.TransactionStmtKind)
              {[kind: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[options: msg.options ++ [PgQuery.Node.decode!(delimited)]], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[savepoint_name: delimited], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[gid: delimited], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[chain: value], rest}

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
        PgQuery.TransactionStmt,
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
        1 =>
          {:kind, {:scalar, :TRANSACTION_STMT_KIND_UNDEFINED},
           {:enum, PgQuery.TransactionStmtKind}},
        2 => {:options, :unpacked, {:message, PgQuery.Node}},
        3 => {:savepoint_name, {:scalar, ""}, :string},
        4 => {:gid, {:scalar, ""}, :string},
        5 => {:chain, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        chain: {5, {:scalar, false}, :bool},
        gid: {4, {:scalar, ""}, :string},
        kind:
          {1, {:scalar, :TRANSACTION_STMT_KIND_UNDEFINED}, {:enum, PgQuery.TransactionStmtKind}},
        options: {2, :unpacked, {:message, PgQuery.Node}},
        savepoint_name: {3, {:scalar, ""}, :string}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "kind",
          kind: {:scalar, :TRANSACTION_STMT_KIND_UNDEFINED},
          label: :optional,
          name: :kind,
          tag: 1,
          type: {:enum, PgQuery.TransactionStmtKind}
        },
        %{
          __struct__: Protox.Field,
          json_name: "options",
          kind: :unpacked,
          label: :repeated,
          name: :options,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "savepointName",
          kind: {:scalar, ""},
          label: :optional,
          name: :savepoint_name,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "gid",
          kind: {:scalar, ""},
          label: :optional,
          name: :gid,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "chain",
          kind: {:scalar, false},
          label: :optional,
          name: :chain,
          tag: 5,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:kind) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "kind",
             kind: {:scalar, :TRANSACTION_STMT_KIND_UNDEFINED},
             label: :optional,
             name: :kind,
             tag: 1,
             type: {:enum, PgQuery.TransactionStmtKind}
           }}
        end

        def field_def("kind") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "kind",
             kind: {:scalar, :TRANSACTION_STMT_KIND_UNDEFINED},
             label: :optional,
             name: :kind,
             tag: 1,
             type: {:enum, PgQuery.TransactionStmtKind}
           }}
        end

        []
      ),
      (
        def field_def(:options) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "options",
             kind: :unpacked,
             label: :repeated,
             name: :options,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("options") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "options",
             kind: :unpacked,
             label: :repeated,
             name: :options,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:savepoint_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "savepointName",
             kind: {:scalar, ""},
             label: :optional,
             name: :savepoint_name,
             tag: 3,
             type: :string
           }}
        end

        def field_def("savepointName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "savepointName",
             kind: {:scalar, ""},
             label: :optional,
             name: :savepoint_name,
             tag: 3,
             type: :string
           }}
        end

        def field_def("savepoint_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "savepointName",
             kind: {:scalar, ""},
             label: :optional,
             name: :savepoint_name,
             tag: 3,
             type: :string
           }}
        end
      ),
      (
        def field_def(:gid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gid",
             kind: {:scalar, ""},
             label: :optional,
             name: :gid,
             tag: 4,
             type: :string
           }}
        end

        def field_def("gid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gid",
             kind: {:scalar, ""},
             label: :optional,
             name: :gid,
             tag: 4,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:chain) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chain",
             kind: {:scalar, false},
             label: :optional,
             name: :chain,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("chain") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chain",
             kind: {:scalar, false},
             label: :optional,
             name: :chain,
             tag: 5,
             type: :bool
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
    def default(:kind) do
      {:ok, :TRANSACTION_STMT_KIND_UNDEFINED}
    end,
    def default(:options) do
      {:error, :no_default_value}
    end,
    def default(:savepoint_name) do
      {:ok, ""}
    end,
    def default(:gid) do
      {:ok, ""}
    end,
    def default(:chain) do
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
