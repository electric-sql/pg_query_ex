# credo:disable-for-this-file
defmodule PgQuery.TableSampleClause do
  @moduledoc false
  defstruct tsmhandler: 0, args: [], repeatable: nil

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
        [] |> encode_tsmhandler(msg) |> encode_args(msg) |> encode_repeatable(msg)
      end
    )

    []

    [
      defp encode_tsmhandler(acc, msg) do
        try do
          if msg.tsmhandler == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.tsmhandler)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:tsmhandler, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_args(acc, msg) do
        try do
          case msg.args do
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
            reraise Protox.EncodingError.new(:args, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_repeatable(acc, msg) do
        try do
          if msg.repeatable == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.repeatable)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:repeatable, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.TableSampleClause))
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
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[tsmhandler: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[args: msg.args ++ [PgQuery.Node.decode!(delimited)]], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 repeatable:
                   Protox.MergeMessage.merge(msg.repeatable, PgQuery.Node.decode!(delimited))
               ], rest}

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
        PgQuery.TableSampleClause,
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
        1 => {:tsmhandler, {:scalar, 0}, :uint32},
        2 => {:args, :unpacked, {:message, PgQuery.Node}},
        3 => {:repeatable, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        args: {2, :unpacked, {:message, PgQuery.Node}},
        repeatable: {3, {:scalar, nil}, {:message, PgQuery.Node}},
        tsmhandler: {1, {:scalar, 0}, :uint32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "tsmhandler",
          kind: {:scalar, 0},
          label: :optional,
          name: :tsmhandler,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "args",
          kind: :unpacked,
          label: :repeated,
          name: :args,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "repeatable",
          kind: {:scalar, nil},
          label: :optional,
          name: :repeatable,
          tag: 3,
          type: {:message, PgQuery.Node}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:tsmhandler) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tsmhandler",
             kind: {:scalar, 0},
             label: :optional,
             name: :tsmhandler,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("tsmhandler") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tsmhandler",
             kind: {:scalar, 0},
             label: :optional,
             name: :tsmhandler,
             tag: 1,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:args) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "args",
             kind: :unpacked,
             label: :repeated,
             name: :args,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("args") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "args",
             kind: :unpacked,
             label: :repeated,
             name: :args,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:repeatable) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "repeatable",
             kind: {:scalar, nil},
             label: :optional,
             name: :repeatable,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("repeatable") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "repeatable",
             kind: {:scalar, nil},
             label: :optional,
             name: :repeatable,
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
    def default(:tsmhandler) do
      {:ok, 0}
    end,
    def default(:args) do
      {:error, :no_default_value}
    end,
    def default(:repeatable) do
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
