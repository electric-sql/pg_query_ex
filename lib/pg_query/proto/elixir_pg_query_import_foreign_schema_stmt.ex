# credo:disable-for-this-file
defmodule PgQuery.ImportForeignSchemaStmt do
  @moduledoc false
  defstruct server_name: "",
            remote_schema: "",
            local_schema: "",
            list_type: :IMPORT_FOREIGN_SCHEMA_TYPE_UNDEFINED,
            table_list: [],
            options: []

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
        |> encode_server_name(msg)
        |> encode_remote_schema(msg)
        |> encode_local_schema(msg)
        |> encode_list_type(msg)
        |> encode_table_list(msg)
        |> encode_options(msg)
      end
    )

    []

    [
      defp encode_server_name(acc, msg) do
        try do
          if msg.server_name == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.server_name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:server_name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_remote_schema(acc, msg) do
        try do
          if msg.remote_schema == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.remote_schema)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:remote_schema, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_local_schema(acc, msg) do
        try do
          if msg.local_schema == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.local_schema)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:local_schema, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_list_type(acc, msg) do
        try do
          if msg.list_type == :IMPORT_FOREIGN_SCHEMA_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              " ",
              msg.list_type
              |> PgQuery.ImportForeignSchemaType.encode()
              |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:list_type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_table_list(acc, msg) do
        try do
          case msg.table_list do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "*", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:table_list, "invalid field value"), __STACKTRACE__
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
                  [acc, "2", Protox.Encode.encode_message(value)]
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
          parse_key_value(bytes, struct(PgQuery.ImportForeignSchemaStmt))
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
              {[server_name: delimited], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[remote_schema: delimited], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[local_schema: delimited], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.ImportForeignSchemaType)
              {[list_type: value], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[table_list: msg.table_list ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
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
        PgQuery.ImportForeignSchemaStmt,
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
        1 => {:server_name, {:scalar, ""}, :string},
        2 => {:remote_schema, {:scalar, ""}, :string},
        3 => {:local_schema, {:scalar, ""}, :string},
        4 =>
          {:list_type, {:scalar, :IMPORT_FOREIGN_SCHEMA_TYPE_UNDEFINED},
           {:enum, PgQuery.ImportForeignSchemaType}},
        5 => {:table_list, :unpacked, {:message, PgQuery.Node}},
        6 => {:options, :unpacked, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        list_type:
          {4, {:scalar, :IMPORT_FOREIGN_SCHEMA_TYPE_UNDEFINED},
           {:enum, PgQuery.ImportForeignSchemaType}},
        local_schema: {3, {:scalar, ""}, :string},
        options: {6, :unpacked, {:message, PgQuery.Node}},
        remote_schema: {2, {:scalar, ""}, :string},
        server_name: {1, {:scalar, ""}, :string},
        table_list: {5, :unpacked, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "serverName",
          kind: {:scalar, ""},
          label: :optional,
          name: :server_name,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "remoteSchema",
          kind: {:scalar, ""},
          label: :optional,
          name: :remote_schema,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "localSchema",
          kind: {:scalar, ""},
          label: :optional,
          name: :local_schema,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "listType",
          kind: {:scalar, :IMPORT_FOREIGN_SCHEMA_TYPE_UNDEFINED},
          label: :optional,
          name: :list_type,
          tag: 4,
          type: {:enum, PgQuery.ImportForeignSchemaType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "tableList",
          kind: :unpacked,
          label: :repeated,
          name: :table_list,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "options",
          kind: :unpacked,
          label: :repeated,
          name: :options,
          tag: 6,
          type: {:message, PgQuery.Node}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:server_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "serverName",
             kind: {:scalar, ""},
             label: :optional,
             name: :server_name,
             tag: 1,
             type: :string
           }}
        end

        def field_def("serverName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "serverName",
             kind: {:scalar, ""},
             label: :optional,
             name: :server_name,
             tag: 1,
             type: :string
           }}
        end

        def field_def("server_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "serverName",
             kind: {:scalar, ""},
             label: :optional,
             name: :server_name,
             tag: 1,
             type: :string
           }}
        end
      ),
      (
        def field_def(:remote_schema) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "remoteSchema",
             kind: {:scalar, ""},
             label: :optional,
             name: :remote_schema,
             tag: 2,
             type: :string
           }}
        end

        def field_def("remoteSchema") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "remoteSchema",
             kind: {:scalar, ""},
             label: :optional,
             name: :remote_schema,
             tag: 2,
             type: :string
           }}
        end

        def field_def("remote_schema") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "remoteSchema",
             kind: {:scalar, ""},
             label: :optional,
             name: :remote_schema,
             tag: 2,
             type: :string
           }}
        end
      ),
      (
        def field_def(:local_schema) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "localSchema",
             kind: {:scalar, ""},
             label: :optional,
             name: :local_schema,
             tag: 3,
             type: :string
           }}
        end

        def field_def("localSchema") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "localSchema",
             kind: {:scalar, ""},
             label: :optional,
             name: :local_schema,
             tag: 3,
             type: :string
           }}
        end

        def field_def("local_schema") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "localSchema",
             kind: {:scalar, ""},
             label: :optional,
             name: :local_schema,
             tag: 3,
             type: :string
           }}
        end
      ),
      (
        def field_def(:list_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "listType",
             kind: {:scalar, :IMPORT_FOREIGN_SCHEMA_TYPE_UNDEFINED},
             label: :optional,
             name: :list_type,
             tag: 4,
             type: {:enum, PgQuery.ImportForeignSchemaType}
           }}
        end

        def field_def("listType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "listType",
             kind: {:scalar, :IMPORT_FOREIGN_SCHEMA_TYPE_UNDEFINED},
             label: :optional,
             name: :list_type,
             tag: 4,
             type: {:enum, PgQuery.ImportForeignSchemaType}
           }}
        end

        def field_def("list_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "listType",
             kind: {:scalar, :IMPORT_FOREIGN_SCHEMA_TYPE_UNDEFINED},
             label: :optional,
             name: :list_type,
             tag: 4,
             type: {:enum, PgQuery.ImportForeignSchemaType}
           }}
        end
      ),
      (
        def field_def(:table_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableList",
             kind: :unpacked,
             label: :repeated,
             name: :table_list,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("tableList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableList",
             kind: :unpacked,
             label: :repeated,
             name: :table_list,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("table_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableList",
             kind: :unpacked,
             label: :repeated,
             name: :table_list,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end
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
             tag: 6,
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
             tag: 6,
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
    def default(:server_name) do
      {:ok, ""}
    end,
    def default(:remote_schema) do
      {:ok, ""}
    end,
    def default(:local_schema) do
      {:ok, ""}
    end,
    def default(:list_type) do
      {:ok, :IMPORT_FOREIGN_SCHEMA_TYPE_UNDEFINED}
    end,
    def default(:table_list) do
      {:error, :no_default_value}
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
