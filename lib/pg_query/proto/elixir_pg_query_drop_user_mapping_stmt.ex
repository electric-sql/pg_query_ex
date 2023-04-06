# credo:disable-for-this-file
defmodule PgQuery.DropUserMappingStmt do
  @moduledoc false
  defstruct user: nil, servername: "", missing_ok: false

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
        [] |> encode_user(msg) |> encode_servername(msg) |> encode_missing_ok(msg)
      end
    )

    []

    [
      defp encode_user(acc, msg) do
        try do
          if msg.user == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.user)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:user, "invalid field value"), __STACKTRACE__
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
      defp encode_missing_ok(acc, msg) do
        try do
          if msg.missing_ok == false do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_bool(msg.missing_ok)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:missing_ok, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.DropUserMappingStmt))
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

              {[user: Protox.MergeMessage.merge(msg.user, PgQuery.RoleSpec.decode!(delimited))],
               rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[servername: delimited], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[missing_ok: value], rest}

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
        PgQuery.DropUserMappingStmt,
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
        1 => {:user, {:scalar, nil}, {:message, PgQuery.RoleSpec}},
        2 => {:servername, {:scalar, ""}, :string},
        3 => {:missing_ok, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        missing_ok: {3, {:scalar, false}, :bool},
        servername: {2, {:scalar, ""}, :string},
        user: {1, {:scalar, nil}, {:message, PgQuery.RoleSpec}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "user",
          kind: {:scalar, nil},
          label: :optional,
          name: :user,
          tag: 1,
          type: {:message, PgQuery.RoleSpec}
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
          json_name: "missingOk",
          kind: {:scalar, false},
          label: :optional,
          name: :missing_ok,
          tag: 3,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:user) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "user",
             kind: {:scalar, nil},
             label: :optional,
             name: :user,
             tag: 1,
             type: {:message, PgQuery.RoleSpec}
           }}
        end

        def field_def("user") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "user",
             kind: {:scalar, nil},
             label: :optional,
             name: :user,
             tag: 1,
             type: {:message, PgQuery.RoleSpec}
           }}
        end

        []
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
        def field_def(:missing_ok) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "missingOk",
             kind: {:scalar, false},
             label: :optional,
             name: :missing_ok,
             tag: 3,
             type: :bool
           }}
        end

        def field_def("missingOk") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "missingOk",
             kind: {:scalar, false},
             label: :optional,
             name: :missing_ok,
             tag: 3,
             type: :bool
           }}
        end

        def field_def("missing_ok") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "missingOk",
             kind: {:scalar, false},
             label: :optional,
             name: :missing_ok,
             tag: 3,
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
    def default(:user) do
      {:ok, nil}
    end,
    def default(:servername) do
      {:ok, ""}
    end,
    def default(:missing_ok) do
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
