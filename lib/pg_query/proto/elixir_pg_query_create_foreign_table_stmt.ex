# credo:disable-for-this-file
defmodule PgQuery.CreateForeignTableStmt do
  @moduledoc false
  defstruct base_stmt: nil, servername: "", options: []

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
        [] |> encode_base_stmt(msg) |> encode_servername(msg) |> encode_options(msg)
      end
    )

    []

    [
      defp encode_base_stmt(acc, msg) do
        try do
          if msg.base_stmt == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.base_stmt)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:base_stmt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_servername(acc, msg) do
        try do
          if msg.servername == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.servername)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:servername, "invalid field value"), __STACKTRACE__
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
                  [acc, "\x1A", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:options, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.CreateForeignTableStmt))
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

              {[
                 base_stmt:
                   Protox.MergeMessage.merge(msg.base_stmt, PgQuery.CreateStmt.decode!(delimited))
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[servername: delimited], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[options: msg.options ++ [PgQuery.Node.decode!(delimited)]], rest}

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
        PgQuery.CreateForeignTableStmt,
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
        1 => {:base_stmt, {:scalar, nil}, {:message, PgQuery.CreateStmt}},
        2 => {:servername, {:scalar, ""}, :string},
        3 => {:options, :unpacked, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        base_stmt: {1, {:scalar, nil}, {:message, PgQuery.CreateStmt}},
        options: {3, :unpacked, {:message, PgQuery.Node}},
        servername: {2, {:scalar, ""}, :string}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "baseStmt",
          kind: {:scalar, nil},
          label: :optional,
          name: :base_stmt,
          tag: 1,
          type: {:message, PgQuery.CreateStmt}
        },
        %{
          __struct__: Protox.Field,
          json_name: "servername",
          kind: {:scalar, ""},
          label: :optional,
          name: :servername,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "options",
          kind: :unpacked,
          label: :repeated,
          name: :options,
          tag: 3,
          type: {:message, PgQuery.Node}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:base_stmt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "baseStmt",
             kind: {:scalar, nil},
             label: :optional,
             name: :base_stmt,
             tag: 1,
             type: {:message, PgQuery.CreateStmt}
           }}
        end

        def field_def("baseStmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "baseStmt",
             kind: {:scalar, nil},
             label: :optional,
             name: :base_stmt,
             tag: 1,
             type: {:message, PgQuery.CreateStmt}
           }}
        end

        def field_def("base_stmt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "baseStmt",
             kind: {:scalar, nil},
             label: :optional,
             name: :base_stmt,
             tag: 1,
             type: {:message, PgQuery.CreateStmt}
           }}
        end
      ),
      (
        def field_def(:servername) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "servername",
             kind: {:scalar, ""},
             label: :optional,
             name: :servername,
             tag: 2,
             type: :string
           }}
        end

        def field_def("servername") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "servername",
             kind: {:scalar, ""},
             label: :optional,
             name: :servername,
             tag: 2,
             type: :string
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
             tag: 3,
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
             tag: 3,
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
    def default(:base_stmt) do
      {:ok, nil}
    end,
    def default(:servername) do
      {:ok, ""}
    end,
    def default(:options) do
      {:error, :no_default_value}
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
