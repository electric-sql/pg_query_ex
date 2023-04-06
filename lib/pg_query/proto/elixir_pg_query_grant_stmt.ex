# credo:disable-for-this-file
defmodule PgQuery.GrantStmt do
  @moduledoc false
  defstruct is_grant: false,
            targtype: :GRANT_TARGET_TYPE_UNDEFINED,
            objtype: :OBJECT_TYPE_UNDEFINED,
            objects: [],
            privileges: [],
            grantees: [],
            grant_option: false,
            grantor: nil,
            behavior: :DROP_BEHAVIOR_UNDEFINED

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
        |> encode_is_grant(msg)
        |> encode_targtype(msg)
        |> encode_objtype(msg)
        |> encode_objects(msg)
        |> encode_privileges(msg)
        |> encode_grantees(msg)
        |> encode_grant_option(msg)
        |> encode_grantor(msg)
        |> encode_behavior(msg)
      end
    )

    []

    [
      defp encode_is_grant(acc, msg) do
        try do
          if msg.is_grant == false do
            acc
          else
            [acc, "\b", Protox.Encode.encode_bool(msg.is_grant)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_grant, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_targtype(acc, msg) do
        try do
          if msg.targtype == :GRANT_TARGET_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "\x10",
              msg.targtype |> PgQuery.GrantTargetType.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:targtype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_objtype(acc, msg) do
        try do
          if msg.objtype == :OBJECT_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "\x18",
              msg.objtype |> PgQuery.ObjectType.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:objtype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_objects(acc, msg) do
        try do
          case msg.objects do
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
            reraise Protox.EncodingError.new(:objects, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_privileges(acc, msg) do
        try do
          case msg.privileges do
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
            reraise Protox.EncodingError.new(:privileges, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_grantees(acc, msg) do
        try do
          case msg.grantees do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "2", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:grantees, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_grant_option(acc, msg) do
        try do
          if msg.grant_option == false do
            acc
          else
            [acc, "8", Protox.Encode.encode_bool(msg.grant_option)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:grant_option, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_grantor(acc, msg) do
        try do
          if msg.grantor == nil do
            acc
          else
            [acc, "B", Protox.Encode.encode_message(msg.grantor)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:grantor, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_behavior(acc, msg) do
        try do
          if msg.behavior == :DROP_BEHAVIOR_UNDEFINED do
            acc
          else
            [
              acc,
              "H",
              msg.behavior |> PgQuery.DropBehavior.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:behavior, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.GrantStmt))
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
              {[is_grant: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.GrantTargetType)
              {[targtype: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.ObjectType)
              {[objtype: value], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[objects: msg.objects ++ [PgQuery.Node.decode!(delimited)]], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[privileges: msg.privileges ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[grantees: msg.grantees ++ [PgQuery.Node.decode!(delimited)]], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[grant_option: value], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 grantor:
                   Protox.MergeMessage.merge(msg.grantor, PgQuery.RoleSpec.decode!(delimited))
               ], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.DropBehavior)
              {[behavior: value], rest}

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
        PgQuery.GrantStmt,
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
        1 => {:is_grant, {:scalar, false}, :bool},
        2 =>
          {:targtype, {:scalar, :GRANT_TARGET_TYPE_UNDEFINED}, {:enum, PgQuery.GrantTargetType}},
        3 => {:objtype, {:scalar, :OBJECT_TYPE_UNDEFINED}, {:enum, PgQuery.ObjectType}},
        4 => {:objects, :unpacked, {:message, PgQuery.Node}},
        5 => {:privileges, :unpacked, {:message, PgQuery.Node}},
        6 => {:grantees, :unpacked, {:message, PgQuery.Node}},
        7 => {:grant_option, {:scalar, false}, :bool},
        8 => {:grantor, {:scalar, nil}, {:message, PgQuery.RoleSpec}},
        9 => {:behavior, {:scalar, :DROP_BEHAVIOR_UNDEFINED}, {:enum, PgQuery.DropBehavior}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        behavior: {9, {:scalar, :DROP_BEHAVIOR_UNDEFINED}, {:enum, PgQuery.DropBehavior}},
        grant_option: {7, {:scalar, false}, :bool},
        grantees: {6, :unpacked, {:message, PgQuery.Node}},
        grantor: {8, {:scalar, nil}, {:message, PgQuery.RoleSpec}},
        is_grant: {1, {:scalar, false}, :bool},
        objects: {4, :unpacked, {:message, PgQuery.Node}},
        objtype: {3, {:scalar, :OBJECT_TYPE_UNDEFINED}, {:enum, PgQuery.ObjectType}},
        privileges: {5, :unpacked, {:message, PgQuery.Node}},
        targtype: {2, {:scalar, :GRANT_TARGET_TYPE_UNDEFINED}, {:enum, PgQuery.GrantTargetType}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "isGrant",
          kind: {:scalar, false},
          label: :optional,
          name: :is_grant,
          tag: 1,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "targtype",
          kind: {:scalar, :GRANT_TARGET_TYPE_UNDEFINED},
          label: :optional,
          name: :targtype,
          tag: 2,
          type: {:enum, PgQuery.GrantTargetType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "objtype",
          kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
          label: :optional,
          name: :objtype,
          tag: 3,
          type: {:enum, PgQuery.ObjectType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "objects",
          kind: :unpacked,
          label: :repeated,
          name: :objects,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "privileges",
          kind: :unpacked,
          label: :repeated,
          name: :privileges,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "grantees",
          kind: :unpacked,
          label: :repeated,
          name: :grantees,
          tag: 6,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "grantOption",
          kind: {:scalar, false},
          label: :optional,
          name: :grant_option,
          tag: 7,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "grantor",
          kind: {:scalar, nil},
          label: :optional,
          name: :grantor,
          tag: 8,
          type: {:message, PgQuery.RoleSpec}
        },
        %{
          __struct__: Protox.Field,
          json_name: "behavior",
          kind: {:scalar, :DROP_BEHAVIOR_UNDEFINED},
          label: :optional,
          name: :behavior,
          tag: 9,
          type: {:enum, PgQuery.DropBehavior}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:is_grant) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isGrant",
             kind: {:scalar, false},
             label: :optional,
             name: :is_grant,
             tag: 1,
             type: :bool
           }}
        end

        def field_def("isGrant") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isGrant",
             kind: {:scalar, false},
             label: :optional,
             name: :is_grant,
             tag: 1,
             type: :bool
           }}
        end

        def field_def("is_grant") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isGrant",
             kind: {:scalar, false},
             label: :optional,
             name: :is_grant,
             tag: 1,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:targtype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "targtype",
             kind: {:scalar, :GRANT_TARGET_TYPE_UNDEFINED},
             label: :optional,
             name: :targtype,
             tag: 2,
             type: {:enum, PgQuery.GrantTargetType}
           }}
        end

        def field_def("targtype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "targtype",
             kind: {:scalar, :GRANT_TARGET_TYPE_UNDEFINED},
             label: :optional,
             name: :targtype,
             tag: 2,
             type: {:enum, PgQuery.GrantTargetType}
           }}
        end

        []
      ),
      (
        def field_def(:objtype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "objtype",
             kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
             label: :optional,
             name: :objtype,
             tag: 3,
             type: {:enum, PgQuery.ObjectType}
           }}
        end

        def field_def("objtype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "objtype",
             kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
             label: :optional,
             name: :objtype,
             tag: 3,
             type: {:enum, PgQuery.ObjectType}
           }}
        end

        []
      ),
      (
        def field_def(:objects) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "objects",
             kind: :unpacked,
             label: :repeated,
             name: :objects,
             tag: 4,
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
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:privileges) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "privileges",
             kind: :unpacked,
             label: :repeated,
             name: :privileges,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("privileges") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "privileges",
             kind: :unpacked,
             label: :repeated,
             name: :privileges,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:grantees) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "grantees",
             kind: :unpacked,
             label: :repeated,
             name: :grantees,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("grantees") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "grantees",
             kind: :unpacked,
             label: :repeated,
             name: :grantees,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:grant_option) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "grantOption",
             kind: {:scalar, false},
             label: :optional,
             name: :grant_option,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("grantOption") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "grantOption",
             kind: {:scalar, false},
             label: :optional,
             name: :grant_option,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("grant_option") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "grantOption",
             kind: {:scalar, false},
             label: :optional,
             name: :grant_option,
             tag: 7,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:grantor) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "grantor",
             kind: {:scalar, nil},
             label: :optional,
             name: :grantor,
             tag: 8,
             type: {:message, PgQuery.RoleSpec}
           }}
        end

        def field_def("grantor") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "grantor",
             kind: {:scalar, nil},
             label: :optional,
             name: :grantor,
             tag: 8,
             type: {:message, PgQuery.RoleSpec}
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
             tag: 9,
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
             tag: 9,
             type: {:enum, PgQuery.DropBehavior}
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
    def default(:is_grant) do
      {:ok, false}
    end,
    def default(:targtype) do
      {:ok, :GRANT_TARGET_TYPE_UNDEFINED}
    end,
    def default(:objtype) do
      {:ok, :OBJECT_TYPE_UNDEFINED}
    end,
    def default(:objects) do
      {:error, :no_default_value}
    end,
    def default(:privileges) do
      {:error, :no_default_value}
    end,
    def default(:grantees) do
      {:error, :no_default_value}
    end,
    def default(:grant_option) do
      {:ok, false}
    end,
    def default(:grantor) do
      {:ok, nil}
    end,
    def default(:behavior) do
      {:ok, :DROP_BEHAVIOR_UNDEFINED}
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
