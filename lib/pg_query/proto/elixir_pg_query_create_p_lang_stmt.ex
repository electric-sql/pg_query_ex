# credo:disable-for-this-file
defmodule PgQuery.CreatePLangStmt do
  @moduledoc false
  defstruct replace: false,
            plname: "",
            plhandler: [],
            plinline: [],
            plvalidator: [],
            pltrusted: false

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
        |> encode_replace(msg)
        |> encode_plname(msg)
        |> encode_plhandler(msg)
        |> encode_plinline(msg)
        |> encode_plvalidator(msg)
        |> encode_pltrusted(msg)
      end
    )

    []

    [
      defp encode_replace(acc, msg) do
        try do
          if msg.replace == false do
            acc
          else
            [acc, "\b", Protox.Encode.encode_bool(msg.replace)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:replace, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_plname(acc, msg) do
        try do
          if msg.plname == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.plname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:plname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_plhandler(acc, msg) do
        try do
          case msg.plhandler do
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
            reraise Protox.EncodingError.new(:plhandler, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_plinline(acc, msg) do
        try do
          case msg.plinline do
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
            reraise Protox.EncodingError.new(:plinline, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_plvalidator(acc, msg) do
        try do
          case msg.plvalidator do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "*", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:plvalidator, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_pltrusted(acc, msg) do
        try do
          if msg.pltrusted == false do
            acc
          else
            [acc, "0", Protox.Encode.encode_bool(msg.pltrusted)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:pltrusted, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.CreatePLangStmt))
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
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[replace: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[plname: delimited], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[plhandler: msg.plhandler ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[plinline: msg.plinline ++ [PgQuery.Node.decode!(delimited)]], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[plvalidator: msg.plvalidator ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[pltrusted: value], rest}

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
        PgQuery.CreatePLangStmt,
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
        1 => {:replace, {:scalar, false}, :bool},
        2 => {:plname, {:scalar, ""}, :string},
        3 => {:plhandler, :unpacked, {:message, PgQuery.Node}},
        4 => {:plinline, :unpacked, {:message, PgQuery.Node}},
        5 => {:plvalidator, :unpacked, {:message, PgQuery.Node}},
        6 => {:pltrusted, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        plhandler: {3, :unpacked, {:message, PgQuery.Node}},
        plinline: {4, :unpacked, {:message, PgQuery.Node}},
        plname: {2, {:scalar, ""}, :string},
        pltrusted: {6, {:scalar, false}, :bool},
        plvalidator: {5, :unpacked, {:message, PgQuery.Node}},
        replace: {1, {:scalar, false}, :bool}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "replace",
          kind: {:scalar, false},
          label: :optional,
          name: :replace,
          tag: 1,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "plname",
          kind: {:scalar, ""},
          label: :optional,
          name: :plname,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "plhandler",
          kind: :unpacked,
          label: :repeated,
          name: :plhandler,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "plinline",
          kind: :unpacked,
          label: :repeated,
          name: :plinline,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "plvalidator",
          kind: :unpacked,
          label: :repeated,
          name: :plvalidator,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "pltrusted",
          kind: {:scalar, false},
          label: :optional,
          name: :pltrusted,
          tag: 6,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:replace) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "replace",
             kind: {:scalar, false},
             label: :optional,
             name: :replace,
             tag: 1,
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
             tag: 1,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:plname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "plname",
             kind: {:scalar, ""},
             label: :optional,
             name: :plname,
             tag: 2,
             type: :string
           }}
        end

        def field_def("plname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "plname",
             kind: {:scalar, ""},
             label: :optional,
             name: :plname,
             tag: 2,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:plhandler) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "plhandler",
             kind: :unpacked,
             label: :repeated,
             name: :plhandler,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("plhandler") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "plhandler",
             kind: :unpacked,
             label: :repeated,
             name: :plhandler,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:plinline) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "plinline",
             kind: :unpacked,
             label: :repeated,
             name: :plinline,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("plinline") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "plinline",
             kind: :unpacked,
             label: :repeated,
             name: :plinline,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:plvalidator) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "plvalidator",
             kind: :unpacked,
             label: :repeated,
             name: :plvalidator,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("plvalidator") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "plvalidator",
             kind: :unpacked,
             label: :repeated,
             name: :plvalidator,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:pltrusted) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pltrusted",
             kind: {:scalar, false},
             label: :optional,
             name: :pltrusted,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("pltrusted") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pltrusted",
             kind: {:scalar, false},
             label: :optional,
             name: :pltrusted,
             tag: 6,
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
    def default(:replace) do
      {:ok, false}
    end,
    def default(:plname) do
      {:ok, ""}
    end,
    def default(:plhandler) do
      {:error, :no_default_value}
    end,
    def default(:plinline) do
      {:error, :no_default_value}
    end,
    def default(:plvalidator) do
      {:error, :no_default_value}
    end,
    def default(:pltrusted) do
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
