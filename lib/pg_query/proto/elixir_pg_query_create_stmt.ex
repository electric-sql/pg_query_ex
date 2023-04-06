# credo:disable-for-this-file
defmodule PgQuery.CreateStmt do
  @moduledoc false
  defstruct relation: nil,
            table_elts: [],
            inh_relations: [],
            partbound: nil,
            partspec: nil,
            of_typename: nil,
            constraints: [],
            options: [],
            oncommit: :ON_COMMIT_ACTION_UNDEFINED,
            tablespacename: "",
            access_method: "",
            if_not_exists: false

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
        |> encode_table_elts(msg)
        |> encode_inh_relations(msg)
        |> encode_partbound(msg)
        |> encode_partspec(msg)
        |> encode_of_typename(msg)
        |> encode_constraints(msg)
        |> encode_options(msg)
        |> encode_oncommit(msg)
        |> encode_tablespacename(msg)
        |> encode_access_method(msg)
        |> encode_if_not_exists(msg)
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
      defp encode_table_elts(acc, msg) do
        try do
          case msg.table_elts do
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
            reraise Protox.EncodingError.new(:table_elts, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_inh_relations(acc, msg) do
        try do
          case msg.inh_relations do
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
            reraise Protox.EncodingError.new(:inh_relations, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_partbound(acc, msg) do
        try do
          if msg.partbound == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.partbound)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:partbound, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_partspec(acc, msg) do
        try do
          if msg.partspec == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.partspec)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:partspec, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_of_typename(acc, msg) do
        try do
          if msg.of_typename == nil do
            acc
          else
            [acc, "2", Protox.Encode.encode_message(msg.of_typename)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:of_typename, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_constraints(acc, msg) do
        try do
          case msg.constraints do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, ":", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:constraints, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_options(acc, msg) do
        try do
          case msg.options do
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
            reraise Protox.EncodingError.new(:options, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_oncommit(acc, msg) do
        try do
          if msg.oncommit == :ON_COMMIT_ACTION_UNDEFINED do
            acc
          else
            [
              acc,
              "H",
              msg.oncommit |> PgQuery.OnCommitAction.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:oncommit, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_tablespacename(acc, msg) do
        try do
          if msg.tablespacename == "" do
            acc
          else
            [acc, "R", Protox.Encode.encode_string(msg.tablespacename)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:tablespacename, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_access_method(acc, msg) do
        try do
          if msg.access_method == "" do
            acc
          else
            [acc, "Z", Protox.Encode.encode_string(msg.access_method)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:access_method, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_if_not_exists(acc, msg) do
        try do
          if msg.if_not_exists == false do
            acc
          else
            [acc, "`", Protox.Encode.encode_bool(msg.if_not_exists)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:if_not_exists, "invalid field value"),
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
          parse_key_value(bytes, struct(PgQuery.CreateStmt))
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
              {[table_elts: msg.table_elts ++ [PgQuery.Node.decode!(delimited)]], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[inh_relations: msg.inh_relations ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 partbound:
                   Protox.MergeMessage.merge(
                     msg.partbound,
                     PgQuery.PartitionBoundSpec.decode!(delimited)
                   )
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 partspec:
                   Protox.MergeMessage.merge(
                     msg.partspec,
                     PgQuery.PartitionSpec.decode!(delimited)
                   )
               ], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 of_typename:
                   Protox.MergeMessage.merge(msg.of_typename, PgQuery.TypeName.decode!(delimited))
               ], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[constraints: msg.constraints ++ [PgQuery.Node.decode!(delimited)]], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[options: msg.options ++ [PgQuery.Node.decode!(delimited)]], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.OnCommitAction)
              {[oncommit: value], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[tablespacename: delimited], rest}

            {11, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[access_method: delimited], rest}

            {12, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[if_not_exists: value], rest}

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
        PgQuery.CreateStmt,
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
        2 => {:table_elts, :unpacked, {:message, PgQuery.Node}},
        3 => {:inh_relations, :unpacked, {:message, PgQuery.Node}},
        4 => {:partbound, {:scalar, nil}, {:message, PgQuery.PartitionBoundSpec}},
        5 => {:partspec, {:scalar, nil}, {:message, PgQuery.PartitionSpec}},
        6 => {:of_typename, {:scalar, nil}, {:message, PgQuery.TypeName}},
        7 => {:constraints, :unpacked, {:message, PgQuery.Node}},
        8 => {:options, :unpacked, {:message, PgQuery.Node}},
        9 => {:oncommit, {:scalar, :ON_COMMIT_ACTION_UNDEFINED}, {:enum, PgQuery.OnCommitAction}},
        10 => {:tablespacename, {:scalar, ""}, :string},
        11 => {:access_method, {:scalar, ""}, :string},
        12 => {:if_not_exists, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        access_method: {11, {:scalar, ""}, :string},
        constraints: {7, :unpacked, {:message, PgQuery.Node}},
        if_not_exists: {12, {:scalar, false}, :bool},
        inh_relations: {3, :unpacked, {:message, PgQuery.Node}},
        of_typename: {6, {:scalar, nil}, {:message, PgQuery.TypeName}},
        oncommit: {9, {:scalar, :ON_COMMIT_ACTION_UNDEFINED}, {:enum, PgQuery.OnCommitAction}},
        options: {8, :unpacked, {:message, PgQuery.Node}},
        partbound: {4, {:scalar, nil}, {:message, PgQuery.PartitionBoundSpec}},
        partspec: {5, {:scalar, nil}, {:message, PgQuery.PartitionSpec}},
        relation: {1, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        table_elts: {2, :unpacked, {:message, PgQuery.Node}},
        tablespacename: {10, {:scalar, ""}, :string}
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
          json_name: "tableElts",
          kind: :unpacked,
          label: :repeated,
          name: :table_elts,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "inhRelations",
          kind: :unpacked,
          label: :repeated,
          name: :inh_relations,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "partbound",
          kind: {:scalar, nil},
          label: :optional,
          name: :partbound,
          tag: 4,
          type: {:message, PgQuery.PartitionBoundSpec}
        },
        %{
          __struct__: Protox.Field,
          json_name: "partspec",
          kind: {:scalar, nil},
          label: :optional,
          name: :partspec,
          tag: 5,
          type: {:message, PgQuery.PartitionSpec}
        },
        %{
          __struct__: Protox.Field,
          json_name: "ofTypename",
          kind: {:scalar, nil},
          label: :optional,
          name: :of_typename,
          tag: 6,
          type: {:message, PgQuery.TypeName}
        },
        %{
          __struct__: Protox.Field,
          json_name: "constraints",
          kind: :unpacked,
          label: :repeated,
          name: :constraints,
          tag: 7,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "options",
          kind: :unpacked,
          label: :repeated,
          name: :options,
          tag: 8,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "oncommit",
          kind: {:scalar, :ON_COMMIT_ACTION_UNDEFINED},
          label: :optional,
          name: :oncommit,
          tag: 9,
          type: {:enum, PgQuery.OnCommitAction}
        },
        %{
          __struct__: Protox.Field,
          json_name: "tablespacename",
          kind: {:scalar, ""},
          label: :optional,
          name: :tablespacename,
          tag: 10,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "accessMethod",
          kind: {:scalar, ""},
          label: :optional,
          name: :access_method,
          tag: 11,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "ifNotExists",
          kind: {:scalar, false},
          label: :optional,
          name: :if_not_exists,
          tag: 12,
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
        def field_def(:table_elts) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableElts",
             kind: :unpacked,
             label: :repeated,
             name: :table_elts,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("tableElts") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableElts",
             kind: :unpacked,
             label: :repeated,
             name: :table_elts,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("table_elts") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableElts",
             kind: :unpacked,
             label: :repeated,
             name: :table_elts,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:inh_relations) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inhRelations",
             kind: :unpacked,
             label: :repeated,
             name: :inh_relations,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("inhRelations") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inhRelations",
             kind: :unpacked,
             label: :repeated,
             name: :inh_relations,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("inh_relations") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inhRelations",
             kind: :unpacked,
             label: :repeated,
             name: :inh_relations,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:partbound) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partbound",
             kind: {:scalar, nil},
             label: :optional,
             name: :partbound,
             tag: 4,
             type: {:message, PgQuery.PartitionBoundSpec}
           }}
        end

        def field_def("partbound") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partbound",
             kind: {:scalar, nil},
             label: :optional,
             name: :partbound,
             tag: 4,
             type: {:message, PgQuery.PartitionBoundSpec}
           }}
        end

        []
      ),
      (
        def field_def(:partspec) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partspec",
             kind: {:scalar, nil},
             label: :optional,
             name: :partspec,
             tag: 5,
             type: {:message, PgQuery.PartitionSpec}
           }}
        end

        def field_def("partspec") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partspec",
             kind: {:scalar, nil},
             label: :optional,
             name: :partspec,
             tag: 5,
             type: {:message, PgQuery.PartitionSpec}
           }}
        end

        []
      ),
      (
        def field_def(:of_typename) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ofTypename",
             kind: {:scalar, nil},
             label: :optional,
             name: :of_typename,
             tag: 6,
             type: {:message, PgQuery.TypeName}
           }}
        end

        def field_def("ofTypename") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ofTypename",
             kind: {:scalar, nil},
             label: :optional,
             name: :of_typename,
             tag: 6,
             type: {:message, PgQuery.TypeName}
           }}
        end

        def field_def("of_typename") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ofTypename",
             kind: {:scalar, nil},
             label: :optional,
             name: :of_typename,
             tag: 6,
             type: {:message, PgQuery.TypeName}
           }}
        end
      ),
      (
        def field_def(:constraints) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "constraints",
             kind: :unpacked,
             label: :repeated,
             name: :constraints,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("constraints") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "constraints",
             kind: :unpacked,
             label: :repeated,
             name: :constraints,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:options) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "options",
             kind: :unpacked,
             label: :repeated,
             name: :options,
             tag: 8,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("options") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "options",
             kind: :unpacked,
             label: :repeated,
             name: :options,
             tag: 8,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:oncommit) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oncommit",
             kind: {:scalar, :ON_COMMIT_ACTION_UNDEFINED},
             label: :optional,
             name: :oncommit,
             tag: 9,
             type: {:enum, PgQuery.OnCommitAction}
           }}
        end

        def field_def("oncommit") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oncommit",
             kind: {:scalar, :ON_COMMIT_ACTION_UNDEFINED},
             label: :optional,
             name: :oncommit,
             tag: 9,
             type: {:enum, PgQuery.OnCommitAction}
           }}
        end

        []
      ),
      (
        def field_def(:tablespacename) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tablespacename",
             kind: {:scalar, ""},
             label: :optional,
             name: :tablespacename,
             tag: 10,
             type: :string
           }}
        end

        def field_def("tablespacename") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tablespacename",
             kind: {:scalar, ""},
             label: :optional,
             name: :tablespacename,
             tag: 10,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:access_method) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accessMethod",
             kind: {:scalar, ""},
             label: :optional,
             name: :access_method,
             tag: 11,
             type: :string
           }}
        end

        def field_def("accessMethod") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accessMethod",
             kind: {:scalar, ""},
             label: :optional,
             name: :access_method,
             tag: 11,
             type: :string
           }}
        end

        def field_def("access_method") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accessMethod",
             kind: {:scalar, ""},
             label: :optional,
             name: :access_method,
             tag: 11,
             type: :string
           }}
        end
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
             tag: 12,
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
             tag: 12,
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
             tag: 12,
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
    def default(:relation) do
      {:ok, nil}
    end,
    def default(:table_elts) do
      {:error, :no_default_value}
    end,
    def default(:inh_relations) do
      {:error, :no_default_value}
    end,
    def default(:partbound) do
      {:ok, nil}
    end,
    def default(:partspec) do
      {:ok, nil}
    end,
    def default(:of_typename) do
      {:ok, nil}
    end,
    def default(:constraints) do
      {:error, :no_default_value}
    end,
    def default(:options) do
      {:error, :no_default_value}
    end,
    def default(:oncommit) do
      {:ok, :ON_COMMIT_ACTION_UNDEFINED}
    end,
    def default(:tablespacename) do
      {:ok, ""}
    end,
    def default(:access_method) do
      {:ok, ""}
    end,
    def default(:if_not_exists) do
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
