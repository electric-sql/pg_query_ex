# credo:disable-for-this-file
defmodule PgQuery.JsonFormat do
  @moduledoc false
  defstruct format_type: :JSON_FORMAT_TYPE_UNDEFINED,
            encoding: :JSON_ENCODING_UNDEFINED,
            location: 0

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
        [] |> encode_format_type(msg) |> encode_encoding(msg) |> encode_location(msg)
      end
    )

    []

    [
      defp encode_format_type(acc, msg) do
        try do
          if msg.format_type == :JSON_FORMAT_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "\b",
              msg.format_type |> PgQuery.JsonFormatType.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:format_type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_encoding(acc, msg) do
        try do
          if msg.encoding == :JSON_ENCODING_UNDEFINED do
            acc
          else
            [
              acc,
              "\x10",
              msg.encoding |> PgQuery.JsonEncoding.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:encoding, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_int32(msg.location)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:location, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.JsonFormat))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.JsonFormatType)
              {[format_type: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.JsonEncoding)
              {[encoding: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[location: value], rest}

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
        PgQuery.JsonFormat,
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
          {:format_type, {:scalar, :JSON_FORMAT_TYPE_UNDEFINED}, {:enum, PgQuery.JsonFormatType}},
        2 => {:encoding, {:scalar, :JSON_ENCODING_UNDEFINED}, {:enum, PgQuery.JsonEncoding}},
        3 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        encoding: {2, {:scalar, :JSON_ENCODING_UNDEFINED}, {:enum, PgQuery.JsonEncoding}},
        format_type: {1, {:scalar, :JSON_FORMAT_TYPE_UNDEFINED}, {:enum, PgQuery.JsonFormatType}},
        location: {3, {:scalar, 0}, :int32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "formatType",
          kind: {:scalar, :JSON_FORMAT_TYPE_UNDEFINED},
          label: :optional,
          name: :format_type,
          tag: 1,
          type: {:enum, PgQuery.JsonFormatType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "encoding",
          kind: {:scalar, :JSON_ENCODING_UNDEFINED},
          label: :optional,
          name: :encoding,
          tag: 2,
          type: {:enum, PgQuery.JsonEncoding}
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 3,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:format_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "formatType",
             kind: {:scalar, :JSON_FORMAT_TYPE_UNDEFINED},
             label: :optional,
             name: :format_type,
             tag: 1,
             type: {:enum, PgQuery.JsonFormatType}
           }}
        end

        def field_def("formatType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "formatType",
             kind: {:scalar, :JSON_FORMAT_TYPE_UNDEFINED},
             label: :optional,
             name: :format_type,
             tag: 1,
             type: {:enum, PgQuery.JsonFormatType}
           }}
        end

        def field_def("format_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "formatType",
             kind: {:scalar, :JSON_FORMAT_TYPE_UNDEFINED},
             label: :optional,
             name: :format_type,
             tag: 1,
             type: {:enum, PgQuery.JsonFormatType}
           }}
        end
      ),
      (
        def field_def(:encoding) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "encoding",
             kind: {:scalar, :JSON_ENCODING_UNDEFINED},
             label: :optional,
             name: :encoding,
             tag: 2,
             type: {:enum, PgQuery.JsonEncoding}
           }}
        end

        def field_def("encoding") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "encoding",
             kind: {:scalar, :JSON_ENCODING_UNDEFINED},
             label: :optional,
             name: :encoding,
             tag: 2,
             type: {:enum, PgQuery.JsonEncoding}
           }}
        end

        []
      ),
      (
        def field_def(:location) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "location",
             kind: {:scalar, 0},
             label: :optional,
             name: :location,
             tag: 3,
             type: :int32
           }}
        end

        def field_def("location") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "location",
             kind: {:scalar, 0},
             label: :optional,
             name: :location,
             tag: 3,
             type: :int32
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
    def default(:format_type) do
      {:ok, :JSON_FORMAT_TYPE_UNDEFINED}
    end,
    def default(:encoding) do
      {:ok, :JSON_ENCODING_UNDEFINED}
    end,
    def default(:location) do
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
