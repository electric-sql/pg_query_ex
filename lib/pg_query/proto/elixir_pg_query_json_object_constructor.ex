# credo:disable-for-this-file
defmodule PgQuery.JsonObjectConstructor do
  @moduledoc false
  defstruct exprs: [], output: nil, absent_on_null: false, unique: false, location: 0

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
        |> encode_exprs(msg)
        |> encode_output(msg)
        |> encode_absent_on_null(msg)
        |> encode_unique(msg)
        |> encode_location(msg)
      end
    )

    []

    [
      defp encode_exprs(acc, msg) do
        try do
          case msg.exprs do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\n", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:exprs, "invalid field value"), __STACKTRACE__
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
      defp encode_absent_on_null(acc, msg) do
        try do
          if msg.absent_on_null == false do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_bool(msg.absent_on_null)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:absent_on_null, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_unique(acc, msg) do
        try do
          if msg.unique == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.unique)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:unique, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.JsonObjectConstructor))
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
              {[exprs: msg.exprs ++ [PgQuery.Node.decode!(delimited)]], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 output:
                   Protox.MergeMessage.merge(msg.output, PgQuery.JsonOutput.decode!(delimited))
               ], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[absent_on_null: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[unique: value], rest}

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
        PgQuery.JsonObjectConstructor,
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
        1 => {:exprs, :unpacked, {:message, PgQuery.Node}},
        2 => {:output, {:scalar, nil}, {:message, PgQuery.JsonOutput}},
        3 => {:absent_on_null, {:scalar, false}, :bool},
        4 => {:unique, {:scalar, false}, :bool},
        5 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        absent_on_null: {3, {:scalar, false}, :bool},
        exprs: {1, :unpacked, {:message, PgQuery.Node}},
        location: {5, {:scalar, 0}, :int32},
        output: {2, {:scalar, nil}, {:message, PgQuery.JsonOutput}},
        unique: {4, {:scalar, false}, :bool}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "exprs",
          kind: :unpacked,
          label: :repeated,
          name: :exprs,
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
          json_name: "absentOnNull",
          kind: {:scalar, false},
          label: :optional,
          name: :absent_on_null,
          tag: 3,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "unique",
          kind: {:scalar, false},
          label: :optional,
          name: :unique,
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
        def field_def(:exprs) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "exprs",
             kind: :unpacked,
             label: :repeated,
             name: :exprs,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("exprs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "exprs",
             kind: :unpacked,
             label: :repeated,
             name: :exprs,
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
        def field_def(:absent_on_null) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "absentOnNull",
             kind: {:scalar, false},
             label: :optional,
             name: :absent_on_null,
             tag: 3,
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
             tag: 3,
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
             tag: 3,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:unique) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "unique",
             kind: {:scalar, false},
             label: :optional,
             name: :unique,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("unique") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "unique",
             kind: {:scalar, false},
             label: :optional,
             name: :unique,
             tag: 4,
             type: :bool
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
    def default(:exprs) do
      {:error, :no_default_value}
    end,
    def default(:output) do
      {:ok, nil}
    end,
    def default(:absent_on_null) do
      {:ok, false}
    end,
    def default(:unique) do
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
