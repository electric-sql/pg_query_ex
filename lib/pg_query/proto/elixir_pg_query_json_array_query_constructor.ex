# credo:disable-for-this-file
defmodule PgQuery.JsonArrayQueryConstructor do
  @moduledoc false
  defstruct query: nil, output: nil, format: nil, absent_on_null: false, location: 0

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
        |> encode_query(msg)
        |> encode_output(msg)
        |> encode_format(msg)
        |> encode_absent_on_null(msg)
        |> encode_location(msg)
      end
    )

    []

    [
      defp encode_query(acc, msg) do
        try do
          if msg.query == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.query)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:query, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_output(acc, msg) do
        try do
          if msg.output == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.output)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:output, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_format(acc, msg) do
        try do
          if msg.format == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.format)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:format, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_absent_on_null(acc, msg) do
        try do
          if msg.absent_on_null == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.absent_on_null)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:absent_on_null, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_int32(msg.location)]
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
          parse_key_value(bytes, struct(PgQuery.JsonArrayQueryConstructor))
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

              {[query: Protox.MergeMessage.merge(msg.query, PgQuery.Node.decode!(delimited))],
               rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 output:
                   Protox.MergeMessage.merge(msg.output, PgQuery.JsonOutput.decode!(delimited))
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 format:
                   Protox.MergeMessage.merge(msg.format, PgQuery.JsonFormat.decode!(delimited))
               ], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[absent_on_null: value], rest}

            {5, _, bytes} ->
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
        PgQuery.JsonArrayQueryConstructor,
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
        1 => {:query, {:scalar, nil}, {:message, PgQuery.Node}},
        2 => {:output, {:scalar, nil}, {:message, PgQuery.JsonOutput}},
        3 => {:format, {:scalar, nil}, {:message, PgQuery.JsonFormat}},
        4 => {:absent_on_null, {:scalar, false}, :bool},
        5 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        absent_on_null: {4, {:scalar, false}, :bool},
        format: {3, {:scalar, nil}, {:message, PgQuery.JsonFormat}},
        location: {5, {:scalar, 0}, :int32},
        output: {2, {:scalar, nil}, {:message, PgQuery.JsonOutput}},
        query: {1, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "query",
          kind: {:scalar, nil},
          label: :optional,
          name: :query,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "output",
          kind: {:scalar, nil},
          label: :optional,
          name: :output,
          tag: 2,
          type: {:message, PgQuery.JsonOutput}
        },
        %{
          __struct__: Protox.Field,
          json_name: "format",
          kind: {:scalar, nil},
          label: :optional,
          name: :format,
          tag: 3,
          type: {:message, PgQuery.JsonFormat}
        },
        %{
          __struct__: Protox.Field,
          json_name: "absentOnNull",
          kind: {:scalar, false},
          label: :optional,
          name: :absent_on_null,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 5,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:query) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "query",
             kind: {:scalar, nil},
             label: :optional,
             name: :query,
             tag: 1,
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
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:output) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "output",
             kind: {:scalar, nil},
             label: :optional,
             name: :output,
             tag: 2,
             type: {:message, PgQuery.JsonOutput}
           }}
        end

        def field_def("output") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "output",
             kind: {:scalar, nil},
             label: :optional,
             name: :output,
             tag: 2,
             type: {:message, PgQuery.JsonOutput}
           }}
        end

        []
      ),
      (
        def field_def(:format) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "format",
             kind: {:scalar, nil},
             label: :optional,
             name: :format,
             tag: 3,
             type: {:message, PgQuery.JsonFormat}
           }}
        end

        def field_def("format") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "format",
             kind: {:scalar, nil},
             label: :optional,
             name: :format,
             tag: 3,
             type: {:message, PgQuery.JsonFormat}
           }}
        end

        []
      ),
      (
        def field_def(:absent_on_null) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "absentOnNull",
             kind: {:scalar, false},
             label: :optional,
             name: :absent_on_null,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("absentOnNull") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "absentOnNull",
             kind: {:scalar, false},
             label: :optional,
             name: :absent_on_null,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("absent_on_null") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "absentOnNull",
             kind: {:scalar, false},
             label: :optional,
             name: :absent_on_null,
             tag: 4,
             type: :bool
           }}
        end
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
             tag: 5,
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
             tag: 5,
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
    def default(:query) do
      {:ok, nil}
    end,
    def default(:output) do
      {:ok, nil}
    end,
    def default(:format) do
      {:ok, nil}
    end,
    def default(:absent_on_null) do
      {:ok, false}
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
