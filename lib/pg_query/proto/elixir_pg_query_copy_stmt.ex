# credo:disable-for-this-file
defmodule PgQuery.CopyStmt do
  @moduledoc false
  defstruct relation: nil,
            query: nil,
            attlist: [],
            is_from: false,
            is_program: false,
            filename: "",
            options: [],
            where_clause: nil

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
        |> encode_query(msg)
        |> encode_attlist(msg)
        |> encode_is_from(msg)
        |> encode_is_program(msg)
        |> encode_filename(msg)
        |> encode_options(msg)
        |> encode_where_clause(msg)
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
      defp encode_query(acc, msg) do
        try do
          if msg.query == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.query)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:query, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_attlist(acc, msg) do
        try do
          case msg.attlist do
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
            reraise Protox.EncodingError.new(:attlist, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_is_from(acc, msg) do
        try do
          if msg.is_from == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.is_from)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_from, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_is_program(acc, msg) do
        try do
          if msg.is_program == false do
            acc
          else
            [acc, "(", Protox.Encode.encode_bool(msg.is_program)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_program, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_filename(acc, msg) do
        try do
          if msg.filename == "" do
            acc
          else
            [acc, "2", Protox.Encode.encode_string(msg.filename)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:filename, "invalid field value"), __STACKTRACE__
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
                  [acc, ":", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:options, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_where_clause(acc, msg) do
        try do
          if msg.where_clause == nil do
            acc
          else
            [acc, "B", Protox.Encode.encode_message(msg.where_clause)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:where_clause, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.CopyStmt))
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

              {[query: Protox.MergeMessage.merge(msg.query, PgQuery.Node.decode!(delimited))],
               rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[attlist: msg.attlist ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_from: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_program: value], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[filename: delimited], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[options: msg.options ++ [PgQuery.Node.decode!(delimited)]], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 where_clause:
                   Protox.MergeMessage.merge(msg.where_clause, PgQuery.Node.decode!(delimited))
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
        PgQuery.CopyStmt,
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
        2 => {:query, {:scalar, nil}, {:message, PgQuery.Node}},
        3 => {:attlist, :unpacked, {:message, PgQuery.Node}},
        4 => {:is_from, {:scalar, false}, :bool},
        5 => {:is_program, {:scalar, false}, :bool},
        6 => {:filename, {:scalar, ""}, :string},
        7 => {:options, :unpacked, {:message, PgQuery.Node}},
        8 => {:where_clause, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        attlist: {3, :unpacked, {:message, PgQuery.Node}},
        filename: {6, {:scalar, ""}, :string},
        is_from: {4, {:scalar, false}, :bool},
        is_program: {5, {:scalar, false}, :bool},
        options: {7, :unpacked, {:message, PgQuery.Node}},
        query: {2, {:scalar, nil}, {:message, PgQuery.Node}},
        relation: {1, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        where_clause: {8, {:scalar, nil}, {:message, PgQuery.Node}}
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
          json_name: "query",
          kind: {:scalar, nil},
          label: :optional,
          name: :query,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "attlist",
          kind: :unpacked,
          label: :repeated,
          name: :attlist,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "isFrom",
          kind: {:scalar, false},
          label: :optional,
          name: :is_from,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "isProgram",
          kind: {:scalar, false},
          label: :optional,
          name: :is_program,
          tag: 5,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "filename",
          kind: {:scalar, ""},
          label: :optional,
          name: :filename,
          tag: 6,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "options",
          kind: :unpacked,
          label: :repeated,
          name: :options,
          tag: 7,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "whereClause",
          kind: {:scalar, nil},
          label: :optional,
          name: :where_clause,
          tag: 8,
          type: {:message, PgQuery.Node}
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
        def field_def(:query) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "query",
             kind: {:scalar, nil},
             label: :optional,
             name: :query,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("query") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "query",
             kind: {:scalar, nil},
             label: :optional,
             name: :query,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:attlist) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "attlist",
             kind: :unpacked,
             label: :repeated,
             name: :attlist,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("attlist") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "attlist",
             kind: :unpacked,
             label: :repeated,
             name: :attlist,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:is_from) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isFrom",
             kind: {:scalar, false},
             label: :optional,
             name: :is_from,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("isFrom") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isFrom",
             kind: {:scalar, false},
             label: :optional,
             name: :is_from,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("is_from") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isFrom",
             kind: {:scalar, false},
             label: :optional,
             name: :is_from,
             tag: 4,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:is_program) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isProgram",
             kind: {:scalar, false},
             label: :optional,
             name: :is_program,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("isProgram") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isProgram",
             kind: {:scalar, false},
             label: :optional,
             name: :is_program,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("is_program") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isProgram",
             kind: {:scalar, false},
             label: :optional,
             name: :is_program,
             tag: 5,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:filename) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "filename",
             kind: {:scalar, ""},
             label: :optional,
             name: :filename,
             tag: 6,
             type: :string
           }}
        end

        def field_def("filename") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "filename",
             kind: {:scalar, ""},
             label: :optional,
             name: :filename,
             tag: 6,
             type: :string
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
             tag: 7,
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
             tag: 7,
             type: {:message, PgQuery.Node}
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
             tag: 8,
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
             tag: 8,
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
    def default(:relation) do
      {:ok, nil}
    end,
    def default(:query) do
      {:ok, nil}
    end,
    def default(:attlist) do
      {:error, :no_default_value}
    end,
    def default(:is_from) do
      {:ok, false}
    end,
    def default(:is_program) do
      {:ok, false}
    end,
    def default(:filename) do
      {:ok, ""}
    end,
    def default(:options) do
      {:error, :no_default_value}
    end,
    def default(:where_clause) do
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
