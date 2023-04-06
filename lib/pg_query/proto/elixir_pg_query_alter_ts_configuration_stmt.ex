# credo:disable-for-this-file
defmodule PgQuery.AlterTSConfigurationStmt do
  @moduledoc false
  defstruct kind: :ALTER_TSCONFIG_TYPE_UNDEFINED,
            cfgname: [],
            tokentype: [],
            dicts: [],
            override: false,
            replace: false,
            missing_ok: false

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
        |> encode_cfgname(msg)
        |> encode_tokentype(msg)
        |> encode_dicts(msg)
        |> encode_override(msg)
        |> encode_replace(msg)
        |> encode_missing_ok(msg)
      end
    )

    []

    [
      defp encode_kind(acc, msg) do
        try do
          if msg.kind == :ALTER_TSCONFIG_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "\b",
              msg.kind |> PgQuery.AlterTSConfigType.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:kind, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_cfgname(acc, msg) do
        try do
          case msg.cfgname do
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
            reraise Protox.EncodingError.new(:cfgname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_tokentype(acc, msg) do
        try do
          case msg.tokentype do
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
            reraise Protox.EncodingError.new(:tokentype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_dicts(acc, msg) do
        try do
          case msg.dicts do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\"", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:dicts, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_override(acc, msg) do
        try do
          if msg.override == false do
            acc
          else
            [acc, "(", Protox.Encode.encode_bool(msg.override)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:override, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_replace(acc, msg) do
        try do
          if msg.replace == false do
            acc
          else
            [acc, "0", Protox.Encode.encode_bool(msg.replace)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:replace, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_missing_ok(acc, msg) do
        try do
          if msg.missing_ok == false do
            acc
          else
            [acc, "8", Protox.Encode.encode_bool(msg.missing_ok)]
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
          parse_key_value(bytes, struct(PgQuery.AlterTSConfigurationStmt))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.AlterTSConfigType)
              {[kind: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[cfgname: msg.cfgname ++ [PgQuery.Node.decode!(delimited)]], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[tokentype: msg.tokentype ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[dicts: msg.dicts ++ [PgQuery.Node.decode!(delimited)]], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[override: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[replace: value], rest}

            {7, _, bytes} ->
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
        PgQuery.AlterTSConfigurationStmt,
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
          {:kind, {:scalar, :ALTER_TSCONFIG_TYPE_UNDEFINED}, {:enum, PgQuery.AlterTSConfigType}},
        2 => {:cfgname, :unpacked, {:message, PgQuery.Node}},
        3 => {:tokentype, :unpacked, {:message, PgQuery.Node}},
        4 => {:dicts, :unpacked, {:message, PgQuery.Node}},
        5 => {:override, {:scalar, false}, :bool},
        6 => {:replace, {:scalar, false}, :bool},
        7 => {:missing_ok, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        cfgname: {2, :unpacked, {:message, PgQuery.Node}},
        dicts: {4, :unpacked, {:message, PgQuery.Node}},
        kind: {1, {:scalar, :ALTER_TSCONFIG_TYPE_UNDEFINED}, {:enum, PgQuery.AlterTSConfigType}},
        missing_ok: {7, {:scalar, false}, :bool},
        override: {5, {:scalar, false}, :bool},
        replace: {6, {:scalar, false}, :bool},
        tokentype: {3, :unpacked, {:message, PgQuery.Node}}
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
          kind: {:scalar, :ALTER_TSCONFIG_TYPE_UNDEFINED},
          label: :optional,
          name: :kind,
          tag: 1,
          type: {:enum, PgQuery.AlterTSConfigType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "cfgname",
          kind: :unpacked,
          label: :repeated,
          name: :cfgname,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "tokentype",
          kind: :unpacked,
          label: :repeated,
          name: :tokentype,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "dicts",
          kind: :unpacked,
          label: :repeated,
          name: :dicts,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "override",
          kind: {:scalar, false},
          label: :optional,
          name: :override,
          tag: 5,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "replace",
          kind: {:scalar, false},
          label: :optional,
          name: :replace,
          tag: 6,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "missingOk",
          kind: {:scalar, false},
          label: :optional,
          name: :missing_ok,
          tag: 7,
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
             kind: {:scalar, :ALTER_TSCONFIG_TYPE_UNDEFINED},
             label: :optional,
             name: :kind,
             tag: 1,
             type: {:enum, PgQuery.AlterTSConfigType}
           }}
        end

        def field_def("kind") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "kind",
             kind: {:scalar, :ALTER_TSCONFIG_TYPE_UNDEFINED},
             label: :optional,
             name: :kind,
             tag: 1,
             type: {:enum, PgQuery.AlterTSConfigType}
           }}
        end

        []
      ),
      (
        def field_def(:cfgname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cfgname",
             kind: :unpacked,
             label: :repeated,
             name: :cfgname,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("cfgname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cfgname",
             kind: :unpacked,
             label: :repeated,
             name: :cfgname,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:tokentype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tokentype",
             kind: :unpacked,
             label: :repeated,
             name: :tokentype,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("tokentype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tokentype",
             kind: :unpacked,
             label: :repeated,
             name: :tokentype,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:dicts) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dicts",
             kind: :unpacked,
             label: :repeated,
             name: :dicts,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("dicts") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dicts",
             kind: :unpacked,
             label: :repeated,
             name: :dicts,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:override) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "override",
             kind: {:scalar, false},
             label: :optional,
             name: :override,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("override") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "override",
             kind: {:scalar, false},
             label: :optional,
             name: :override,
             tag: 5,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:replace) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "replace",
             kind: {:scalar, false},
             label: :optional,
             name: :replace,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("replace") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "replace",
             kind: {:scalar, false},
             label: :optional,
             name: :replace,
             tag: 6,
             type: :bool
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
             tag: 7,
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
             tag: 7,
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
             tag: 7,
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
    def default(:kind) do
      {:ok, :ALTER_TSCONFIG_TYPE_UNDEFINED}
    end,
    def default(:cfgname) do
      {:error, :no_default_value}
    end,
    def default(:tokentype) do
      {:error, :no_default_value}
    end,
    def default(:dicts) do
      {:error, :no_default_value}
    end,
    def default(:override) do
      {:ok, false}
    end,
    def default(:replace) do
      {:ok, false}
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
