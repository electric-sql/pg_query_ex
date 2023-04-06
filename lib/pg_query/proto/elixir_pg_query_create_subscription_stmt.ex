# credo:disable-for-this-file
defmodule PgQuery.CreateSubscriptionStmt do
  @moduledoc false
  defstruct subname: "", conninfo: "", publication: [], options: []

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
        |> encode_subname(msg)
        |> encode_conninfo(msg)
        |> encode_publication(msg)
        |> encode_options(msg)
      end
    )

    []

    [
      defp encode_subname(acc, msg) do
        try do
          if msg.subname == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.subname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:subname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_conninfo(acc, msg) do
        try do
          if msg.conninfo == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.conninfo)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:conninfo, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_publication(acc, msg) do
        try do
          case msg.publication do
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
            reraise Protox.EncodingError.new(:publication, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_options(acc, msg) do
        try do
          case msg.options do
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
            reraise Protox.EncodingError.new(:options, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.CreateSubscriptionStmt))
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
              {[subname: delimited], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[conninfo: delimited], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[publication: msg.publication ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[options: msg.options ++ [PgQuery.Node.decode!(delimited)]], rest}

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
        PgQuery.CreateSubscriptionStmt,
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
        1 => {:subname, {:scalar, ""}, :string},
        2 => {:conninfo, {:scalar, ""}, :string},
        3 => {:publication, :unpacked, {:message, PgQuery.Node}},
        4 => {:options, :unpacked, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        conninfo: {2, {:scalar, ""}, :string},
        options: {4, :unpacked, {:message, PgQuery.Node}},
        publication: {3, :unpacked, {:message, PgQuery.Node}},
        subname: {1, {:scalar, ""}, :string}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "subname",
          kind: {:scalar, ""},
          label: :optional,
          name: :subname,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "conninfo",
          kind: {:scalar, ""},
          label: :optional,
          name: :conninfo,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "publication",
          kind: :unpacked,
          label: :repeated,
          name: :publication,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "options",
          kind: :unpacked,
          label: :repeated,
          name: :options,
          tag: 4,
          type: {:message, PgQuery.Node}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:subname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subname",
             kind: {:scalar, ""},
             label: :optional,
             name: :subname,
             tag: 1,
             type: :string
           }}
        end

        def field_def("subname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subname",
             kind: {:scalar, ""},
             label: :optional,
             name: :subname,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:conninfo) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "conninfo",
             kind: {:scalar, ""},
             label: :optional,
             name: :conninfo,
             tag: 2,
             type: :string
           }}
        end

        def field_def("conninfo") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "conninfo",
             kind: {:scalar, ""},
             label: :optional,
             name: :conninfo,
             tag: 2,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:publication) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "publication",
             kind: :unpacked,
             label: :repeated,
             name: :publication,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("publication") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "publication",
             kind: :unpacked,
             label: :repeated,
             name: :publication,
             tag: 3,
             type: {:message, PgQuery.Node}
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
             kind: :unpacked,
             label: :repeated,
             name: :options,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("options") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "options",
             kind: :unpacked,
             label: :repeated,
             name: :options,
             tag: 4,
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
    def default(:subname) do
      {:ok, ""}
    end,
    def default(:conninfo) do
      {:ok, ""}
    end,
    def default(:publication) do
      {:error, :no_default_value}
    end,
    def default(:options) do
      {:error, :no_default_value}
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
