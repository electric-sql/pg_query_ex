# credo:disable-for-this-file
defmodule PgQuery.DropStmt do
  @moduledoc false
  defstruct objects: [],
            remove_type: :OBJECT_TYPE_UNDEFINED,
            behavior: :DROP_BEHAVIOR_UNDEFINED,
            missing_ok: false,
            concurrent: false

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
        |> encode_objects(msg)
        |> encode_remove_type(msg)
        |> encode_behavior(msg)
        |> encode_missing_ok(msg)
        |> encode_concurrent(msg)
      end
    )

    []

    [
      defp encode_objects(acc, msg) do
        try do
          case msg.objects do
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
            reraise Protox.EncodingError.new(:objects, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_remove_type(acc, msg) do
        try do
          if msg.remove_type == :OBJECT_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "\x10",
              msg.remove_type |> PgQuery.ObjectType.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:remove_type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_behavior(acc, msg) do
        try do
          if msg.behavior == :DROP_BEHAVIOR_UNDEFINED do
            acc
          else
            [
              acc,
              "\x18",
              msg.behavior |> PgQuery.DropBehavior.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:behavior, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_missing_ok(acc, msg) do
        try do
          if msg.missing_ok == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.missing_ok)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:missing_ok, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_concurrent(acc, msg) do
        try do
          if msg.concurrent == false do
            acc
          else
            [acc, "(", Protox.Encode.encode_bool(msg.concurrent)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:concurrent, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.DropStmt))
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
              {[objects: msg.objects ++ [PgQuery.Node.decode!(delimited)]], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.ObjectType)
              {[remove_type: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.DropBehavior)
              {[behavior: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[missing_ok: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[concurrent: value], rest}

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
        PgQuery.DropStmt,
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
        1 => {:objects, :unpacked, {:message, PgQuery.Node}},
        2 => {:remove_type, {:scalar, :OBJECT_TYPE_UNDEFINED}, {:enum, PgQuery.ObjectType}},
        3 => {:behavior, {:scalar, :DROP_BEHAVIOR_UNDEFINED}, {:enum, PgQuery.DropBehavior}},
        4 => {:missing_ok, {:scalar, false}, :bool},
        5 => {:concurrent, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        behavior: {3, {:scalar, :DROP_BEHAVIOR_UNDEFINED}, {:enum, PgQuery.DropBehavior}},
        concurrent: {5, {:scalar, false}, :bool},
        missing_ok: {4, {:scalar, false}, :bool},
        objects: {1, :unpacked, {:message, PgQuery.Node}},
        remove_type: {2, {:scalar, :OBJECT_TYPE_UNDEFINED}, {:enum, PgQuery.ObjectType}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "objects",
          kind: :unpacked,
          label: :repeated,
          name: :objects,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "removeType",
          kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
          label: :optional,
          name: :remove_type,
          tag: 2,
          type: {:enum, PgQuery.ObjectType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "behavior",
          kind: {:scalar, :DROP_BEHAVIOR_UNDEFINED},
          label: :optional,
          name: :behavior,
          tag: 3,
          type: {:enum, PgQuery.DropBehavior}
        },
        %{
          __struct__: Protox.Field,
          json_name: "missingOk",
          kind: {:scalar, false},
          label: :optional,
          name: :missing_ok,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "concurrent",
          kind: {:scalar, false},
          label: :optional,
          name: :concurrent,
          tag: 5,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:objects) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "objects",
             kind: :unpacked,
             label: :repeated,
             name: :objects,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("objects") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "objects",
             kind: :unpacked,
             label: :repeated,
             name: :objects,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:remove_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "removeType",
             kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
             label: :optional,
             name: :remove_type,
             tag: 2,
             type: {:enum, PgQuery.ObjectType}
           }}
        end

        def field_def("removeType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "removeType",
             kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
             label: :optional,
             name: :remove_type,
             tag: 2,
             type: {:enum, PgQuery.ObjectType}
           }}
        end

        def field_def("remove_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "removeType",
             kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
             label: :optional,
             name: :remove_type,
             tag: 2,
             type: {:enum, PgQuery.ObjectType}
           }}
        end
      ),
      (
        def field_def(:behavior) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "behavior",
             kind: {:scalar, :DROP_BEHAVIOR_UNDEFINED},
             label: :optional,
             name: :behavior,
             tag: 3,
             type: {:enum, PgQuery.DropBehavior}
           }}
        end

        def field_def("behavior") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "behavior",
             kind: {:scalar, :DROP_BEHAVIOR_UNDEFINED},
             label: :optional,
             name: :behavior,
             tag: 3,
             type: {:enum, PgQuery.DropBehavior}
           }}
        end

        []
      ),
      (
        def field_def(:missing_ok) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "missingOk",
             kind: {:scalar, false},
             label: :optional,
             name: :missing_ok,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("missingOk") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "missingOk",
             kind: {:scalar, false},
             label: :optional,
             name: :missing_ok,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("missing_ok") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "missingOk",
             kind: {:scalar, false},
             label: :optional,
             name: :missing_ok,
             tag: 4,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:concurrent) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "concurrent",
             kind: {:scalar, false},
             label: :optional,
             name: :concurrent,
             tag: 5,
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
             tag: 5,
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
    def default(:objects) do
      {:error, :no_default_value}
    end,
    def default(:remove_type) do
      {:ok, :OBJECT_TYPE_UNDEFINED}
    end,
    def default(:behavior) do
      {:ok, :DROP_BEHAVIOR_UNDEFINED}
    end,
    def default(:missing_ok) do
      {:ok, false}
    end,
    def default(:concurrent) do
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
