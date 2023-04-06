# credo:disable-for-this-file
defmodule PgQuery.RuleStmt do
  @moduledoc false
  defstruct relation: nil,
            rulename: "",
            where_clause: nil,
            event: :CMD_TYPE_UNDEFINED,
            instead: false,
            actions: [],
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
        |> encode_relation(msg)
        |> encode_rulename(msg)
        |> encode_where_clause(msg)
        |> encode_event(msg)
        |> encode_instead(msg)
        |> encode_actions(msg)
        |> encode_replace(msg)
      end
    )

    []

    [
      defp encode_relation(acc, msg) do
        try do
          if msg.relation == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.relation)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:relation, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rulename(acc, msg) do
        try do
          if msg.rulename == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.rulename)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rulename, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_where_clause(acc, msg) do
        try do
          if msg.where_clause == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.where_clause)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:where_clause, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_event(acc, msg) do
        try do
          if msg.event == :CMD_TYPE_UNDEFINED do
            acc
          else
            [acc, " ", msg.event |> PgQuery.CmdType.encode() |> Protox.Encode.encode_enum()]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:event, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_instead(acc, msg) do
        try do
          if msg.instead == false do
            acc
          else
            [acc, "(", Protox.Encode.encode_bool(msg.instead)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:instead, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_actions(acc, msg) do
        try do
          case msg.actions do
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
            reraise Protox.EncodingError.new(:actions, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.RuleStmt))
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

              {[
                 relation:
                   Protox.MergeMessage.merge(msg.relation, PgQuery.RangeVar.decode!(delimited))
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[rulename: delimited], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 where_clause:
                   Protox.MergeMessage.merge(msg.where_clause, PgQuery.Node.decode!(delimited))
               ], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.CmdType)
              {[event: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[instead: value], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[actions: msg.actions ++ [PgQuery.Node.decode!(delimited)]], rest}

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
        PgQuery.RuleStmt,
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
        1 => {:relation, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        2 => {:rulename, {:scalar, ""}, :string},
        3 => {:where_clause, {:scalar, nil}, {:message, PgQuery.Node}},
        4 => {:event, {:scalar, :CMD_TYPE_UNDEFINED}, {:enum, PgQuery.CmdType}},
        5 => {:instead, {:scalar, false}, :bool},
        6 => {:actions, :unpacked, {:message, PgQuery.Node}},
        7 => {:replace, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        actions: {6, :unpacked, {:message, PgQuery.Node}},
        event: {4, {:scalar, :CMD_TYPE_UNDEFINED}, {:enum, PgQuery.CmdType}},
        instead: {5, {:scalar, false}, :bool},
        relation: {1, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        replace: {7, {:scalar, false}, :bool},
        rulename: {2, {:scalar, ""}, :string},
        where_clause: {3, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "relation",
          kind: {:scalar, nil},
          label: :optional,
          name: :relation,
          tag: 1,
          type: {:message, PgQuery.RangeVar}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rulename",
          kind: {:scalar, ""},
          label: :optional,
          name: :rulename,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "whereClause",
          kind: {:scalar, nil},
          label: :optional,
          name: :where_clause,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "event",
          kind: {:scalar, :CMD_TYPE_UNDEFINED},
          label: :optional,
          name: :event,
          tag: 4,
          type: {:enum, PgQuery.CmdType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "instead",
          kind: {:scalar, false},
          label: :optional,
          name: :instead,
          tag: 5,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "actions",
          kind: :unpacked,
          label: :repeated,
          name: :actions,
          tag: 6,
          type: {:message, PgQuery.Node}
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
        def field_def(:relation) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relation",
             kind: {:scalar, nil},
             label: :optional,
             name: :relation,
             tag: 1,
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
             tag: 1,
             type: {:message, PgQuery.RangeVar}
           }}
        end

        []
      ),
      (
        def field_def(:rulename) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rulename",
             kind: {:scalar, ""},
             label: :optional,
             name: :rulename,
             tag: 2,
             type: :string
           }}
        end

        def field_def("rulename") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rulename",
             kind: {:scalar, ""},
             label: :optional,
             name: :rulename,
             tag: 2,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:where_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "whereClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :where_clause,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("whereClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "whereClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :where_clause,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("where_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "whereClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :where_clause,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:event) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "event",
             kind: {:scalar, :CMD_TYPE_UNDEFINED},
             label: :optional,
             name: :event,
             tag: 4,
             type: {:enum, PgQuery.CmdType}
           }}
        end

        def field_def("event") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "event",
             kind: {:scalar, :CMD_TYPE_UNDEFINED},
             label: :optional,
             name: :event,
             tag: 4,
             type: {:enum, PgQuery.CmdType}
           }}
        end

        []
      ),
      (
        def field_def(:instead) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "instead",
             kind: {:scalar, false},
             label: :optional,
             name: :instead,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("instead") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "instead",
             kind: {:scalar, false},
             label: :optional,
             name: :instead,
             tag: 5,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:actions) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "actions",
             kind: :unpacked,
             label: :repeated,
             name: :actions,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("actions") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "actions",
             kind: :unpacked,
             label: :repeated,
             name: :actions,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        []
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
    def default(:relation) do
      {:ok, nil}
    end,
    def default(:rulename) do
      {:ok, ""}
    end,
    def default(:where_clause) do
      {:ok, nil}
    end,
    def default(:event) do
      {:ok, :CMD_TYPE_UNDEFINED}
    end,
    def default(:instead) do
      {:ok, false}
    end,
    def default(:actions) do
      {:error, :no_default_value}
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
