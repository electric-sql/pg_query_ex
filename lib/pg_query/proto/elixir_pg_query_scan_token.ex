# credo:disable-for-this-file
defmodule PgQuery.ScanToken do
  @moduledoc false
  defstruct start: 0, end: 0, token: :NUL, keyword_kind: :NO_KEYWORD

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
        |> encode_start(msg)
        |> encode_end(msg)
        |> encode_token(msg)
        |> encode_keyword_kind(msg)
      end
    )

    []

    [
      defp encode_start(acc, msg) do
        try do
          if msg.start == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_int32(msg.start)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:start, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_end(acc, msg) do
        try do
          if msg.end == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_int32(msg.end)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:end, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_token(acc, msg) do
        try do
          if msg.token == :NUL do
            acc
          else
            [acc, " ", msg.token |> PgQuery.Token.encode() |> Protox.Encode.encode_enum()]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:token, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_keyword_kind(acc, msg) do
        try do
          if msg.keyword_kind == :NO_KEYWORD do
            acc
          else
            [
              acc,
              "(",
              msg.keyword_kind |> PgQuery.KeywordKind.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:keyword_kind, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.ScanToken))
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
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[start: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[end: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.Token)
              {[token: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.KeywordKind)
              {[keyword_kind: value], rest}

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
        PgQuery.ScanToken,
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
        1 => {:start, {:scalar, 0}, :int32},
        2 => {:end, {:scalar, 0}, :int32},
        4 => {:token, {:scalar, :NUL}, {:enum, PgQuery.Token}},
        5 => {:keyword_kind, {:scalar, :NO_KEYWORD}, {:enum, PgQuery.KeywordKind}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        end: {2, {:scalar, 0}, :int32},
        keyword_kind: {5, {:scalar, :NO_KEYWORD}, {:enum, PgQuery.KeywordKind}},
        start: {1, {:scalar, 0}, :int32},
        token: {4, {:scalar, :NUL}, {:enum, PgQuery.Token}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "start",
          kind: {:scalar, 0},
          label: :optional,
          name: :start,
          tag: 1,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "end",
          kind: {:scalar, 0},
          label: :optional,
          name: :end,
          tag: 2,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "token",
          kind: {:scalar, :NUL},
          label: :optional,
          name: :token,
          tag: 4,
          type: {:enum, PgQuery.Token}
        },
        %{
          __struct__: Protox.Field,
          json_name: "keywordKind",
          kind: {:scalar, :NO_KEYWORD},
          label: :optional,
          name: :keyword_kind,
          tag: 5,
          type: {:enum, PgQuery.KeywordKind}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:start) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "start",
             kind: {:scalar, 0},
             label: :optional,
             name: :start,
             tag: 1,
             type: :int32
           }}
        end

        def field_def("start") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "start",
             kind: {:scalar, 0},
             label: :optional,
             name: :start,
             tag: 1,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:end) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "end",
             kind: {:scalar, 0},
             label: :optional,
             name: :end,
             tag: 2,
             type: :int32
           }}
        end

        def field_def("end") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "end",
             kind: {:scalar, 0},
             label: :optional,
             name: :end,
             tag: 2,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:token) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "token",
             kind: {:scalar, :NUL},
             label: :optional,
             name: :token,
             tag: 4,
             type: {:enum, PgQuery.Token}
           }}
        end

        def field_def("token") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "token",
             kind: {:scalar, :NUL},
             label: :optional,
             name: :token,
             tag: 4,
             type: {:enum, PgQuery.Token}
           }}
        end

        []
      ),
      (
        def field_def(:keyword_kind) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "keywordKind",
             kind: {:scalar, :NO_KEYWORD},
             label: :optional,
             name: :keyword_kind,
             tag: 5,
             type: {:enum, PgQuery.KeywordKind}
           }}
        end

        def field_def("keywordKind") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "keywordKind",
             kind: {:scalar, :NO_KEYWORD},
             label: :optional,
             name: :keyword_kind,
             tag: 5,
             type: {:enum, PgQuery.KeywordKind}
           }}
        end

        def field_def("keyword_kind") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "keywordKind",
             kind: {:scalar, :NO_KEYWORD},
             label: :optional,
             name: :keyword_kind,
             tag: 5,
             type: {:enum, PgQuery.KeywordKind}
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
    def default(:start) do
      {:ok, 0}
    end,
    def default(:end) do
      {:ok, 0}
    end,
    def default(:token) do
      {:ok, :NUL}
    end,
    def default(:keyword_kind) do
      {:ok, :NO_KEYWORD}
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
