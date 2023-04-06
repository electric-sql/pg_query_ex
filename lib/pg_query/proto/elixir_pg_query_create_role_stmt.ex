# credo:disable-for-this-file
defmodule PgQuery.CreateRoleStmt do
  @moduledoc false
  defstruct stmt_type: :ROLE_STMT_TYPE_UNDEFINED, role: "", options: []

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
        [] |> encode_stmt_type(msg) |> encode_role(msg) |> encode_options(msg)
      end
    )

    []

    [
      defp encode_stmt_type(acc, msg) do
        try do
          if msg.stmt_type == :ROLE_STMT_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "\b",
              msg.stmt_type |> PgQuery.RoleStmtType.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:stmt_type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_role(acc, msg) do
        try do
          if msg.role == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.role)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:role, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.CreateRoleStmt))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.RoleStmtType)
              {[stmt_type: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[role: delimited], rest}

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
        PgQuery.CreateRoleStmt,
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
        1 => {:stmt_type, {:scalar, :ROLE_STMT_TYPE_UNDEFINED}, {:enum, PgQuery.RoleStmtType}},
        2 => {:role, {:scalar, ""}, :string},
        3 => {:options, :unpacked, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        options: {3, :unpacked, {:message, PgQuery.Node}},
        role: {2, {:scalar, ""}, :string},
        stmt_type: {1, {:scalar, :ROLE_STMT_TYPE_UNDEFINED}, {:enum, PgQuery.RoleStmtType}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "stmtType",
          kind: {:scalar, :ROLE_STMT_TYPE_UNDEFINED},
          label: :optional,
          name: :stmt_type,
          tag: 1,
          type: {:enum, PgQuery.RoleStmtType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "role",
          kind: {:scalar, ""},
          label: :optional,
          name: :role,
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
        def field_def(:stmt_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "stmtType",
             kind: {:scalar, :ROLE_STMT_TYPE_UNDEFINED},
             label: :optional,
             name: :stmt_type,
             tag: 1,
             type: {:enum, PgQuery.RoleStmtType}
           }}
        end

        def field_def("stmtType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "stmtType",
             kind: {:scalar, :ROLE_STMT_TYPE_UNDEFINED},
             label: :optional,
             name: :stmt_type,
             tag: 1,
             type: {:enum, PgQuery.RoleStmtType}
           }}
        end

        def field_def("stmt_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "stmtType",
             kind: {:scalar, :ROLE_STMT_TYPE_UNDEFINED},
             label: :optional,
             name: :stmt_type,
             tag: 1,
             type: {:enum, PgQuery.RoleStmtType}
           }}
        end
      ),
      (
        def field_def(:role) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "role",
             kind: {:scalar, ""},
             label: :optional,
             name: :role,
             tag: 2,
             type: :string
           }}
        end

        def field_def("role") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "role",
             kind: {:scalar, ""},
             label: :optional,
             name: :role,
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
    def default(:stmt_type) do
      {:ok, :ROLE_STMT_TYPE_UNDEFINED}
    end,
    def default(:role) do
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
