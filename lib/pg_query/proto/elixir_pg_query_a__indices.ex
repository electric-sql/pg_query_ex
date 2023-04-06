# credo:disable-for-this-file
defmodule PgQuery.A_Indices do
  @moduledoc false
  defstruct is_slice: false, lidx: nil, uidx: nil

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
        [] |> encode_is_slice(msg) |> encode_lidx(msg) |> encode_uidx(msg)
      end
    )

    []

    [
      defp encode_is_slice(acc, msg) do
        try do
          if msg.is_slice == false do
            acc
          else
            [acc, "\b", Protox.Encode.encode_bool(msg.is_slice)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_slice, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_lidx(acc, msg) do
        try do
          if msg.lidx == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.lidx)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:lidx, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_uidx(acc, msg) do
        try do
          if msg.uidx == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.uidx)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:uidx, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.A_Indices))
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
              {[is_slice: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[lidx: Protox.MergeMessage.merge(msg.lidx, PgQuery.Node.decode!(delimited))], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[uidx: Protox.MergeMessage.merge(msg.uidx, PgQuery.Node.decode!(delimited))], rest}

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
        PgQuery.A_Indices,
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
        1 => {:is_slice, {:scalar, false}, :bool},
        2 => {:lidx, {:scalar, nil}, {:message, PgQuery.Node}},
        3 => {:uidx, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        is_slice: {1, {:scalar, false}, :bool},
        lidx: {2, {:scalar, nil}, {:message, PgQuery.Node}},
        uidx: {3, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "isSlice",
          kind: {:scalar, false},
          label: :optional,
          name: :is_slice,
          tag: 1,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "lidx",
          kind: {:scalar, nil},
          label: :optional,
          name: :lidx,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "uidx",
          kind: {:scalar, nil},
          label: :optional,
          name: :uidx,
          tag: 3,
          type: {:message, PgQuery.Node}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:is_slice) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isSlice",
             kind: {:scalar, false},
             label: :optional,
             name: :is_slice,
             tag: 1,
             type: :bool
           }}
        end

        def field_def("isSlice") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isSlice",
             kind: {:scalar, false},
             label: :optional,
             name: :is_slice,
             tag: 1,
             type: :bool
           }}
        end

        def field_def("is_slice") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isSlice",
             kind: {:scalar, false},
             label: :optional,
             name: :is_slice,
             tag: 1,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:lidx) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lidx",
             kind: {:scalar, nil},
             label: :optional,
             name: :lidx,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("lidx") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lidx",
             kind: {:scalar, nil},
             label: :optional,
             name: :lidx,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:uidx) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "uidx",
             kind: {:scalar, nil},
             label: :optional,
             name: :uidx,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("uidx") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "uidx",
             kind: {:scalar, nil},
             label: :optional,
             name: :uidx,
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
    def default(:is_slice) do
      {:ok, false}
    end,
    def default(:lidx) do
      {:ok, nil}
    end,
    def default(:uidx) do
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
