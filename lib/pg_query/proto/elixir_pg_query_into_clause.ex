# credo:disable-for-this-file
defmodule PgQuery.IntoClause do
  @moduledoc false
  defstruct rel: nil,
            col_names: [],
            access_method: "",
            options: [],
            on_commit: :ON_COMMIT_ACTION_UNDEFINED,
            table_space_name: "",
            view_query: nil,
            skip_data: false

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
        |> encode_rel(msg)
        |> encode_col_names(msg)
        |> encode_access_method(msg)
        |> encode_options(msg)
        |> encode_on_commit(msg)
        |> encode_table_space_name(msg)
        |> encode_view_query(msg)
        |> encode_skip_data(msg)
      end
    )

    []

    [
      defp encode_rel(acc, msg) do
        try do
          if msg.rel == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.rel)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rel, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_col_names(acc, msg) do
        try do
          case msg.col_names do
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
            reraise Protox.EncodingError.new(:col_names, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_access_method(acc, msg) do
        try do
          if msg.access_method == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.access_method)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:access_method, "invalid field value"),
                    __STACKTRACE__
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
                  [acc, "\"", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:options, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_on_commit(acc, msg) do
        try do
          if msg.on_commit == :ON_COMMIT_ACTION_UNDEFINED do
            acc
          else
            [
              acc,
              "(",
              msg.on_commit |> PgQuery.OnCommitAction.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:on_commit, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_table_space_name(acc, msg) do
        try do
          if msg.table_space_name == "" do
            acc
          else
            [acc, "2", Protox.Encode.encode_string(msg.table_space_name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:table_space_name, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_view_query(acc, msg) do
        try do
          if msg.view_query == nil do
            acc
          else
            [acc, ":", Protox.Encode.encode_message(msg.view_query)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:view_query, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_skip_data(acc, msg) do
        try do
          if msg.skip_data == false do
            acc
          else
            [acc, "@", Protox.Encode.encode_bool(msg.skip_data)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:skip_data, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.IntoClause))
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

              {[rel: Protox.MergeMessage.merge(msg.rel, PgQuery.RangeVar.decode!(delimited))],
               rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[col_names: msg.col_names ++ [PgQuery.Node.decode!(delimited)]], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[access_method: delimited], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[options: msg.options ++ [PgQuery.Node.decode!(delimited)]], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.OnCommitAction)
              {[on_commit: value], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[table_space_name: delimited], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 view_query:
                   Protox.MergeMessage.merge(msg.view_query, PgQuery.Node.decode!(delimited))
               ], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[skip_data: value], rest}

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
        PgQuery.IntoClause,
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
        1 => {:rel, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        2 => {:col_names, :unpacked, {:message, PgQuery.Node}},
        3 => {:access_method, {:scalar, ""}, :string},
        4 => {:options, :unpacked, {:message, PgQuery.Node}},
        5 =>
          {:on_commit, {:scalar, :ON_COMMIT_ACTION_UNDEFINED}, {:enum, PgQuery.OnCommitAction}},
        6 => {:table_space_name, {:scalar, ""}, :string},
        7 => {:view_query, {:scalar, nil}, {:message, PgQuery.Node}},
        8 => {:skip_data, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        access_method: {3, {:scalar, ""}, :string},
        col_names: {2, :unpacked, {:message, PgQuery.Node}},
        on_commit: {5, {:scalar, :ON_COMMIT_ACTION_UNDEFINED}, {:enum, PgQuery.OnCommitAction}},
        options: {4, :unpacked, {:message, PgQuery.Node}},
        rel: {1, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        skip_data: {8, {:scalar, false}, :bool},
        table_space_name: {6, {:scalar, ""}, :string},
        view_query: {7, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "rel",
          kind: {:scalar, nil},
          label: :optional,
          name: :rel,
          tag: 1,
          type: {:message, PgQuery.RangeVar}
        },
        %{
          __struct__: Protox.Field,
          json_name: "colNames",
          kind: :unpacked,
          label: :repeated,
          name: :col_names,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "accessMethod",
          kind: {:scalar, ""},
          label: :optional,
          name: :access_method,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "options",
          kind: :unpacked,
          label: :repeated,
          name: :options,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "onCommit",
          kind: {:scalar, :ON_COMMIT_ACTION_UNDEFINED},
          label: :optional,
          name: :on_commit,
          tag: 5,
          type: {:enum, PgQuery.OnCommitAction}
        },
        %{
          __struct__: Protox.Field,
          json_name: "tableSpaceName",
          kind: {:scalar, ""},
          label: :optional,
          name: :table_space_name,
          tag: 6,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "viewQuery",
          kind: {:scalar, nil},
          label: :optional,
          name: :view_query,
          tag: 7,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "skipData",
          kind: {:scalar, false},
          label: :optional,
          name: :skip_data,
          tag: 8,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:rel) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rel",
             kind: {:scalar, nil},
             label: :optional,
             name: :rel,
             tag: 1,
             type: {:message, PgQuery.RangeVar}
           }}
        end

        def field_def("rel") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rel",
             kind: {:scalar, nil},
             label: :optional,
             name: :rel,
             tag: 1,
             type: {:message, PgQuery.RangeVar}
           }}
        end

        []
      ),
      (
        def field_def(:col_names) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colNames",
             kind: :unpacked,
             label: :repeated,
             name: :col_names,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("colNames") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colNames",
             kind: :unpacked,
             label: :repeated,
             name: :col_names,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("col_names") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colNames",
             kind: :unpacked,
             label: :repeated,
             name: :col_names,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end
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
             tag: 3,
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
             tag: 3,
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
             tag: 3,
             type: :string
           }}
        end
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
             tag: 4,
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
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:on_commit) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onCommit",
             kind: {:scalar, :ON_COMMIT_ACTION_UNDEFINED},
             label: :optional,
             name: :on_commit,
             tag: 5,
             type: {:enum, PgQuery.OnCommitAction}
           }}
        end

        def field_def("onCommit") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onCommit",
             kind: {:scalar, :ON_COMMIT_ACTION_UNDEFINED},
             label: :optional,
             name: :on_commit,
             tag: 5,
             type: {:enum, PgQuery.OnCommitAction}
           }}
        end

        def field_def("on_commit") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onCommit",
             kind: {:scalar, :ON_COMMIT_ACTION_UNDEFINED},
             label: :optional,
             name: :on_commit,
             tag: 5,
             type: {:enum, PgQuery.OnCommitAction}
           }}
        end
      ),
      (
        def field_def(:table_space_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableSpaceName",
             kind: {:scalar, ""},
             label: :optional,
             name: :table_space_name,
             tag: 6,
             type: :string
           }}
        end

        def field_def("tableSpaceName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableSpaceName",
             kind: {:scalar, ""},
             label: :optional,
             name: :table_space_name,
             tag: 6,
             type: :string
           }}
        end

        def field_def("table_space_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableSpaceName",
             kind: {:scalar, ""},
             label: :optional,
             name: :table_space_name,
             tag: 6,
             type: :string
           }}
        end
      ),
      (
        def field_def(:view_query) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "viewQuery",
             kind: {:scalar, nil},
             label: :optional,
             name: :view_query,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("viewQuery") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "viewQuery",
             kind: {:scalar, nil},
             label: :optional,
             name: :view_query,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("view_query") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "viewQuery",
             kind: {:scalar, nil},
             label: :optional,
             name: :view_query,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:skip_data) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "skipData",
             kind: {:scalar, false},
             label: :optional,
             name: :skip_data,
             tag: 8,
             type: :bool
           }}
        end

        def field_def("skipData") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "skipData",
             kind: {:scalar, false},
             label: :optional,
             name: :skip_data,
             tag: 8,
             type: :bool
           }}
        end

        def field_def("skip_data") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "skipData",
             kind: {:scalar, false},
             label: :optional,
             name: :skip_data,
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
    def default(:rel) do
      {:ok, nil}
    end,
    def default(:col_names) do
      {:error, :no_default_value}
    end,
    def default(:access_method) do
      {:ok, ""}
    end,
    def default(:options) do
      {:error, :no_default_value}
    end,
    def default(:on_commit) do
      {:ok, :ON_COMMIT_ACTION_UNDEFINED}
    end,
    def default(:table_space_name) do
      {:ok, ""}
    end,
    def default(:view_query) do
      {:ok, nil}
    end,
    def default(:skip_data) do
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
