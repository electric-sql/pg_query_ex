# credo:disable-for-this-file
defmodule PgQuery.PartitionBoundSpec do
  @moduledoc false
  defstruct strategy: "",
            is_default: false,
            modulus: 0,
            remainder: 0,
            listdatums: [],
            lowerdatums: [],
            upperdatums: [],
            location: 0

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
        |> encode_strategy(msg)
        |> encode_is_default(msg)
        |> encode_modulus(msg)
        |> encode_remainder(msg)
        |> encode_listdatums(msg)
        |> encode_lowerdatums(msg)
        |> encode_upperdatums(msg)
        |> encode_location(msg)
      end
    )

    []

    [
      defp encode_strategy(acc, msg) do
        try do
          if msg.strategy == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.strategy)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:strategy, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_is_default(acc, msg) do
        try do
          if msg.is_default == false do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_bool(msg.is_default)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_default, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_modulus(acc, msg) do
        try do
          if msg.modulus == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_int32(msg.modulus)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:modulus, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_remainder(acc, msg) do
        try do
          if msg.remainder == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_int32(msg.remainder)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:remainder, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_listdatums(acc, msg) do
        try do
          case msg.listdatums do
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
            reraise Protox.EncodingError.new(:listdatums, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_lowerdatums(acc, msg) do
        try do
          case msg.lowerdatums do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "2", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:lowerdatums, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_upperdatums(acc, msg) do
        try do
          case msg.upperdatums do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, ":", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:upperdatums, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "@", Protox.Encode.encode_int32(msg.location)]
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
          parse_key_value(bytes, struct(PgQuery.PartitionBoundSpec))
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
              {[strategy: delimited], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_default: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[modulus: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[remainder: value], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[listdatums: msg.listdatums ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[lowerdatums: msg.lowerdatums ++ [PgQuery.Node.decode!(delimited)]], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[upperdatums: msg.upperdatums ++ [PgQuery.Node.decode!(delimited)]], rest}

            {8, _, bytes} ->
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
        PgQuery.PartitionBoundSpec,
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
        1 => {:strategy, {:scalar, ""}, :string},
        2 => {:is_default, {:scalar, false}, :bool},
        3 => {:modulus, {:scalar, 0}, :int32},
        4 => {:remainder, {:scalar, 0}, :int32},
        5 => {:listdatums, :unpacked, {:message, PgQuery.Node}},
        6 => {:lowerdatums, :unpacked, {:message, PgQuery.Node}},
        7 => {:upperdatums, :unpacked, {:message, PgQuery.Node}},
        8 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        is_default: {2, {:scalar, false}, :bool},
        listdatums: {5, :unpacked, {:message, PgQuery.Node}},
        location: {8, {:scalar, 0}, :int32},
        lowerdatums: {6, :unpacked, {:message, PgQuery.Node}},
        modulus: {3, {:scalar, 0}, :int32},
        remainder: {4, {:scalar, 0}, :int32},
        strategy: {1, {:scalar, ""}, :string},
        upperdatums: {7, :unpacked, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "strategy",
          kind: {:scalar, ""},
          label: :optional,
          name: :strategy,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "isDefault",
          kind: {:scalar, false},
          label: :optional,
          name: :is_default,
          tag: 2,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "modulus",
          kind: {:scalar, 0},
          label: :optional,
          name: :modulus,
          tag: 3,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "remainder",
          kind: {:scalar, 0},
          label: :optional,
          name: :remainder,
          tag: 4,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "listdatums",
          kind: :unpacked,
          label: :repeated,
          name: :listdatums,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "lowerdatums",
          kind: :unpacked,
          label: :repeated,
          name: :lowerdatums,
          tag: 6,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "upperdatums",
          kind: :unpacked,
          label: :repeated,
          name: :upperdatums,
          tag: 7,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 8,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:strategy) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "strategy",
             kind: {:scalar, ""},
             label: :optional,
             name: :strategy,
             tag: 1,
             type: :string
           }}
        end

        def field_def("strategy") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "strategy",
             kind: {:scalar, ""},
             label: :optional,
             name: :strategy,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:is_default) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isDefault",
             kind: {:scalar, false},
             label: :optional,
             name: :is_default,
             tag: 2,
             type: :bool
           }}
        end

        def field_def("isDefault") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isDefault",
             kind: {:scalar, false},
             label: :optional,
             name: :is_default,
             tag: 2,
             type: :bool
           }}
        end

        def field_def("is_default") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isDefault",
             kind: {:scalar, false},
             label: :optional,
             name: :is_default,
             tag: 2,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:modulus) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "modulus",
             kind: {:scalar, 0},
             label: :optional,
             name: :modulus,
             tag: 3,
             type: :int32
           }}
        end

        def field_def("modulus") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "modulus",
             kind: {:scalar, 0},
             label: :optional,
             name: :modulus,
             tag: 3,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:remainder) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "remainder",
             kind: {:scalar, 0},
             label: :optional,
             name: :remainder,
             tag: 4,
             type: :int32
           }}
        end

        def field_def("remainder") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "remainder",
             kind: {:scalar, 0},
             label: :optional,
             name: :remainder,
             tag: 4,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:listdatums) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "listdatums",
             kind: :unpacked,
             label: :repeated,
             name: :listdatums,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("listdatums") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "listdatums",
             kind: :unpacked,
             label: :repeated,
             name: :listdatums,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:lowerdatums) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lowerdatums",
             kind: :unpacked,
             label: :repeated,
             name: :lowerdatums,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("lowerdatums") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lowerdatums",
             kind: :unpacked,
             label: :repeated,
             name: :lowerdatums,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:upperdatums) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "upperdatums",
             kind: :unpacked,
             label: :repeated,
             name: :upperdatums,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("upperdatums") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "upperdatums",
             kind: :unpacked,
             label: :repeated,
             name: :upperdatums,
             tag: 7,
             type: {:message, PgQuery.Node}
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
             tag: 8,
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
             tag: 8,
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
    def default(:strategy) do
      {:ok, ""}
    end,
    def default(:is_default) do
      {:ok, false}
    end,
    def default(:modulus) do
      {:ok, 0}
    end,
    def default(:remainder) do
      {:ok, 0}
    end,
    def default(:listdatums) do
      {:error, :no_default_value}
    end,
    def default(:lowerdatums) do
      {:error, :no_default_value}
    end,
    def default(:upperdatums) do
      {:error, :no_default_value}
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
