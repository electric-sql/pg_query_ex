# credo:disable-for-this-file
defmodule PgQuery.RenameStmt do
  @moduledoc false
  defstruct rename_type: :OBJECT_TYPE_UNDEFINED,
            relation_type: :OBJECT_TYPE_UNDEFINED,
            relation: nil,
            object: nil,
            subname: "",
            newname: "",
            behavior: :DROP_BEHAVIOR_UNDEFINED,
            missing_ok: false

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
        |> encode_rename_type(msg)
        |> encode_relation_type(msg)
        |> encode_relation(msg)
        |> encode_object(msg)
        |> encode_subname(msg)
        |> encode_newname(msg)
        |> encode_behavior(msg)
        |> encode_missing_ok(msg)
      end
    )

    []

    [
      defp encode_rename_type(acc, msg) do
        try do
          if msg.rename_type == :OBJECT_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "\b",
              msg.rename_type |> PgQuery.ObjectType.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rename_type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_relation_type(acc, msg) do
        try do
          if msg.relation_type == :OBJECT_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "\x10",
              msg.relation_type |> PgQuery.ObjectType.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:relation_type, "invalid field value"),
                    __STACKTRACE__
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
      end,
      defp encode_object(acc, msg) do
        try do
          if msg.object == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.object)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:object, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_subname(acc, msg) do
        try do
          if msg.subname == "" do
            acc
          else
            [acc, "*", Protox.Encode.encode_string(msg.subname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:subname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_newname(acc, msg) do
        try do
          if msg.newname == "" do
            acc
          else
            [acc, "2", Protox.Encode.encode_string(msg.newname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:newname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_behavior(acc, msg) do
        try do
          if msg.behavior == :DROP_BEHAVIOR_UNDEFINED do
            acc
          else
            [
              acc,
              "8",
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
            [acc, "@", Protox.Encode.encode_bool(msg.missing_ok)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:missing_ok, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.RenameStmt))
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
              {[rename_type: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.ObjectType)
              {[relation_type: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 relation:
                   Protox.MergeMessage.merge(msg.relation, PgQuery.RangeVar.decode!(delimited))
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[object: Protox.MergeMessage.merge(msg.object, PgQuery.Node.decode!(delimited))],
               rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[subname: delimited], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[newname: delimited], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.DropBehavior)
              {[behavior: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[missing_ok: value], rest}

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
        PgQuery.RenameStmt,
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
        1 => {:rename_type, {:scalar, :OBJECT_TYPE_UNDEFINED}, {:enum, PgQuery.ObjectType}},
        2 => {:relation_type, {:scalar, :OBJECT_TYPE_UNDEFINED}, {:enum, PgQuery.ObjectType}},
        3 => {:relation, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        4 => {:object, {:scalar, nil}, {:message, PgQuery.Node}},
        5 => {:subname, {:scalar, ""}, :string},
        6 => {:newname, {:scalar, ""}, :string},
        7 => {:behavior, {:scalar, :DROP_BEHAVIOR_UNDEFINED}, {:enum, PgQuery.DropBehavior}},
        8 => {:missing_ok, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        behavior: {7, {:scalar, :DROP_BEHAVIOR_UNDEFINED}, {:enum, PgQuery.DropBehavior}},
        missing_ok: {8, {:scalar, false}, :bool},
        newname: {6, {:scalar, ""}, :string},
        object: {4, {:scalar, nil}, {:message, PgQuery.Node}},
        relation: {3, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        relation_type: {2, {:scalar, :OBJECT_TYPE_UNDEFINED}, {:enum, PgQuery.ObjectType}},
        rename_type: {1, {:scalar, :OBJECT_TYPE_UNDEFINED}, {:enum, PgQuery.ObjectType}},
        subname: {5, {:scalar, ""}, :string}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "renameType",
          kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
          label: :optional,
          name: :rename_type,
          tag: 1,
          type: {:enum, PgQuery.ObjectType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "relationType",
          kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
          label: :optional,
          name: :relation_type,
          tag: 2,
          type: {:enum, PgQuery.ObjectType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "relation",
          kind: {:scalar, nil},
          label: :optional,
          name: :relation,
          tag: 3,
          type: {:message, PgQuery.RangeVar}
        },
        %{
          __struct__: Protox.Field,
          json_name: "object",
          kind: {:scalar, nil},
          label: :optional,
          name: :object,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "subname",
          kind: {:scalar, ""},
          label: :optional,
          name: :subname,
          tag: 5,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "newname",
          kind: {:scalar, ""},
          label: :optional,
          name: :newname,
          tag: 6,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "behavior",
          kind: {:scalar, :DROP_BEHAVIOR_UNDEFINED},
          label: :optional,
          name: :behavior,
          tag: 7,
          type: {:enum, PgQuery.DropBehavior}
        },
        %{
          __struct__: Protox.Field,
          json_name: "missingOk",
          kind: {:scalar, false},
          label: :optional,
          name: :missing_ok,
          tag: 8,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:rename_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "renameType",
             kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
             label: :optional,
             name: :rename_type,
             tag: 1,
             type: {:enum, PgQuery.ObjectType}
           }}
        end

        def field_def("renameType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "renameType",
             kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
             label: :optional,
             name: :rename_type,
             tag: 1,
             type: {:enum, PgQuery.ObjectType}
           }}
        end

        def field_def("rename_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "renameType",
             kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
             label: :optional,
             name: :rename_type,
             tag: 1,
             type: {:enum, PgQuery.ObjectType}
           }}
        end
      ),
      (
        def field_def(:relation_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relationType",
             kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
             label: :optional,
             name: :relation_type,
             tag: 2,
             type: {:enum, PgQuery.ObjectType}
           }}
        end

        def field_def("relationType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relationType",
             kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
             label: :optional,
             name: :relation_type,
             tag: 2,
             type: {:enum, PgQuery.ObjectType}
           }}
        end

        def field_def("relation_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relationType",
             kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
             label: :optional,
             name: :relation_type,
             tag: 2,
             type: {:enum, PgQuery.ObjectType}
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
      (
        def field_def(:object) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "object",
             kind: {:scalar, nil},
             label: :optional,
             name: :object,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("object") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "object",
             kind: {:scalar, nil},
             label: :optional,
             name: :object,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:subname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subname",
             kind: {:scalar, ""},
             label: :optional,
             name: :subname,
             tag: 5,
             type: :string
           }}
        end

        def field_def("subname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subname",
             kind: {:scalar, ""},
             label: :optional,
             name: :subname,
             tag: 5,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:newname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "newname",
             kind: {:scalar, ""},
             label: :optional,
             name: :newname,
             tag: 6,
             type: :string
           }}
        end

        def field_def("newname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "newname",
             kind: {:scalar, ""},
             label: :optional,
             name: :newname,
             tag: 6,
             type: :string
           }}
        end

        []
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
             tag: 7,
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
             tag: 7,
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
             tag: 8,
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
             tag: 8,
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
             tag: 8,
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
    def default(:rename_type) do
      {:ok, :OBJECT_TYPE_UNDEFINED}
    end,
    def default(:relation_type) do
      {:ok, :OBJECT_TYPE_UNDEFINED}
    end,
    def default(:relation) do
      {:ok, nil}
    end,
    def default(:object) do
      {:ok, nil}
    end,
    def default(:subname) do
      {:ok, ""}
    end,
    def default(:newname) do
      {:ok, ""}
    end,
    def default(:behavior) do
      {:ok, :DROP_BEHAVIOR_UNDEFINED}
    end,
    def default(:missing_ok) do
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
