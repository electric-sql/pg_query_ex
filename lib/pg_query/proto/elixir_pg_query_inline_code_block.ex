# credo:disable-for-this-file
defmodule PgQuery.InlineCodeBlock do
  @moduledoc false
  defstruct source_text: "", lang_oid: 0, lang_is_trusted: false, atomic: false

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
        |> encode_source_text(msg)
        |> encode_lang_oid(msg)
        |> encode_lang_is_trusted(msg)
        |> encode_atomic(msg)
      end
    )

    []

    [
      defp encode_source_text(acc, msg) do
        try do
          if msg.source_text == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.source_text)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:source_text, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_lang_oid(acc, msg) do
        try do
          if msg.lang_oid == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.lang_oid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:lang_oid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_lang_is_trusted(acc, msg) do
        try do
          if msg.lang_is_trusted == false do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_bool(msg.lang_is_trusted)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:lang_is_trusted, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_atomic(acc, msg) do
        try do
          if msg.atomic == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.atomic)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:atomic, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.InlineCodeBlock))
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
              {[source_text: delimited], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[lang_oid: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[lang_is_trusted: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[atomic: value], rest}

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
        PgQuery.InlineCodeBlock,
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
        1 => {:source_text, {:scalar, ""}, :string},
        2 => {:lang_oid, {:scalar, 0}, :uint32},
        3 => {:lang_is_trusted, {:scalar, false}, :bool},
        4 => {:atomic, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        atomic: {4, {:scalar, false}, :bool},
        lang_is_trusted: {3, {:scalar, false}, :bool},
        lang_oid: {2, {:scalar, 0}, :uint32},
        source_text: {1, {:scalar, ""}, :string}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "sourceText",
          kind: {:scalar, ""},
          label: :optional,
          name: :source_text,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "langOid",
          kind: {:scalar, 0},
          label: :optional,
          name: :lang_oid,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "langIsTrusted",
          kind: {:scalar, false},
          label: :optional,
          name: :lang_is_trusted,
          tag: 3,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "atomic",
          kind: {:scalar, false},
          label: :optional,
          name: :atomic,
          tag: 4,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:source_text) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sourceText",
             kind: {:scalar, ""},
             label: :optional,
             name: :source_text,
             tag: 1,
             type: :string
           }}
        end

        def field_def("sourceText") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sourceText",
             kind: {:scalar, ""},
             label: :optional,
             name: :source_text,
             tag: 1,
             type: :string
           }}
        end

        def field_def("source_text") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sourceText",
             kind: {:scalar, ""},
             label: :optional,
             name: :source_text,
             tag: 1,
             type: :string
           }}
        end
      ),
      (
        def field_def(:lang_oid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "langOid",
             kind: {:scalar, 0},
             label: :optional,
             name: :lang_oid,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("langOid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "langOid",
             kind: {:scalar, 0},
             label: :optional,
             name: :lang_oid,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("lang_oid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "langOid",
             kind: {:scalar, 0},
             label: :optional,
             name: :lang_oid,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:lang_is_trusted) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "langIsTrusted",
             kind: {:scalar, false},
             label: :optional,
             name: :lang_is_trusted,
             tag: 3,
             type: :bool
           }}
        end

        def field_def("langIsTrusted") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "langIsTrusted",
             kind: {:scalar, false},
             label: :optional,
             name: :lang_is_trusted,
             tag: 3,
             type: :bool
           }}
        end

        def field_def("lang_is_trusted") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "langIsTrusted",
             kind: {:scalar, false},
             label: :optional,
             name: :lang_is_trusted,
             tag: 3,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:atomic) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "atomic",
             kind: {:scalar, false},
             label: :optional,
             name: :atomic,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("atomic") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "atomic",
             kind: {:scalar, false},
             label: :optional,
             name: :atomic,
             tag: 4,
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
    def default(:source_text) do
      {:ok, ""}
    end,
    def default(:lang_oid) do
      {:ok, 0}
    end,
    def default(:lang_is_trusted) do
      {:ok, false}
    end,
    def default(:atomic) do
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
