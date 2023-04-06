# credo:disable-for-this-file
defmodule PgQuery.CreateEventTrigStmt do
  @moduledoc false
  defstruct trigname: "", eventname: "", whenclause: [], funcname: []

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
        |> encode_trigname(msg)
        |> encode_eventname(msg)
        |> encode_whenclause(msg)
        |> encode_funcname(msg)
      end
    )

    []

    [
      defp encode_trigname(acc, msg) do
        try do
          if msg.trigname == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.trigname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:trigname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_eventname(acc, msg) do
        try do
          if msg.eventname == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.eventname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:eventname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_whenclause(acc, msg) do
        try do
          case msg.whenclause do
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
            reraise Protox.EncodingError.new(:whenclause, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_funcname(acc, msg) do
        try do
          case msg.funcname do
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
            reraise Protox.EncodingError.new(:funcname, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.CreateEventTrigStmt))
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
              {[trigname: delimited], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[eventname: delimited], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[whenclause: msg.whenclause ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[funcname: msg.funcname ++ [PgQuery.Node.decode!(delimited)]], rest}

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
        PgQuery.CreateEventTrigStmt,
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
        1 => {:trigname, {:scalar, ""}, :string},
        2 => {:eventname, {:scalar, ""}, :string},
        3 => {:whenclause, :unpacked, {:message, PgQuery.Node}},
        4 => {:funcname, :unpacked, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        eventname: {2, {:scalar, ""}, :string},
        funcname: {4, :unpacked, {:message, PgQuery.Node}},
        trigname: {1, {:scalar, ""}, :string},
        whenclause: {3, :unpacked, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "trigname",
          kind: {:scalar, ""},
          label: :optional,
          name: :trigname,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "eventname",
          kind: {:scalar, ""},
          label: :optional,
          name: :eventname,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "whenclause",
          kind: :unpacked,
          label: :repeated,
          name: :whenclause,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "funcname",
          kind: :unpacked,
          label: :repeated,
          name: :funcname,
          tag: 4,
          type: {:message, PgQuery.Node}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:trigname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "trigname",
             kind: {:scalar, ""},
             label: :optional,
             name: :trigname,
             tag: 1,
             type: :string
           }}
        end

        def field_def("trigname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "trigname",
             kind: {:scalar, ""},
             label: :optional,
             name: :trigname,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:eventname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "eventname",
             kind: {:scalar, ""},
             label: :optional,
             name: :eventname,
             tag: 2,
             type: :string
           }}
        end

        def field_def("eventname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "eventname",
             kind: {:scalar, ""},
             label: :optional,
             name: :eventname,
             tag: 2,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:whenclause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "whenclause",
             kind: :unpacked,
             label: :repeated,
             name: :whenclause,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("whenclause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "whenclause",
             kind: :unpacked,
             label: :repeated,
             name: :whenclause,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:funcname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcname",
             kind: :unpacked,
             label: :repeated,
             name: :funcname,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("funcname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcname",
             kind: :unpacked,
             label: :repeated,
             name: :funcname,
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
    def default(:trigname) do
      {:ok, ""}
    end,
    def default(:eventname) do
      {:ok, ""}
    end,
    def default(:whenclause) do
      {:error, :no_default_value}
    end,
    def default(:funcname) do
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
