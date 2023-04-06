# credo:disable-for-this-file
defmodule PgQuery.DefineStmt do
  @moduledoc false
  defstruct kind: :OBJECT_TYPE_UNDEFINED,
            oldstyle: false,
            defnames: [],
            args: [],
            definition: [],
            if_not_exists: false,
            replace: false

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
        |> encode_kind(msg)
        |> encode_oldstyle(msg)
        |> encode_defnames(msg)
        |> encode_args(msg)
        |> encode_definition(msg)
        |> encode_if_not_exists(msg)
        |> encode_replace(msg)
      end
    )

    []

    [
      defp encode_kind(acc, msg) do
        try do
          if msg.kind == :OBJECT_TYPE_UNDEFINED do
            acc
          else
            [acc, "\b", msg.kind |> PgQuery.ObjectType.encode() |> Protox.Encode.encode_enum()]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:kind, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_oldstyle(acc, msg) do
        try do
          if msg.oldstyle == false do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_bool(msg.oldstyle)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:oldstyle, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_defnames(acc, msg) do
        try do
          case msg.defnames do
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
            reraise Protox.EncodingError.new(:defnames, "invalid field value"), __STACKTRACE__
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
                  [acc, "\"", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:args, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_definition(acc, msg) do
        try do
          case msg.definition do
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
            reraise Protox.EncodingError.new(:definition, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_if_not_exists(acc, msg) do
        try do
          if msg.if_not_exists == false do
            acc
          else
            [acc, "0", Protox.Encode.encode_bool(msg.if_not_exists)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:if_not_exists, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_replace(acc, msg) do
        try do
          if msg.replace == false do
            acc
          else
            [acc, "8", Protox.Encode.encode_bool(msg.replace)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:replace, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.DefineStmt))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.ObjectType)
              {[kind: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[oldstyle: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[defnames: msg.defnames ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[args: msg.args ++ [PgQuery.Node.decode!(delimited)]], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[definition: msg.definition ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[if_not_exists: value], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[replace: value], rest}

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
        PgQuery.DefineStmt,
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
        1 => {:kind, {:scalar, :OBJECT_TYPE_UNDEFINED}, {:enum, PgQuery.ObjectType}},
        2 => {:oldstyle, {:scalar, false}, :bool},
        3 => {:defnames, :unpacked, {:message, PgQuery.Node}},
        4 => {:args, :unpacked, {:message, PgQuery.Node}},
        5 => {:definition, :unpacked, {:message, PgQuery.Node}},
        6 => {:if_not_exists, {:scalar, false}, :bool},
        7 => {:replace, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        args: {4, :unpacked, {:message, PgQuery.Node}},
        definition: {5, :unpacked, {:message, PgQuery.Node}},
        defnames: {3, :unpacked, {:message, PgQuery.Node}},
        if_not_exists: {6, {:scalar, false}, :bool},
        kind: {1, {:scalar, :OBJECT_TYPE_UNDEFINED}, {:enum, PgQuery.ObjectType}},
        oldstyle: {2, {:scalar, false}, :bool},
        replace: {7, {:scalar, false}, :bool}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "kind",
          kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
          label: :optional,
          name: :kind,
          tag: 1,
          type: {:enum, PgQuery.ObjectType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "oldstyle",
          kind: {:scalar, false},
          label: :optional,
          name: :oldstyle,
          tag: 2,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "defnames",
          kind: :unpacked,
          label: :repeated,
          name: :defnames,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "args",
          kind: :unpacked,
          label: :repeated,
          name: :args,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "definition",
          kind: :unpacked,
          label: :repeated,
          name: :definition,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "ifNotExists",
          kind: {:scalar, false},
          label: :optional,
          name: :if_not_exists,
          tag: 6,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "replace",
          kind: {:scalar, false},
          label: :optional,
          name: :replace,
          tag: 7,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:kind) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "kind",
             kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
             label: :optional,
             name: :kind,
             tag: 1,
             type: {:enum, PgQuery.ObjectType}
           }}
        end

        def field_def("kind") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "kind",
             kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
             label: :optional,
             name: :kind,
             tag: 1,
             type: {:enum, PgQuery.ObjectType}
           }}
        end

        []
      ),
      (
        def field_def(:oldstyle) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldstyle",
             kind: {:scalar, false},
             label: :optional,
             name: :oldstyle,
             tag: 2,
             type: :bool
           }}
        end

        def field_def("oldstyle") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldstyle",
             kind: {:scalar, false},
             label: :optional,
             name: :oldstyle,
             tag: 2,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:defnames) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "defnames",
             kind: :unpacked,
             label: :repeated,
             name: :defnames,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("defnames") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "defnames",
             kind: :unpacked,
             label: :repeated,
             name: :defnames,
             tag: 3,
             type: {:message, PgQuery.Node}
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
             tag: 4,
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
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:definition) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "definition",
             kind: :unpacked,
             label: :repeated,
             name: :definition,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("definition") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "definition",
             kind: :unpacked,
             label: :repeated,
             name: :definition,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:if_not_exists) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ifNotExists",
             kind: {:scalar, false},
             label: :optional,
             name: :if_not_exists,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("ifNotExists") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ifNotExists",
             kind: {:scalar, false},
             label: :optional,
             name: :if_not_exists,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("if_not_exists") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ifNotExists",
             kind: {:scalar, false},
             label: :optional,
             name: :if_not_exists,
             tag: 6,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:replace) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "replace",
             kind: {:scalar, false},
             label: :optional,
             name: :replace,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("replace") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "replace",
             kind: {:scalar, false},
             label: :optional,
             name: :replace,
             tag: 7,
             type: :bool
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
    def default(:kind) do
      {:ok, :OBJECT_TYPE_UNDEFINED}
    end,
    def default(:oldstyle) do
      {:ok, false}
    end,
    def default(:defnames) do
      {:error, :no_default_value}
    end,
    def default(:args) do
      {:error, :no_default_value}
    end,
    def default(:definition) do
      {:error, :no_default_value}
    end,
    def default(:if_not_exists) do
      {:ok, false}
    end,
    def default(:replace) do
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
