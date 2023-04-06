# credo:disable-for-this-file
defmodule PgQuery.FetchStmt do
  @moduledoc false
  defstruct direction: :FETCH_DIRECTION_UNDEFINED, how_many: 0, portalname: "", ismove: false

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
        |> encode_direction(msg)
        |> encode_how_many(msg)
        |> encode_portalname(msg)
        |> encode_ismove(msg)
      end
    )

    []

    [
      defp encode_direction(acc, msg) do
        try do
          if msg.direction == :FETCH_DIRECTION_UNDEFINED do
            acc
          else
            [
              acc,
              "\b",
              msg.direction |> PgQuery.FetchDirection.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:direction, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_how_many(acc, msg) do
        try do
          if msg.how_many == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_int64(msg.how_many)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:how_many, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_portalname(acc, msg) do
        try do
          if msg.portalname == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.portalname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:portalname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ismove(acc, msg) do
        try do
          if msg.ismove == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.ismove)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ismove, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.FetchStmt))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.FetchDirection)
              {[direction: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int64(bytes)
              {[how_many: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[portalname: delimited], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[ismove: value], rest}

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
        PgQuery.FetchStmt,
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
        1 => {:direction, {:scalar, :FETCH_DIRECTION_UNDEFINED}, {:enum, PgQuery.FetchDirection}},
        2 => {:how_many, {:scalar, 0}, :int64},
        3 => {:portalname, {:scalar, ""}, :string},
        4 => {:ismove, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        direction: {1, {:scalar, :FETCH_DIRECTION_UNDEFINED}, {:enum, PgQuery.FetchDirection}},
        how_many: {2, {:scalar, 0}, :int64},
        ismove: {4, {:scalar, false}, :bool},
        portalname: {3, {:scalar, ""}, :string}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "direction",
          kind: {:scalar, :FETCH_DIRECTION_UNDEFINED},
          label: :optional,
          name: :direction,
          tag: 1,
          type: {:enum, PgQuery.FetchDirection}
        },
        %{
          __struct__: Protox.Field,
          json_name: "howMany",
          kind: {:scalar, 0},
          label: :optional,
          name: :how_many,
          tag: 2,
          type: :int64
        },
        %{
          __struct__: Protox.Field,
          json_name: "portalname",
          kind: {:scalar, ""},
          label: :optional,
          name: :portalname,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "ismove",
          kind: {:scalar, false},
          label: :optional,
          name: :ismove,
          tag: 4,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:direction) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "direction",
             kind: {:scalar, :FETCH_DIRECTION_UNDEFINED},
             label: :optional,
             name: :direction,
             tag: 1,
             type: {:enum, PgQuery.FetchDirection}
           }}
        end

        def field_def("direction") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "direction",
             kind: {:scalar, :FETCH_DIRECTION_UNDEFINED},
             label: :optional,
             name: :direction,
             tag: 1,
             type: {:enum, PgQuery.FetchDirection}
           }}
        end

        []
      ),
      (
        def field_def(:how_many) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "howMany",
             kind: {:scalar, 0},
             label: :optional,
             name: :how_many,
             tag: 2,
             type: :int64
           }}
        end

        def field_def("howMany") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "howMany",
             kind: {:scalar, 0},
             label: :optional,
             name: :how_many,
             tag: 2,
             type: :int64
           }}
        end

        def field_def("how_many") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "howMany",
             kind: {:scalar, 0},
             label: :optional,
             name: :how_many,
             tag: 2,
             type: :int64
           }}
        end
      ),
      (
        def field_def(:portalname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "portalname",
             kind: {:scalar, ""},
             label: :optional,
             name: :portalname,
             tag: 3,
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
             tag: 3,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:ismove) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ismove",
             kind: {:scalar, false},
             label: :optional,
             name: :ismove,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("ismove") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ismove",
             kind: {:scalar, false},
             label: :optional,
             name: :ismove,
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
    def default(:direction) do
      {:ok, :FETCH_DIRECTION_UNDEFINED}
    end,
    def default(:how_many) do
      {:ok, 0}
    end,
    def default(:portalname) do
      {:ok, ""}
    end,
    def default(:ismove) do
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
