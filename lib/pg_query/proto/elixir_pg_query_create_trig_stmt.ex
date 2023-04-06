# credo:disable-for-this-file
defmodule PgQuery.CreateTrigStmt do
  @moduledoc false
  defstruct replace: false,
            isconstraint: false,
            trigname: "",
            relation: nil,
            funcname: [],
            args: [],
            row: false,
            timing: 0,
            events: 0,
            columns: [],
            when_clause: nil,
            transition_rels: [],
            deferrable: false,
            initdeferred: false,
            constrrel: nil

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
        |> encode_replace(msg)
        |> encode_isconstraint(msg)
        |> encode_trigname(msg)
        |> encode_relation(msg)
        |> encode_funcname(msg)
        |> encode_args(msg)
        |> encode_row(msg)
        |> encode_timing(msg)
        |> encode_events(msg)
        |> encode_columns(msg)
        |> encode_when_clause(msg)
        |> encode_transition_rels(msg)
        |> encode_deferrable(msg)
        |> encode_initdeferred(msg)
        |> encode_constrrel(msg)
      end
    )

    []

    [
      defp encode_replace(acc, msg) do
        try do
          if msg.replace == false do
            acc
          else
            [acc, "\b", Protox.Encode.encode_bool(msg.replace)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:replace, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_isconstraint(acc, msg) do
        try do
          if msg.isconstraint == false do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_bool(msg.isconstraint)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:isconstraint, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_trigname(acc, msg) do
        try do
          if msg.trigname == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.trigname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:trigname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_relation(acc, msg) do
        try do
          if msg.relation == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.relation)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:relation, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_funcname(acc, msg) do
        try do
          case msg.funcname do
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
            reraise Protox.EncodingError.new(:funcname, "invalid field value"), __STACKTRACE__
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
                  [acc, "2", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:args, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_row(acc, msg) do
        try do
          if msg.row == false do
            acc
          else
            [acc, "8", Protox.Encode.encode_bool(msg.row)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:row, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_timing(acc, msg) do
        try do
          if msg.timing == 0 do
            acc
          else
            [acc, "@", Protox.Encode.encode_int32(msg.timing)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:timing, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_events(acc, msg) do
        try do
          if msg.events == 0 do
            acc
          else
            [acc, "H", Protox.Encode.encode_int32(msg.events)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:events, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_columns(acc, msg) do
        try do
          case msg.columns do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "R", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:columns, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_when_clause(acc, msg) do
        try do
          if msg.when_clause == nil do
            acc
          else
            [acc, "Z", Protox.Encode.encode_message(msg.when_clause)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:when_clause, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_transition_rels(acc, msg) do
        try do
          case msg.transition_rels do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "b", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:transition_rels, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_deferrable(acc, msg) do
        try do
          if msg.deferrable == false do
            acc
          else
            [acc, "h", Protox.Encode.encode_bool(msg.deferrable)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:deferrable, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_initdeferred(acc, msg) do
        try do
          if msg.initdeferred == false do
            acc
          else
            [acc, "p", Protox.Encode.encode_bool(msg.initdeferred)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:initdeferred, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_constrrel(acc, msg) do
        try do
          if msg.constrrel == nil do
            acc
          else
            [acc, "z", Protox.Encode.encode_message(msg.constrrel)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:constrrel, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.CreateTrigStmt))
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
              {[replace: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[isconstraint: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[trigname: delimited], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 relation:
                   Protox.MergeMessage.merge(msg.relation, PgQuery.RangeVar.decode!(delimited))
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[funcname: msg.funcname ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[args: msg.args ++ [PgQuery.Node.decode!(delimited)]], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[row: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[timing: value], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[events: value], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[columns: msg.columns ++ [PgQuery.Node.decode!(delimited)]], rest}

            {11, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 when_clause:
                   Protox.MergeMessage.merge(msg.when_clause, PgQuery.Node.decode!(delimited))
               ], rest}

            {12, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[transition_rels: msg.transition_rels ++ [PgQuery.Node.decode!(delimited)]], rest}

            {13, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[deferrable: value], rest}

            {14, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[initdeferred: value], rest}

            {15, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 constrrel:
                   Protox.MergeMessage.merge(msg.constrrel, PgQuery.RangeVar.decode!(delimited))
               ], rest}

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
        PgQuery.CreateTrigStmt,
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
        1 => {:replace, {:scalar, false}, :bool},
        2 => {:isconstraint, {:scalar, false}, :bool},
        3 => {:trigname, {:scalar, ""}, :string},
        4 => {:relation, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        5 => {:funcname, :unpacked, {:message, PgQuery.Node}},
        6 => {:args, :unpacked, {:message, PgQuery.Node}},
        7 => {:row, {:scalar, false}, :bool},
        8 => {:timing, {:scalar, 0}, :int32},
        9 => {:events, {:scalar, 0}, :int32},
        10 => {:columns, :unpacked, {:message, PgQuery.Node}},
        11 => {:when_clause, {:scalar, nil}, {:message, PgQuery.Node}},
        12 => {:transition_rels, :unpacked, {:message, PgQuery.Node}},
        13 => {:deferrable, {:scalar, false}, :bool},
        14 => {:initdeferred, {:scalar, false}, :bool},
        15 => {:constrrel, {:scalar, nil}, {:message, PgQuery.RangeVar}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        args: {6, :unpacked, {:message, PgQuery.Node}},
        columns: {10, :unpacked, {:message, PgQuery.Node}},
        constrrel: {15, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        deferrable: {13, {:scalar, false}, :bool},
        events: {9, {:scalar, 0}, :int32},
        funcname: {5, :unpacked, {:message, PgQuery.Node}},
        initdeferred: {14, {:scalar, false}, :bool},
        isconstraint: {2, {:scalar, false}, :bool},
        relation: {4, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        replace: {1, {:scalar, false}, :bool},
        row: {7, {:scalar, false}, :bool},
        timing: {8, {:scalar, 0}, :int32},
        transition_rels: {12, :unpacked, {:message, PgQuery.Node}},
        trigname: {3, {:scalar, ""}, :string},
        when_clause: {11, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "replace",
          kind: {:scalar, false},
          label: :optional,
          name: :replace,
          tag: 1,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "isconstraint",
          kind: {:scalar, false},
          label: :optional,
          name: :isconstraint,
          tag: 2,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "trigname",
          kind: {:scalar, ""},
          label: :optional,
          name: :trigname,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "relation",
          kind: {:scalar, nil},
          label: :optional,
          name: :relation,
          tag: 4,
          type: {:message, PgQuery.RangeVar}
        },
        %{
          __struct__: Protox.Field,
          json_name: "funcname",
          kind: :unpacked,
          label: :repeated,
          name: :funcname,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "args",
          kind: :unpacked,
          label: :repeated,
          name: :args,
          tag: 6,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "row",
          kind: {:scalar, false},
          label: :optional,
          name: :row,
          tag: 7,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "timing",
          kind: {:scalar, 0},
          label: :optional,
          name: :timing,
          tag: 8,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "events",
          kind: {:scalar, 0},
          label: :optional,
          name: :events,
          tag: 9,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "columns",
          kind: :unpacked,
          label: :repeated,
          name: :columns,
          tag: 10,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "whenClause",
          kind: {:scalar, nil},
          label: :optional,
          name: :when_clause,
          tag: 11,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "transitionRels",
          kind: :unpacked,
          label: :repeated,
          name: :transition_rels,
          tag: 12,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "deferrable",
          kind: {:scalar, false},
          label: :optional,
          name: :deferrable,
          tag: 13,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "initdeferred",
          kind: {:scalar, false},
          label: :optional,
          name: :initdeferred,
          tag: 14,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "constrrel",
          kind: {:scalar, nil},
          label: :optional,
          name: :constrrel,
          tag: 15,
          type: {:message, PgQuery.RangeVar}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:replace) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "replace",
             kind: {:scalar, false},
             label: :optional,
             name: :replace,
             tag: 1,
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
             tag: 1,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:isconstraint) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isconstraint",
             kind: {:scalar, false},
             label: :optional,
             name: :isconstraint,
             tag: 2,
             type: :bool
           }}
        end

        def field_def("isconstraint") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isconstraint",
             kind: {:scalar, false},
             label: :optional,
             name: :isconstraint,
             tag: 2,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:trigname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "trigname",
             kind: {:scalar, ""},
             label: :optional,
             name: :trigname,
             tag: 3,
             type: :string
           }}
        end

        def field_def("trigname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "trigname",
             kind: {:scalar, ""},
             label: :optional,
             name: :trigname,
             tag: 3,
             type: :string
           }}
        end

        []
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
             tag: 4,
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
             tag: 4,
             type: {:message, PgQuery.RangeVar}
           }}
        end

        []
      ),
      (
        def field_def(:funcname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcname",
             kind: :unpacked,
             label: :repeated,
             name: :funcname,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("funcname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcname",
             kind: :unpacked,
             label: :repeated,
             name: :funcname,
             tag: 5,
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
             tag: 6,
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
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:row) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "row",
             kind: {:scalar, false},
             label: :optional,
             name: :row,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("row") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "row",
             kind: {:scalar, false},
             label: :optional,
             name: :row,
             tag: 7,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:timing) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "timing",
             kind: {:scalar, 0},
             label: :optional,
             name: :timing,
             tag: 8,
             type: :int32
           }}
        end

        def field_def("timing") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "timing",
             kind: {:scalar, 0},
             label: :optional,
             name: :timing,
             tag: 8,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:events) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "events",
             kind: {:scalar, 0},
             label: :optional,
             name: :events,
             tag: 9,
             type: :int32
           }}
        end

        def field_def("events") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "events",
             kind: {:scalar, 0},
             label: :optional,
             name: :events,
             tag: 9,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:columns) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columns",
             kind: :unpacked,
             label: :repeated,
             name: :columns,
             tag: 10,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("columns") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columns",
             kind: :unpacked,
             label: :repeated,
             name: :columns,
             tag: 10,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:when_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "whenClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :when_clause,
             tag: 11,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("whenClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "whenClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :when_clause,
             tag: 11,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("when_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "whenClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :when_clause,
             tag: 11,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:transition_rels) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "transitionRels",
             kind: :unpacked,
             label: :repeated,
             name: :transition_rels,
             tag: 12,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("transitionRels") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "transitionRels",
             kind: :unpacked,
             label: :repeated,
             name: :transition_rels,
             tag: 12,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("transition_rels") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "transitionRels",
             kind: :unpacked,
             label: :repeated,
             name: :transition_rels,
             tag: 12,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:deferrable) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "deferrable",
             kind: {:scalar, false},
             label: :optional,
             name: :deferrable,
             tag: 13,
             type: :bool
           }}
        end

        def field_def("deferrable") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "deferrable",
             kind: {:scalar, false},
             label: :optional,
             name: :deferrable,
             tag: 13,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:initdeferred) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "initdeferred",
             kind: {:scalar, false},
             label: :optional,
             name: :initdeferred,
             tag: 14,
             type: :bool
           }}
        end

        def field_def("initdeferred") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "initdeferred",
             kind: {:scalar, false},
             label: :optional,
             name: :initdeferred,
             tag: 14,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:constrrel) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "constrrel",
             kind: {:scalar, nil},
             label: :optional,
             name: :constrrel,
             tag: 15,
             type: {:message, PgQuery.RangeVar}
           }}
        end

        def field_def("constrrel") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "constrrel",
             kind: {:scalar, nil},
             label: :optional,
             name: :constrrel,
             tag: 15,
             type: {:message, PgQuery.RangeVar}
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
    def default(:replace) do
      {:ok, false}
    end,
    def default(:isconstraint) do
      {:ok, false}
    end,
    def default(:trigname) do
      {:ok, ""}
    end,
    def default(:relation) do
      {:ok, nil}
    end,
    def default(:funcname) do
      {:error, :no_default_value}
    end,
    def default(:args) do
      {:error, :no_default_value}
    end,
    def default(:row) do
      {:ok, false}
    end,
    def default(:timing) do
      {:ok, 0}
    end,
    def default(:events) do
      {:ok, 0}
    end,
    def default(:columns) do
      {:error, :no_default_value}
    end,
    def default(:when_clause) do
      {:ok, nil}
    end,
    def default(:transition_rels) do
      {:error, :no_default_value}
    end,
    def default(:deferrable) do
      {:ok, false}
    end,
    def default(:initdeferred) do
      {:ok, false}
    end,
    def default(:constrrel) do
      {:ok, nil}
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
