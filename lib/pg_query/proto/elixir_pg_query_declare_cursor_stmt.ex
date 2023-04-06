# credo:disable-for-this-file
defmodule PgQuery.DeclareCursorStmt do
  @moduledoc false
  defstruct portalname: "", options: 0, query: nil

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
        [] |> encode_portalname(msg) |> encode_options(msg) |> encode_query(msg)
      end
    )

    []

    [
      defp encode_portalname(acc, msg) do
        try do
          if msg.portalname == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.portalname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:portalname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_options(acc, msg) do
        try do
          if msg.options == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_int32(msg.options)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:options, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_query(acc, msg) do
        try do
          if msg.query == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.query)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:query, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.DeclareCursorStmt))
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
              {[portalname: delimited], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[options: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[query: Protox.MergeMessage.merge(msg.query, PgQuery.Node.decode!(delimited))],
               rest}

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
        PgQuery.DeclareCursorStmt,
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
        1 => {:portalname, {:scalar, ""}, :string},
        2 => {:options, {:scalar, 0}, :int32},
        3 => {:query, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        options: {2, {:scalar, 0}, :int32},
        portalname: {1, {:scalar, ""}, :string},
        query: {3, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "portalname",
          kind: {:scalar, ""},
          label: :optional,
          name: :portalname,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "options",
          kind: {:scalar, 0},
          label: :optional,
          name: :options,
          tag: 2,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "query",
          kind: {:scalar, nil},
          label: :optional,
          name: :query,
          tag: 3,
          type: {:message, PgQuery.Node}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:portalname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "portalname",
             kind: {:scalar, ""},
             label: :optional,
             name: :portalname,
             tag: 1,
             type: :string
           }}
        end

        def field_def("portalname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "portalname",
             kind: {:scalar, ""},
             label: :optional,
             name: :portalname,
             tag: 1,
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
             kind: {:scalar, 0},
             label: :optional,
             name: :options,
             tag: 2,
             type: :int32
           }}
        end

        def field_def("options") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "options",
             kind: {:scalar, 0},
             label: :optional,
             name: :options,
             tag: 2,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:query) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "query",
             kind: {:scalar, nil},
             label: :optional,
             name: :query,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("query") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "query",
             kind: {:scalar, nil},
             label: :optional,
             name: :query,
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
    def default(:portalname) do
      {:ok, ""}
    end,
    def default(:options) do
      {:ok, 0}
    end,
    def default(:query) do
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
