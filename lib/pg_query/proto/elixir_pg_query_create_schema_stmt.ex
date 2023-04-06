# credo:disable-for-this-file
defmodule PgQuery.CreateSchemaStmt do
  @moduledoc false
  defstruct schemaname: "", authrole: nil, schema_elts: [], if_not_exists: false

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
        |> encode_schemaname(msg)
        |> encode_authrole(msg)
        |> encode_schema_elts(msg)
        |> encode_if_not_exists(msg)
      end
    )

    []

    [
      defp encode_schemaname(acc, msg) do
        try do
          if msg.schemaname == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.schemaname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:schemaname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_authrole(acc, msg) do
        try do
          if msg.authrole == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.authrole)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:authrole, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_schema_elts(acc, msg) do
        try do
          case msg.schema_elts do
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
            reraise Protox.EncodingError.new(:schema_elts, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_if_not_exists(acc, msg) do
        try do
          if msg.if_not_exists == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.if_not_exists)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:if_not_exists, "invalid field value"),
                    __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.CreateSchemaStmt))
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
              {[schemaname: delimited], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 authrole:
                   Protox.MergeMessage.merge(msg.authrole, PgQuery.RoleSpec.decode!(delimited))
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[schema_elts: msg.schema_elts ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[if_not_exists: value], rest}

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
        PgQuery.CreateSchemaStmt,
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
        1 => {:schemaname, {:scalar, ""}, :string},
        2 => {:authrole, {:scalar, nil}, {:message, PgQuery.RoleSpec}},
        3 => {:schema_elts, :unpacked, {:message, PgQuery.Node}},
        4 => {:if_not_exists, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        authrole: {2, {:scalar, nil}, {:message, PgQuery.RoleSpec}},
        if_not_exists: {4, {:scalar, false}, :bool},
        schema_elts: {3, :unpacked, {:message, PgQuery.Node}},
        schemaname: {1, {:scalar, ""}, :string}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "schemaname",
          kind: {:scalar, ""},
          label: :optional,
          name: :schemaname,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "authrole",
          kind: {:scalar, nil},
          label: :optional,
          name: :authrole,
          tag: 2,
          type: {:message, PgQuery.RoleSpec}
        },
        %{
          __struct__: Protox.Field,
          json_name: "schemaElts",
          kind: :unpacked,
          label: :repeated,
          name: :schema_elts,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "ifNotExists",
          kind: {:scalar, false},
          label: :optional,
          name: :if_not_exists,
          tag: 4,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:schemaname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "schemaname",
             kind: {:scalar, ""},
             label: :optional,
             name: :schemaname,
             tag: 1,
             type: :string
           }}
        end

        def field_def("schemaname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "schemaname",
             kind: {:scalar, ""},
             label: :optional,
             name: :schemaname,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:authrole) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "authrole",
             kind: {:scalar, nil},
             label: :optional,
             name: :authrole,
             tag: 2,
             type: {:message, PgQuery.RoleSpec}
           }}
        end

        def field_def("authrole") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "authrole",
             kind: {:scalar, nil},
             label: :optional,
             name: :authrole,
             tag: 2,
             type: {:message, PgQuery.RoleSpec}
           }}
        end

        []
      ),
      (
        def field_def(:schema_elts) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "schemaElts",
             kind: :unpacked,
             label: :repeated,
             name: :schema_elts,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("schemaElts") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "schemaElts",
             kind: :unpacked,
             label: :repeated,
             name: :schema_elts,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("schema_elts") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "schemaElts",
             kind: :unpacked,
             label: :repeated,
             name: :schema_elts,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:if_not_exists) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ifNotExists",
             kind: {:scalar, false},
             label: :optional,
             name: :if_not_exists,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("ifNotExists") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ifNotExists",
             kind: {:scalar, false},
             label: :optional,
             name: :if_not_exists,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("if_not_exists") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ifNotExists",
             kind: {:scalar, false},
             label: :optional,
             name: :if_not_exists,
             tag: 4,
             type: :bool
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
    def default(:schemaname) do
      {:ok, ""}
    end,
    def default(:authrole) do
      {:ok, nil}
    end,
    def default(:schema_elts) do
      {:error, :no_default_value}
    end,
    def default(:if_not_exists) do
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
