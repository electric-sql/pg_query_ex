# credo:disable-for-this-file
defmodule PgQuery.AlterPolicyStmt do
  @moduledoc false
  defstruct policy_name: "", table: nil, roles: [], qual: nil, with_check: nil

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
        |> encode_policy_name(msg)
        |> encode_table(msg)
        |> encode_roles(msg)
        |> encode_qual(msg)
        |> encode_with_check(msg)
      end
    )

    []

    [
      defp encode_policy_name(acc, msg) do
        try do
          if msg.policy_name == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.policy_name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:policy_name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_table(acc, msg) do
        try do
          if msg.table == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.table)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:table, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_roles(acc, msg) do
        try do
          case msg.roles do
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
            reraise Protox.EncodingError.new(:roles, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_qual(acc, msg) do
        try do
          if msg.qual == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.qual)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:qual, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_with_check(acc, msg) do
        try do
          if msg.with_check == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.with_check)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:with_check, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.AlterPolicyStmt))
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
              {[policy_name: delimited], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[table: Protox.MergeMessage.merge(msg.table, PgQuery.RangeVar.decode!(delimited))],
               rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[roles: msg.roles ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[qual: Protox.MergeMessage.merge(msg.qual, PgQuery.Node.decode!(delimited))], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 with_check:
                   Protox.MergeMessage.merge(msg.with_check, PgQuery.Node.decode!(delimited))
               ], rest}

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
        PgQuery.AlterPolicyStmt,
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
        1 => {:policy_name, {:scalar, ""}, :string},
        2 => {:table, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        3 => {:roles, :unpacked, {:message, PgQuery.Node}},
        4 => {:qual, {:scalar, nil}, {:message, PgQuery.Node}},
        5 => {:with_check, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        policy_name: {1, {:scalar, ""}, :string},
        qual: {4, {:scalar, nil}, {:message, PgQuery.Node}},
        roles: {3, :unpacked, {:message, PgQuery.Node}},
        table: {2, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        with_check: {5, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "policyName",
          kind: {:scalar, ""},
          label: :optional,
          name: :policy_name,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "table",
          kind: {:scalar, nil},
          label: :optional,
          name: :table,
          tag: 2,
          type: {:message, PgQuery.RangeVar}
        },
        %{
          __struct__: Protox.Field,
          json_name: "roles",
          kind: :unpacked,
          label: :repeated,
          name: :roles,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "qual",
          kind: {:scalar, nil},
          label: :optional,
          name: :qual,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "withCheck",
          kind: {:scalar, nil},
          label: :optional,
          name: :with_check,
          tag: 5,
          type: {:message, PgQuery.Node}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:policy_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "policyName",
             kind: {:scalar, ""},
             label: :optional,
             name: :policy_name,
             tag: 1,
             type: :string
           }}
        end

        def field_def("policyName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "policyName",
             kind: {:scalar, ""},
             label: :optional,
             name: :policy_name,
             tag: 1,
             type: :string
           }}
        end

        def field_def("policy_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "policyName",
             kind: {:scalar, ""},
             label: :optional,
             name: :policy_name,
             tag: 1,
             type: :string
           }}
        end
      ),
      (
        def field_def(:table) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "table",
             kind: {:scalar, nil},
             label: :optional,
             name: :table,
             tag: 2,
             type: {:message, PgQuery.RangeVar}
           }}
        end

        def field_def("table") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "table",
             kind: {:scalar, nil},
             label: :optional,
             name: :table,
             tag: 2,
             type: {:message, PgQuery.RangeVar}
           }}
        end

        []
      ),
      (
        def field_def(:roles) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roles",
             kind: :unpacked,
             label: :repeated,
             name: :roles,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("roles") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roles",
             kind: :unpacked,
             label: :repeated,
             name: :roles,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:qual) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "qual",
             kind: {:scalar, nil},
             label: :optional,
             name: :qual,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("qual") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "qual",
             kind: {:scalar, nil},
             label: :optional,
             name: :qual,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:with_check) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "withCheck",
             kind: {:scalar, nil},
             label: :optional,
             name: :with_check,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("withCheck") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "withCheck",
             kind: {:scalar, nil},
             label: :optional,
             name: :with_check,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("with_check") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "withCheck",
             kind: {:scalar, nil},
             label: :optional,
             name: :with_check,
             tag: 5,
             type: {:message, PgQuery.Node}
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
    def default(:policy_name) do
      {:ok, ""}
    end,
    def default(:table) do
      {:ok, nil}
    end,
    def default(:roles) do
      {:error, :no_default_value}
    end,
    def default(:qual) do
      {:ok, nil}
    end,
    def default(:with_check) do
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
