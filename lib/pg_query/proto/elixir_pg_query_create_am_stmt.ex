# credo:disable-for-this-file
defmodule PgQuery.CreateAmStmt do
  @moduledoc false
  defstruct amname: "", handler_name: [], amtype: ""

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
        [] |> encode_amname(msg) |> encode_handler_name(msg) |> encode_amtype(msg)
      end
    )

    []

    [
      defp encode_amname(acc, msg) do
        try do
          if msg.amname == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.amname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:amname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_handler_name(acc, msg) do
        try do
          case msg.handler_name do
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
            reraise Protox.EncodingError.new(:handler_name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_amtype(acc, msg) do
        try do
          if msg.amtype == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.amtype)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:amtype, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.CreateAmStmt))
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
              {[amname: delimited], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[handler_name: msg.handler_name ++ [PgQuery.Node.decode!(delimited)]], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[amtype: delimited], rest}

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
        PgQuery.CreateAmStmt,
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
        1 => {:amname, {:scalar, ""}, :string},
        2 => {:handler_name, :unpacked, {:message, PgQuery.Node}},
        3 => {:amtype, {:scalar, ""}, :string}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        amname: {1, {:scalar, ""}, :string},
        amtype: {3, {:scalar, ""}, :string},
        handler_name: {2, :unpacked, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "amname",
          kind: {:scalar, ""},
          label: :optional,
          name: :amname,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "handlerName",
          kind: :unpacked,
          label: :repeated,
          name: :handler_name,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "amtype",
          kind: {:scalar, ""},
          label: :optional,
          name: :amtype,
          tag: 3,
          type: :string
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:amname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "amname",
             kind: {:scalar, ""},
             label: :optional,
             name: :amname,
             tag: 1,
             type: :string
           }}
        end

        def field_def("amname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "amname",
             kind: {:scalar, ""},
             label: :optional,
             name: :amname,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:handler_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "handlerName",
             kind: :unpacked,
             label: :repeated,
             name: :handler_name,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("handlerName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "handlerName",
             kind: :unpacked,
             label: :repeated,
             name: :handler_name,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("handler_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "handlerName",
             kind: :unpacked,
             label: :repeated,
             name: :handler_name,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:amtype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "amtype",
             kind: {:scalar, ""},
             label: :optional,
             name: :amtype,
             tag: 3,
             type: :string
           }}
        end

        def field_def("amtype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "amtype",
             kind: {:scalar, ""},
             label: :optional,
             name: :amtype,
             tag: 3,
             type: :string
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
    def default(:amname) do
      {:ok, ""}
    end,
    def default(:handler_name) do
      {:error, :no_default_value}
    end,
    def default(:amtype) do
      {:ok, ""}
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
