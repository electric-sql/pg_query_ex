# credo:disable-for-this-file
defmodule PgQuery.TriggerTransition do
  @moduledoc false
  defstruct name: "", is_new: false, is_table: false

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
        [] |> encode_name(msg) |> encode_is_new(msg) |> encode_is_table(msg)
      end
    )

    []

    [
      defp encode_name(acc, msg) do
        try do
          if msg.name == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_is_new(acc, msg) do
        try do
          if msg.is_new == false do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_bool(msg.is_new)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_new, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_is_table(acc, msg) do
        try do
          if msg.is_table == false do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_bool(msg.is_table)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_table, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.TriggerTransition))
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
              {[name: delimited], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_new: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_table: value], rest}

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
        PgQuery.TriggerTransition,
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
        1 => {:name, {:scalar, ""}, :string},
        2 => {:is_new, {:scalar, false}, :bool},
        3 => {:is_table, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        is_new: {2, {:scalar, false}, :bool},
        is_table: {3, {:scalar, false}, :bool},
        name: {1, {:scalar, ""}, :string}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "name",
          kind: {:scalar, ""},
          label: :optional,
          name: :name,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "isNew",
          kind: {:scalar, false},
          label: :optional,
          name: :is_new,
          tag: 2,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "isTable",
          kind: {:scalar, false},
          label: :optional,
          name: :is_table,
          tag: 3,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, ""},
             label: :optional,
             name: :name,
             tag: 1,
             type: :string
           }}
        end

        def field_def("name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, ""},
             label: :optional,
             name: :name,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:is_new) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isNew",
             kind: {:scalar, false},
             label: :optional,
             name: :is_new,
             tag: 2,
             type: :bool
           }}
        end

        def field_def("isNew") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isNew",
             kind: {:scalar, false},
             label: :optional,
             name: :is_new,
             tag: 2,
             type: :bool
           }}
        end

        def field_def("is_new") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isNew",
             kind: {:scalar, false},
             label: :optional,
             name: :is_new,
             tag: 2,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:is_table) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isTable",
             kind: {:scalar, false},
             label: :optional,
             name: :is_table,
             tag: 3,
             type: :bool
           }}
        end

        def field_def("isTable") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isTable",
             kind: {:scalar, false},
             label: :optional,
             name: :is_table,
             tag: 3,
             type: :bool
           }}
        end

        def field_def("is_table") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isTable",
             kind: {:scalar, false},
             label: :optional,
             name: :is_table,
             tag: 3,
             type: :bool
           }}
        end
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
    def default(:name) do
      {:ok, ""}
    end,
    def default(:is_new) do
      {:ok, false}
    end,
    def default(:is_table) do
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
