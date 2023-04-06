# credo:disable-for-this-file
defmodule PgQuery.RefreshMatViewStmt do
  @moduledoc false
  defstruct concurrent: false, skip_data: false, relation: nil

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
        [] |> encode_concurrent(msg) |> encode_skip_data(msg) |> encode_relation(msg)
      end
    )

    []

    [
      defp encode_concurrent(acc, msg) do
        try do
          if msg.concurrent == false do
            acc
          else
            [acc, "\b", Protox.Encode.encode_bool(msg.concurrent)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:concurrent, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_skip_data(acc, msg) do
        try do
          if msg.skip_data == false do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_bool(msg.skip_data)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:skip_data, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_relation(acc, msg) do
        try do
          if msg.relation == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.relation)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:relation, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.RefreshMatViewStmt))
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
              {[concurrent: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[skip_data: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 relation:
                   Protox.MergeMessage.merge(msg.relation, PgQuery.RangeVar.decode!(delimited))
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
        PgQuery.RefreshMatViewStmt,
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
        1 => {:concurrent, {:scalar, false}, :bool},
        2 => {:skip_data, {:scalar, false}, :bool},
        3 => {:relation, {:scalar, nil}, {:message, PgQuery.RangeVar}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        concurrent: {1, {:scalar, false}, :bool},
        relation: {3, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        skip_data: {2, {:scalar, false}, :bool}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "concurrent",
          kind: {:scalar, false},
          label: :optional,
          name: :concurrent,
          tag: 1,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "skipData",
          kind: {:scalar, false},
          label: :optional,
          name: :skip_data,
          tag: 2,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "relation",
          kind: {:scalar, nil},
          label: :optional,
          name: :relation,
          tag: 3,
          type: {:message, PgQuery.RangeVar}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:concurrent) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "concurrent",
             kind: {:scalar, false},
             label: :optional,
             name: :concurrent,
             tag: 1,
             type: :bool
           }}
        end

        def field_def("concurrent") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "concurrent",
             kind: {:scalar, false},
             label: :optional,
             name: :concurrent,
             tag: 1,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:skip_data) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "skipData",
             kind: {:scalar, false},
             label: :optional,
             name: :skip_data,
             tag: 2,
             type: :bool
           }}
        end

        def field_def("skipData") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "skipData",
             kind: {:scalar, false},
             label: :optional,
             name: :skip_data,
             tag: 2,
             type: :bool
           }}
        end

        def field_def("skip_data") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "skipData",
             kind: {:scalar, false},
             label: :optional,
             name: :skip_data,
             tag: 2,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:relation) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relation",
             kind: {:scalar, nil},
             label: :optional,
             name: :relation,
             tag: 3,
             type: {:message, PgQuery.RangeVar}
           }}
        end

        def field_def("relation") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relation",
             kind: {:scalar, nil},
             label: :optional,
             name: :relation,
             tag: 3,
             type: {:message, PgQuery.RangeVar}
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
    def default(:concurrent) do
      {:ok, false}
    end,
    def default(:skip_data) do
      {:ok, false}
    end,
    def default(:relation) do
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
