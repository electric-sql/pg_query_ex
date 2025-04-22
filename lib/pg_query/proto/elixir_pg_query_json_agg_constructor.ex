# credo:disable-for-this-file
defmodule PgQuery.JsonAggConstructor do
  @moduledoc false
  defstruct output: nil, agg_filter: nil, agg_order: [], over: nil, location: 0

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
        |> encode_output(msg)
        |> encode_agg_filter(msg)
        |> encode_agg_order(msg)
        |> encode_over(msg)
        |> encode_location(msg)
      end
    )

    []

    [
      defp encode_output(acc, msg) do
        try do
          if msg.output == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.output)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:output, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_agg_filter(acc, msg) do
        try do
          if msg.agg_filter == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.agg_filter)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:agg_filter, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_agg_order(acc, msg) do
        try do
          case msg.agg_order do
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
            reraise Protox.EncodingError.new(:agg_order, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_over(acc, msg) do
        try do
          if msg.over == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.over)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:over, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.JsonAggConstructor))
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

              {[
                 output:
                   Protox.MergeMessage.merge(msg.output, PgQuery.JsonOutput.decode!(delimited))
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 agg_filter:
                   Protox.MergeMessage.merge(msg.agg_filter, PgQuery.Node.decode!(delimited))
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[agg_order: msg.agg_order ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[over: Protox.MergeMessage.merge(msg.over, PgQuery.WindowDef.decode!(delimited))],
               rest}

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
        PgQuery.JsonAggConstructor,
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
        1 => {:output, {:scalar, nil}, {:message, PgQuery.JsonOutput}},
        2 => {:agg_filter, {:scalar, nil}, {:message, PgQuery.Node}},
        3 => {:agg_order, :unpacked, {:message, PgQuery.Node}},
        4 => {:over, {:scalar, nil}, {:message, PgQuery.WindowDef}},
        5 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        agg_filter: {2, {:scalar, nil}, {:message, PgQuery.Node}},
        agg_order: {3, :unpacked, {:message, PgQuery.Node}},
        location: {5, {:scalar, 0}, :int32},
        output: {1, {:scalar, nil}, {:message, PgQuery.JsonOutput}},
        over: {4, {:scalar, nil}, {:message, PgQuery.WindowDef}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "output",
          kind: {:scalar, nil},
          label: :optional,
          name: :output,
          tag: 1,
          type: {:message, PgQuery.JsonOutput}
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggFilter",
          kind: {:scalar, nil},
          label: :optional,
          name: :agg_filter,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggOrder",
          kind: :unpacked,
          label: :repeated,
          name: :agg_order,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "over",
          kind: {:scalar, nil},
          label: :optional,
          name: :over,
          tag: 4,
          type: {:message, PgQuery.WindowDef}
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
        def field_def(:output) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "output",
             kind: {:scalar, nil},
             label: :optional,
             name: :output,
             tag: 1,
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
             tag: 1,
             type: {:message, PgQuery.JsonOutput}
           }}
        end

        []
      ),
      (
        def field_def(:agg_filter) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggFilter",
             kind: {:scalar, nil},
             label: :optional,
             name: :agg_filter,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("aggFilter") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggFilter",
             kind: {:scalar, nil},
             label: :optional,
             name: :agg_filter,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("agg_filter") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggFilter",
             kind: {:scalar, nil},
             label: :optional,
             name: :agg_filter,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:agg_order) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggOrder",
             kind: :unpacked,
             label: :repeated,
             name: :agg_order,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("aggOrder") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggOrder",
             kind: :unpacked,
             label: :repeated,
             name: :agg_order,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("agg_order") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggOrder",
             kind: :unpacked,
             label: :repeated,
             name: :agg_order,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:over) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "over",
             kind: {:scalar, nil},
             label: :optional,
             name: :over,
             tag: 4,
             type: {:message, PgQuery.WindowDef}
           }}
        end

        def field_def("over") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "over",
             kind: {:scalar, nil},
             label: :optional,
             name: :over,
             tag: 4,
             type: {:message, PgQuery.WindowDef}
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
    def default(:output) do
      {:ok, nil}
    end,
    def default(:agg_filter) do
      {:ok, nil}
    end,
    def default(:agg_order) do
      {:error, :no_default_value}
    end,
    def default(:over) do
      {:ok, nil}
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
