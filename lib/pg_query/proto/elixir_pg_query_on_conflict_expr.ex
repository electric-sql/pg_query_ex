# credo:disable-for-this-file
defmodule PgQuery.OnConflictExpr do
  @moduledoc false
  defstruct action: :ON_CONFLICT_ACTION_UNDEFINED,
            arbiter_elems: [],
            arbiter_where: nil,
            constraint: 0,
            on_conflict_set: [],
            on_conflict_where: nil,
            excl_rel_index: 0,
            excl_rel_tlist: []

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
        |> encode_action(msg)
        |> encode_arbiter_elems(msg)
        |> encode_arbiter_where(msg)
        |> encode_constraint(msg)
        |> encode_on_conflict_set(msg)
        |> encode_on_conflict_where(msg)
        |> encode_excl_rel_index(msg)
        |> encode_excl_rel_tlist(msg)
      end
    )

    []

    [
      defp encode_action(acc, msg) do
        try do
          if msg.action == :ON_CONFLICT_ACTION_UNDEFINED do
            acc
          else
            [
              acc,
              "\b",
              msg.action |> PgQuery.OnConflictAction.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:action, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_arbiter_elems(acc, msg) do
        try do
          case msg.arbiter_elems do
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
            reraise Protox.EncodingError.new(:arbiter_elems, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_arbiter_where(acc, msg) do
        try do
          if msg.arbiter_where == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.arbiter_where)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:arbiter_where, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_constraint(acc, msg) do
        try do
          if msg.constraint == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.constraint)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:constraint, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_on_conflict_set(acc, msg) do
        try do
          case msg.on_conflict_set do
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
            reraise Protox.EncodingError.new(:on_conflict_set, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_on_conflict_where(acc, msg) do
        try do
          if msg.on_conflict_where == nil do
            acc
          else
            [acc, "2", Protox.Encode.encode_message(msg.on_conflict_where)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:on_conflict_where, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_excl_rel_index(acc, msg) do
        try do
          if msg.excl_rel_index == 0 do
            acc
          else
            [acc, "8", Protox.Encode.encode_int32(msg.excl_rel_index)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:excl_rel_index, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_excl_rel_tlist(acc, msg) do
        try do
          case msg.excl_rel_tlist do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "B", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:excl_rel_tlist, "invalid field value"),
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
          parse_key_value(bytes, struct(PgQuery.OnConflictExpr))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.OnConflictAction)
              {[action: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[arbiter_elems: msg.arbiter_elems ++ [PgQuery.Node.decode!(delimited)]], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 arbiter_where:
                   Protox.MergeMessage.merge(msg.arbiter_where, PgQuery.Node.decode!(delimited))
               ], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[constraint: value], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[on_conflict_set: msg.on_conflict_set ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 on_conflict_where:
                   Protox.MergeMessage.merge(
                     msg.on_conflict_where,
                     PgQuery.Node.decode!(delimited)
                   )
               ], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[excl_rel_index: value], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[excl_rel_tlist: msg.excl_rel_tlist ++ [PgQuery.Node.decode!(delimited)]], rest}

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
        PgQuery.OnConflictExpr,
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
        1 =>
          {:action, {:scalar, :ON_CONFLICT_ACTION_UNDEFINED}, {:enum, PgQuery.OnConflictAction}},
        2 => {:arbiter_elems, :unpacked, {:message, PgQuery.Node}},
        3 => {:arbiter_where, {:scalar, nil}, {:message, PgQuery.Node}},
        4 => {:constraint, {:scalar, 0}, :uint32},
        5 => {:on_conflict_set, :unpacked, {:message, PgQuery.Node}},
        6 => {:on_conflict_where, {:scalar, nil}, {:message, PgQuery.Node}},
        7 => {:excl_rel_index, {:scalar, 0}, :int32},
        8 => {:excl_rel_tlist, :unpacked, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        action: {1, {:scalar, :ON_CONFLICT_ACTION_UNDEFINED}, {:enum, PgQuery.OnConflictAction}},
        arbiter_elems: {2, :unpacked, {:message, PgQuery.Node}},
        arbiter_where: {3, {:scalar, nil}, {:message, PgQuery.Node}},
        constraint: {4, {:scalar, 0}, :uint32},
        excl_rel_index: {7, {:scalar, 0}, :int32},
        excl_rel_tlist: {8, :unpacked, {:message, PgQuery.Node}},
        on_conflict_set: {5, :unpacked, {:message, PgQuery.Node}},
        on_conflict_where: {6, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "action",
          kind: {:scalar, :ON_CONFLICT_ACTION_UNDEFINED},
          label: :optional,
          name: :action,
          tag: 1,
          type: {:enum, PgQuery.OnConflictAction}
        },
        %{
          __struct__: Protox.Field,
          json_name: "arbiterElems",
          kind: :unpacked,
          label: :repeated,
          name: :arbiter_elems,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "arbiterWhere",
          kind: {:scalar, nil},
          label: :optional,
          name: :arbiter_where,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "constraint",
          kind: {:scalar, 0},
          label: :optional,
          name: :constraint,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "onConflictSet",
          kind: :unpacked,
          label: :repeated,
          name: :on_conflict_set,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "onConflictWhere",
          kind: {:scalar, nil},
          label: :optional,
          name: :on_conflict_where,
          tag: 6,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "exclRelIndex",
          kind: {:scalar, 0},
          label: :optional,
          name: :excl_rel_index,
          tag: 7,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "exclRelTlist",
          kind: :unpacked,
          label: :repeated,
          name: :excl_rel_tlist,
          tag: 8,
          type: {:message, PgQuery.Node}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:action) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "action",
             kind: {:scalar, :ON_CONFLICT_ACTION_UNDEFINED},
             label: :optional,
             name: :action,
             tag: 1,
             type: {:enum, PgQuery.OnConflictAction}
           }}
        end

        def field_def("action") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "action",
             kind: {:scalar, :ON_CONFLICT_ACTION_UNDEFINED},
             label: :optional,
             name: :action,
             tag: 1,
             type: {:enum, PgQuery.OnConflictAction}
           }}
        end

        []
      ),
      (
        def field_def(:arbiter_elems) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arbiterElems",
             kind: :unpacked,
             label: :repeated,
             name: :arbiter_elems,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("arbiterElems") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arbiterElems",
             kind: :unpacked,
             label: :repeated,
             name: :arbiter_elems,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("arbiter_elems") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arbiterElems",
             kind: :unpacked,
             label: :repeated,
             name: :arbiter_elems,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:arbiter_where) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arbiterWhere",
             kind: {:scalar, nil},
             label: :optional,
             name: :arbiter_where,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("arbiterWhere") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arbiterWhere",
             kind: {:scalar, nil},
             label: :optional,
             name: :arbiter_where,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("arbiter_where") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arbiterWhere",
             kind: {:scalar, nil},
             label: :optional,
             name: :arbiter_where,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:constraint) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "constraint",
             kind: {:scalar, 0},
             label: :optional,
             name: :constraint,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("constraint") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "constraint",
             kind: {:scalar, 0},
             label: :optional,
             name: :constraint,
             tag: 4,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:on_conflict_set) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onConflictSet",
             kind: :unpacked,
             label: :repeated,
             name: :on_conflict_set,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("onConflictSet") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onConflictSet",
             kind: :unpacked,
             label: :repeated,
             name: :on_conflict_set,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("on_conflict_set") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onConflictSet",
             kind: :unpacked,
             label: :repeated,
             name: :on_conflict_set,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:on_conflict_where) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onConflictWhere",
             kind: {:scalar, nil},
             label: :optional,
             name: :on_conflict_where,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("onConflictWhere") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onConflictWhere",
             kind: {:scalar, nil},
             label: :optional,
             name: :on_conflict_where,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("on_conflict_where") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onConflictWhere",
             kind: {:scalar, nil},
             label: :optional,
             name: :on_conflict_where,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:excl_rel_index) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "exclRelIndex",
             kind: {:scalar, 0},
             label: :optional,
             name: :excl_rel_index,
             tag: 7,
             type: :int32
           }}
        end

        def field_def("exclRelIndex") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "exclRelIndex",
             kind: {:scalar, 0},
             label: :optional,
             name: :excl_rel_index,
             tag: 7,
             type: :int32
           }}
        end

        def field_def("excl_rel_index") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "exclRelIndex",
             kind: {:scalar, 0},
             label: :optional,
             name: :excl_rel_index,
             tag: 7,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:excl_rel_tlist) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "exclRelTlist",
             kind: :unpacked,
             label: :repeated,
             name: :excl_rel_tlist,
             tag: 8,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("exclRelTlist") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "exclRelTlist",
             kind: :unpacked,
             label: :repeated,
             name: :excl_rel_tlist,
             tag: 8,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("excl_rel_tlist") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "exclRelTlist",
             kind: :unpacked,
             label: :repeated,
             name: :excl_rel_tlist,
             tag: 8,
             type: {:message, PgQuery.Node}
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
    def default(:action) do
      {:ok, :ON_CONFLICT_ACTION_UNDEFINED}
    end,
    def default(:arbiter_elems) do
      {:error, :no_default_value}
    end,
    def default(:arbiter_where) do
      {:ok, nil}
    end,
    def default(:constraint) do
      {:ok, 0}
    end,
    def default(:on_conflict_set) do
      {:error, :no_default_value}
    end,
    def default(:on_conflict_where) do
      {:ok, nil}
    end,
    def default(:excl_rel_index) do
      {:ok, 0}
    end,
    def default(:excl_rel_tlist) do
      {:error, :no_default_value}
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
