# credo:disable-for-this-file
defmodule PgQuery.AlterEnumStmt do
  @moduledoc false
  defstruct type_name: [],
            old_val: "",
            new_val: "",
            new_val_neighbor: "",
            new_val_is_after: false,
            skip_if_new_val_exists: false

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
        |> encode_type_name(msg)
        |> encode_old_val(msg)
        |> encode_new_val(msg)
        |> encode_new_val_neighbor(msg)
        |> encode_new_val_is_after(msg)
        |> encode_skip_if_new_val_exists(msg)
      end
    )

    []

    [
      defp encode_type_name(acc, msg) do
        try do
          case msg.type_name do
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
            reraise Protox.EncodingError.new(:type_name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_old_val(acc, msg) do
        try do
          if msg.old_val == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.old_val)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:old_val, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_new_val(acc, msg) do
        try do
          if msg.new_val == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.new_val)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:new_val, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_new_val_neighbor(acc, msg) do
        try do
          if msg.new_val_neighbor == "" do
            acc
          else
            [acc, "\"", Protox.Encode.encode_string(msg.new_val_neighbor)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:new_val_neighbor, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_new_val_is_after(acc, msg) do
        try do
          if msg.new_val_is_after == false do
            acc
          else
            [acc, "(", Protox.Encode.encode_bool(msg.new_val_is_after)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:new_val_is_after, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_skip_if_new_val_exists(acc, msg) do
        try do
          if msg.skip_if_new_val_exists == false do
            acc
          else
            [acc, "0", Protox.Encode.encode_bool(msg.skip_if_new_val_exists)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:skip_if_new_val_exists, "invalid field value"),
                    __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.AlterEnumStmt))
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
              {[type_name: msg.type_name ++ [PgQuery.Node.decode!(delimited)]], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[old_val: delimited], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[new_val: delimited], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[new_val_neighbor: delimited], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[new_val_is_after: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[skip_if_new_val_exists: value], rest}

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
        PgQuery.AlterEnumStmt,
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
        1 => {:type_name, :unpacked, {:message, PgQuery.Node}},
        2 => {:old_val, {:scalar, ""}, :string},
        3 => {:new_val, {:scalar, ""}, :string},
        4 => {:new_val_neighbor, {:scalar, ""}, :string},
        5 => {:new_val_is_after, {:scalar, false}, :bool},
        6 => {:skip_if_new_val_exists, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        new_val: {3, {:scalar, ""}, :string},
        new_val_is_after: {5, {:scalar, false}, :bool},
        new_val_neighbor: {4, {:scalar, ""}, :string},
        old_val: {2, {:scalar, ""}, :string},
        skip_if_new_val_exists: {6, {:scalar, false}, :bool},
        type_name: {1, :unpacked, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "typeName",
          kind: :unpacked,
          label: :repeated,
          name: :type_name,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "oldVal",
          kind: {:scalar, ""},
          label: :optional,
          name: :old_val,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "newVal",
          kind: {:scalar, ""},
          label: :optional,
          name: :new_val,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "newValNeighbor",
          kind: {:scalar, ""},
          label: :optional,
          name: :new_val_neighbor,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "newValIsAfter",
          kind: {:scalar, false},
          label: :optional,
          name: :new_val_is_after,
          tag: 5,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "skipIfNewValExists",
          kind: {:scalar, false},
          label: :optional,
          name: :skip_if_new_val_exists,
          tag: 6,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:type_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeName",
             kind: :unpacked,
             label: :repeated,
             name: :type_name,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("typeName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeName",
             kind: :unpacked,
             label: :repeated,
             name: :type_name,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("type_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeName",
             kind: :unpacked,
             label: :repeated,
             name: :type_name,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:old_val) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldVal",
             kind: {:scalar, ""},
             label: :optional,
             name: :old_val,
             tag: 2,
             type: :string
           }}
        end

        def field_def("oldVal") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldVal",
             kind: {:scalar, ""},
             label: :optional,
             name: :old_val,
             tag: 2,
             type: :string
           }}
        end

        def field_def("old_val") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldVal",
             kind: {:scalar, ""},
             label: :optional,
             name: :old_val,
             tag: 2,
             type: :string
           }}
        end
      ),
      (
        def field_def(:new_val) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "newVal",
             kind: {:scalar, ""},
             label: :optional,
             name: :new_val,
             tag: 3,
             type: :string
           }}
        end

        def field_def("newVal") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "newVal",
             kind: {:scalar, ""},
             label: :optional,
             name: :new_val,
             tag: 3,
             type: :string
           }}
        end

        def field_def("new_val") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "newVal",
             kind: {:scalar, ""},
             label: :optional,
             name: :new_val,
             tag: 3,
             type: :string
           }}
        end
      ),
      (
        def field_def(:new_val_neighbor) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "newValNeighbor",
             kind: {:scalar, ""},
             label: :optional,
             name: :new_val_neighbor,
             tag: 4,
             type: :string
           }}
        end

        def field_def("newValNeighbor") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "newValNeighbor",
             kind: {:scalar, ""},
             label: :optional,
             name: :new_val_neighbor,
             tag: 4,
             type: :string
           }}
        end

        def field_def("new_val_neighbor") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "newValNeighbor",
             kind: {:scalar, ""},
             label: :optional,
             name: :new_val_neighbor,
             tag: 4,
             type: :string
           }}
        end
      ),
      (
        def field_def(:new_val_is_after) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "newValIsAfter",
             kind: {:scalar, false},
             label: :optional,
             name: :new_val_is_after,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("newValIsAfter") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "newValIsAfter",
             kind: {:scalar, false},
             label: :optional,
             name: :new_val_is_after,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("new_val_is_after") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "newValIsAfter",
             kind: {:scalar, false},
             label: :optional,
             name: :new_val_is_after,
             tag: 5,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:skip_if_new_val_exists) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "skipIfNewValExists",
             kind: {:scalar, false},
             label: :optional,
             name: :skip_if_new_val_exists,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("skipIfNewValExists") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "skipIfNewValExists",
             kind: {:scalar, false},
             label: :optional,
             name: :skip_if_new_val_exists,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("skip_if_new_val_exists") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "skipIfNewValExists",
             kind: {:scalar, false},
             label: :optional,
             name: :skip_if_new_val_exists,
             tag: 6,
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
    def default(:type_name) do
      {:error, :no_default_value}
    end,
    def default(:old_val) do
      {:ok, ""}
    end,
    def default(:new_val) do
      {:ok, ""}
    end,
    def default(:new_val_neighbor) do
      {:ok, ""}
    end,
    def default(:new_val_is_after) do
      {:ok, false}
    end,
    def default(:skip_if_new_val_exists) do
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
