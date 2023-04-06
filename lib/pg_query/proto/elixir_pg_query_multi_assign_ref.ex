# credo:disable-for-this-file
defmodule PgQuery.MultiAssignRef do
  @moduledoc false
  defstruct source: nil, colno: 0, ncolumns: 0

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
        [] |> encode_source(msg) |> encode_colno(msg) |> encode_ncolumns(msg)
      end
    )

    []

    [
      defp encode_source(acc, msg) do
        try do
          if msg.source == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.source)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:source, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_colno(acc, msg) do
        try do
          if msg.colno == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_int32(msg.colno)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:colno, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ncolumns(acc, msg) do
        try do
          if msg.ncolumns == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_int32(msg.ncolumns)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ncolumns, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.MultiAssignRef))
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

              {[source: Protox.MergeMessage.merge(msg.source, PgQuery.Node.decode!(delimited))],
               rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[colno: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[ncolumns: value], rest}

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
        PgQuery.MultiAssignRef,
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
        1 => {:source, {:scalar, nil}, {:message, PgQuery.Node}},
        2 => {:colno, {:scalar, 0}, :int32},
        3 => {:ncolumns, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        colno: {2, {:scalar, 0}, :int32},
        ncolumns: {3, {:scalar, 0}, :int32},
        source: {1, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "source",
          kind: {:scalar, nil},
          label: :optional,
          name: :source,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "colno",
          kind: {:scalar, 0},
          label: :optional,
          name: :colno,
          tag: 2,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "ncolumns",
          kind: {:scalar, 0},
          label: :optional,
          name: :ncolumns,
          tag: 3,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:source) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "source",
             kind: {:scalar, nil},
             label: :optional,
             name: :source,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("source") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "source",
             kind: {:scalar, nil},
             label: :optional,
             name: :source,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:colno) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colno",
             kind: {:scalar, 0},
             label: :optional,
             name: :colno,
             tag: 2,
             type: :int32
           }}
        end

        def field_def("colno") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colno",
             kind: {:scalar, 0},
             label: :optional,
             name: :colno,
             tag: 2,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:ncolumns) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ncolumns",
             kind: {:scalar, 0},
             label: :optional,
             name: :ncolumns,
             tag: 3,
             type: :int32
           }}
        end

        def field_def("ncolumns") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ncolumns",
             kind: {:scalar, 0},
             label: :optional,
             name: :ncolumns,
             tag: 3,
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
    def default(:source) do
      {:ok, nil}
    end,
    def default(:colno) do
      {:ok, 0}
    end,
    def default(:ncolumns) do
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
