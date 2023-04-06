# credo:disable-for-this-file
defmodule PgQuery.GrantRoleStmt do
  @moduledoc false
  defstruct granted_roles: [],
            grantee_roles: [],
            is_grant: false,
            admin_opt: false,
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
        |> encode_granted_roles(msg)
        |> encode_grantee_roles(msg)
        |> encode_is_grant(msg)
        |> encode_admin_opt(msg)
        |> encode_grantor(msg)
        |> encode_behavior(msg)
      end
    )

    []

    [
      defp encode_granted_roles(acc, msg) do
        try do
          case msg.granted_roles do
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
            reraise Protox.EncodingError.new(:granted_roles, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_grantee_roles(acc, msg) do
        try do
          case msg.grantee_roles do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x12", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:grantee_roles, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_is_grant(acc, msg) do
        try do
          if msg.is_grant == false do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_bool(msg.is_grant)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_grant, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_admin_opt(acc, msg) do
        try do
          if msg.admin_opt == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.admin_opt)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:admin_opt, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_grantor(acc, msg) do
        try do
          if msg.grantor == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.grantor)]
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
              "0",
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
          parse_key_value(bytes, struct(PgQuery.GrantRoleStmt))
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
              {[granted_roles: msg.granted_roles ++ [PgQuery.Node.decode!(delimited)]], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[grantee_roles: msg.grantee_roles ++ [PgQuery.Node.decode!(delimited)]], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_grant: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[admin_opt: value], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 grantor:
                   Protox.MergeMessage.merge(msg.grantor, PgQuery.RoleSpec.decode!(delimited))
               ], rest}

            {6, _, bytes} ->
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
        PgQuery.GrantRoleStmt,
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
        1 => {:granted_roles, :unpacked, {:message, PgQuery.Node}},
        2 => {:grantee_roles, :unpacked, {:message, PgQuery.Node}},
        3 => {:is_grant, {:scalar, false}, :bool},
        4 => {:admin_opt, {:scalar, false}, :bool},
        5 => {:grantor, {:scalar, nil}, {:message, PgQuery.RoleSpec}},
        6 => {:behavior, {:scalar, :DROP_BEHAVIOR_UNDEFINED}, {:enum, PgQuery.DropBehavior}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        admin_opt: {4, {:scalar, false}, :bool},
        behavior: {6, {:scalar, :DROP_BEHAVIOR_UNDEFINED}, {:enum, PgQuery.DropBehavior}},
        granted_roles: {1, :unpacked, {:message, PgQuery.Node}},
        grantee_roles: {2, :unpacked, {:message, PgQuery.Node}},
        grantor: {5, {:scalar, nil}, {:message, PgQuery.RoleSpec}},
        is_grant: {3, {:scalar, false}, :bool}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "grantedRoles",
          kind: :unpacked,
          label: :repeated,
          name: :granted_roles,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "granteeRoles",
          kind: :unpacked,
          label: :repeated,
          name: :grantee_roles,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "isGrant",
          kind: {:scalar, false},
          label: :optional,
          name: :is_grant,
          tag: 3,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "adminOpt",
          kind: {:scalar, false},
          label: :optional,
          name: :admin_opt,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "grantor",
          kind: {:scalar, nil},
          label: :optional,
          name: :grantor,
          tag: 5,
          type: {:message, PgQuery.RoleSpec}
        },
        %{
          __struct__: Protox.Field,
          json_name: "behavior",
          kind: {:scalar, :DROP_BEHAVIOR_UNDEFINED},
          label: :optional,
          name: :behavior,
          tag: 6,
          type: {:enum, PgQuery.DropBehavior}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:granted_roles) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "grantedRoles",
             kind: :unpacked,
             label: :repeated,
             name: :granted_roles,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("grantedRoles") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "grantedRoles",
             kind: :unpacked,
             label: :repeated,
             name: :granted_roles,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("granted_roles") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "grantedRoles",
             kind: :unpacked,
             label: :repeated,
             name: :granted_roles,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:grantee_roles) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "granteeRoles",
             kind: :unpacked,
             label: :repeated,
             name: :grantee_roles,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("granteeRoles") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "granteeRoles",
             kind: :unpacked,
             label: :repeated,
             name: :grantee_roles,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("grantee_roles") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "granteeRoles",
             kind: :unpacked,
             label: :repeated,
             name: :grantee_roles,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:is_grant) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isGrant",
             kind: {:scalar, false},
             label: :optional,
             name: :is_grant,
             tag: 3,
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
             tag: 3,
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
             tag: 3,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:admin_opt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "adminOpt",
             kind: {:scalar, false},
             label: :optional,
             name: :admin_opt,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("adminOpt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "adminOpt",
             kind: {:scalar, false},
             label: :optional,
             name: :admin_opt,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("admin_opt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "adminOpt",
             kind: {:scalar, false},
             label: :optional,
             name: :admin_opt,
             tag: 4,
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
             tag: 5,
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
             tag: 5,
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
    def default(:granted_roles) do
      {:error, :no_default_value}
    end,
    def default(:grantee_roles) do
      {:error, :no_default_value}
    end,
    def default(:is_grant) do
      {:ok, false}
    end,
    def default(:admin_opt) do
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
