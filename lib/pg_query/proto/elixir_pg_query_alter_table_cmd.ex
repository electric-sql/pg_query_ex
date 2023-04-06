# credo:disable-for-this-file
defmodule PgQuery.AlterTableCmd do
  @moduledoc false
  defstruct subtype: :ALTER_TABLE_TYPE_UNDEFINED,
            name: "",
            num: 0,
            newowner: nil,
            def: nil,
            behavior: :DROP_BEHAVIOR_UNDEFINED,
            missing_ok: false,
            recurse: false

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
        |> encode_subtype(msg)
        |> encode_name(msg)
        |> encode_num(msg)
        |> encode_newowner(msg)
        |> encode_def(msg)
        |> encode_behavior(msg)
        |> encode_missing_ok(msg)
        |> encode_recurse(msg)
      end
    )

    []

    [
      defp encode_subtype(acc, msg) do
        try do
          if msg.subtype == :ALTER_TABLE_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "\b",
              msg.subtype |> PgQuery.AlterTableType.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:subtype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_name(acc, msg) do
        try do
          if msg.name == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_num(acc, msg) do
        try do
          if msg.num == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_int32(msg.num)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:num, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_newowner(acc, msg) do
        try do
          if msg.newowner == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.newowner)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:newowner, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_def(acc, msg) do
        try do
          if msg.def == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.def)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:def, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_behavior(acc, msg) do
        try do
          if msg.behavior == :DROP_BEHAVIOR_UNDEFINED do
            acc
          else
            [
              acc,
              "0",
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
            [acc, "8", Protox.Encode.encode_bool(msg.missing_ok)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:missing_ok, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_recurse(acc, msg) do
        try do
          if msg.recurse == false do
            acc
          else
            [acc, "@", Protox.Encode.encode_bool(msg.recurse)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:recurse, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.AlterTableCmd))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.AlterTableType)
              {[subtype: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[name: delimited], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[num: value], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 newowner:
                   Protox.MergeMessage.merge(msg.newowner, PgQuery.RoleSpec.decode!(delimited))
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[def: Protox.MergeMessage.merge(msg.def, PgQuery.Node.decode!(delimited))], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.DropBehavior)
              {[behavior: value], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[missing_ok: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[recurse: value], rest}

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
        PgQuery.AlterTableCmd,
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
        1 => {:subtype, {:scalar, :ALTER_TABLE_TYPE_UNDEFINED}, {:enum, PgQuery.AlterTableType}},
        2 => {:name, {:scalar, ""}, :string},
        3 => {:num, {:scalar, 0}, :int32},
        4 => {:newowner, {:scalar, nil}, {:message, PgQuery.RoleSpec}},
        5 => {:def, {:scalar, nil}, {:message, PgQuery.Node}},
        6 => {:behavior, {:scalar, :DROP_BEHAVIOR_UNDEFINED}, {:enum, PgQuery.DropBehavior}},
        7 => {:missing_ok, {:scalar, false}, :bool},
        8 => {:recurse, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        behavior: {6, {:scalar, :DROP_BEHAVIOR_UNDEFINED}, {:enum, PgQuery.DropBehavior}},
        def: {5, {:scalar, nil}, {:message, PgQuery.Node}},
        missing_ok: {7, {:scalar, false}, :bool},
        name: {2, {:scalar, ""}, :string},
        newowner: {4, {:scalar, nil}, {:message, PgQuery.RoleSpec}},
        num: {3, {:scalar, 0}, :int32},
        recurse: {8, {:scalar, false}, :bool},
        subtype: {1, {:scalar, :ALTER_TABLE_TYPE_UNDEFINED}, {:enum, PgQuery.AlterTableType}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "subtype",
          kind: {:scalar, :ALTER_TABLE_TYPE_UNDEFINED},
          label: :optional,
          name: :subtype,
          tag: 1,
          type: {:enum, PgQuery.AlterTableType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "name",
          kind: {:scalar, ""},
          label: :optional,
          name: :name,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "num",
          kind: {:scalar, 0},
          label: :optional,
          name: :num,
          tag: 3,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "newowner",
          kind: {:scalar, nil},
          label: :optional,
          name: :newowner,
          tag: 4,
          type: {:message, PgQuery.RoleSpec}
        },
        %{
          __struct__: Protox.Field,
          json_name: "def",
          kind: {:scalar, nil},
          label: :optional,
          name: :def,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "behavior",
          kind: {:scalar, :DROP_BEHAVIOR_UNDEFINED},
          label: :optional,
          name: :behavior,
          tag: 6,
          type: {:enum, PgQuery.DropBehavior}
        },
        %{
          __struct__: Protox.Field,
          json_name: "missingOk",
          kind: {:scalar, false},
          label: :optional,
          name: :missing_ok,
          tag: 7,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "recurse",
          kind: {:scalar, false},
          label: :optional,
          name: :recurse,
          tag: 8,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:subtype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subtype",
             kind: {:scalar, :ALTER_TABLE_TYPE_UNDEFINED},
             label: :optional,
             name: :subtype,
             tag: 1,
             type: {:enum, PgQuery.AlterTableType}
           }}
        end

        def field_def("subtype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subtype",
             kind: {:scalar, :ALTER_TABLE_TYPE_UNDEFINED},
             label: :optional,
             name: :subtype,
             tag: 1,
             type: {:enum, PgQuery.AlterTableType}
           }}
        end

        []
      ),
      (
        def field_def(:name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, ""},
             label: :optional,
             name: :name,
             tag: 2,
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
             tag: 2,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:num) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "num",
             kind: {:scalar, 0},
             label: :optional,
             name: :num,
             tag: 3,
             type: :int32
           }}
        end

        def field_def("num") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "num",
             kind: {:scalar, 0},
             label: :optional,
             name: :num,
             tag: 3,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:newowner) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "newowner",
             kind: {:scalar, nil},
             label: :optional,
             name: :newowner,
             tag: 4,
             type: {:message, PgQuery.RoleSpec}
           }}
        end

        def field_def("newowner") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "newowner",
             kind: {:scalar, nil},
             label: :optional,
             name: :newowner,
             tag: 4,
             type: {:message, PgQuery.RoleSpec}
           }}
        end

        []
      ),
      (
        def field_def(:def) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "def",
             kind: {:scalar, nil},
             label: :optional,
             name: :def,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("def") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "def",
             kind: {:scalar, nil},
             label: :optional,
             name: :def,
             tag: 5,
             type: {:message, PgQuery.Node}
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
             tag: 6,
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
             tag: 6,
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
             tag: 7,
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
             tag: 7,
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
             tag: 7,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:recurse) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recurse",
             kind: {:scalar, false},
             label: :optional,
             name: :recurse,
             tag: 8,
             type: :bool
           }}
        end

        def field_def("recurse") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recurse",
             kind: {:scalar, false},
             label: :optional,
             name: :recurse,
             tag: 8,
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
    def default(:subtype) do
      {:ok, :ALTER_TABLE_TYPE_UNDEFINED}
    end,
    def default(:name) do
      {:ok, ""}
    end,
    def default(:num) do
      {:ok, 0}
    end,
    def default(:newowner) do
      {:ok, nil}
    end,
    def default(:def) do
      {:ok, nil}
    end,
    def default(:behavior) do
      {:ok, :DROP_BEHAVIOR_UNDEFINED}
    end,
    def default(:missing_ok) do
      {:ok, false}
    end,
    def default(:recurse) do
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
