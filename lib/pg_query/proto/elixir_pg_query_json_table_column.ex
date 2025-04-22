# credo:disable-for-this-file
defmodule PgQuery.JsonTableColumn do
  @moduledoc false
  defstruct coltype: :JSON_TABLE_COLUMN_TYPE_UNDEFINED,
            name: "",
            type_name: nil,
            pathspec: nil,
            format: nil,
            wrapper: :JSON_WRAPPER_UNDEFINED,
            quotes: :JSON_QUOTES_UNDEFINED,
            columns: [],
            on_empty: nil,
            on_error: nil,
            location: 0

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
        |> encode_coltype(msg)
        |> encode_name(msg)
        |> encode_type_name(msg)
        |> encode_pathspec(msg)
        |> encode_format(msg)
        |> encode_wrapper(msg)
        |> encode_quotes(msg)
        |> encode_columns(msg)
        |> encode_on_empty(msg)
        |> encode_on_error(msg)
        |> encode_location(msg)
      end
    )

    []

    [
      defp encode_coltype(acc, msg) do
        try do
          if msg.coltype == :JSON_TABLE_COLUMN_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "\b",
              msg.coltype |> PgQuery.JsonTableColumnType.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:coltype, "invalid field value"), __STACKTRACE__
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
      defp encode_type_name(acc, msg) do
        try do
          if msg.type_name == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.type_name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:type_name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_pathspec(acc, msg) do
        try do
          if msg.pathspec == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.pathspec)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:pathspec, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_format(acc, msg) do
        try do
          if msg.format == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.format)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:format, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_wrapper(acc, msg) do
        try do
          if msg.wrapper == :JSON_WRAPPER_UNDEFINED do
            acc
          else
            [acc, "0", msg.wrapper |> PgQuery.JsonWrapper.encode() |> Protox.Encode.encode_enum()]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:wrapper, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_quotes(acc, msg) do
        try do
          if msg.quotes == :JSON_QUOTES_UNDEFINED do
            acc
          else
            [acc, "8", msg.quotes |> PgQuery.JsonQuotes.encode() |> Protox.Encode.encode_enum()]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:quotes, "invalid field value"), __STACKTRACE__
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
                  [acc, "B", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:columns, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_on_empty(acc, msg) do
        try do
          if msg.on_empty == nil do
            acc
          else
            [acc, "J", Protox.Encode.encode_message(msg.on_empty)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:on_empty, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_on_error(acc, msg) do
        try do
          if msg.on_error == nil do
            acc
          else
            [acc, "R", Protox.Encode.encode_message(msg.on_error)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:on_error, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "X", Protox.Encode.encode_int32(msg.location)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:location, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.JsonTableColumn))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.JsonTableColumnType)
              {[coltype: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[name: delimited], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 type_name:
                   Protox.MergeMessage.merge(msg.type_name, PgQuery.TypeName.decode!(delimited))
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 pathspec:
                   Protox.MergeMessage.merge(
                     msg.pathspec,
                     PgQuery.JsonTablePathSpec.decode!(delimited)
                   )
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 format:
                   Protox.MergeMessage.merge(msg.format, PgQuery.JsonFormat.decode!(delimited))
               ], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.JsonWrapper)
              {[wrapper: value], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.JsonQuotes)
              {[quotes: value], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[columns: msg.columns ++ [PgQuery.Node.decode!(delimited)]], rest}

            {9, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 on_empty:
                   Protox.MergeMessage.merge(
                     msg.on_empty,
                     PgQuery.JsonBehavior.decode!(delimited)
                   )
               ], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 on_error:
                   Protox.MergeMessage.merge(
                     msg.on_error,
                     PgQuery.JsonBehavior.decode!(delimited)
                   )
               ], rest}

            {11, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[location: value], rest}

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
        PgQuery.JsonTableColumn,
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
          {:coltype, {:scalar, :JSON_TABLE_COLUMN_TYPE_UNDEFINED},
           {:enum, PgQuery.JsonTableColumnType}},
        2 => {:name, {:scalar, ""}, :string},
        3 => {:type_name, {:scalar, nil}, {:message, PgQuery.TypeName}},
        4 => {:pathspec, {:scalar, nil}, {:message, PgQuery.JsonTablePathSpec}},
        5 => {:format, {:scalar, nil}, {:message, PgQuery.JsonFormat}},
        6 => {:wrapper, {:scalar, :JSON_WRAPPER_UNDEFINED}, {:enum, PgQuery.JsonWrapper}},
        7 => {:quotes, {:scalar, :JSON_QUOTES_UNDEFINED}, {:enum, PgQuery.JsonQuotes}},
        8 => {:columns, :unpacked, {:message, PgQuery.Node}},
        9 => {:on_empty, {:scalar, nil}, {:message, PgQuery.JsonBehavior}},
        10 => {:on_error, {:scalar, nil}, {:message, PgQuery.JsonBehavior}},
        11 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        coltype:
          {1, {:scalar, :JSON_TABLE_COLUMN_TYPE_UNDEFINED}, {:enum, PgQuery.JsonTableColumnType}},
        columns: {8, :unpacked, {:message, PgQuery.Node}},
        format: {5, {:scalar, nil}, {:message, PgQuery.JsonFormat}},
        location: {11, {:scalar, 0}, :int32},
        name: {2, {:scalar, ""}, :string},
        on_empty: {9, {:scalar, nil}, {:message, PgQuery.JsonBehavior}},
        on_error: {10, {:scalar, nil}, {:message, PgQuery.JsonBehavior}},
        pathspec: {4, {:scalar, nil}, {:message, PgQuery.JsonTablePathSpec}},
        quotes: {7, {:scalar, :JSON_QUOTES_UNDEFINED}, {:enum, PgQuery.JsonQuotes}},
        type_name: {3, {:scalar, nil}, {:message, PgQuery.TypeName}},
        wrapper: {6, {:scalar, :JSON_WRAPPER_UNDEFINED}, {:enum, PgQuery.JsonWrapper}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "coltype",
          kind: {:scalar, :JSON_TABLE_COLUMN_TYPE_UNDEFINED},
          label: :optional,
          name: :coltype,
          tag: 1,
          type: {:enum, PgQuery.JsonTableColumnType}
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
          json_name: "typeName",
          kind: {:scalar, nil},
          label: :optional,
          name: :type_name,
          tag: 3,
          type: {:message, PgQuery.TypeName}
        },
        %{
          __struct__: Protox.Field,
          json_name: "pathspec",
          kind: {:scalar, nil},
          label: :optional,
          name: :pathspec,
          tag: 4,
          type: {:message, PgQuery.JsonTablePathSpec}
        },
        %{
          __struct__: Protox.Field,
          json_name: "format",
          kind: {:scalar, nil},
          label: :optional,
          name: :format,
          tag: 5,
          type: {:message, PgQuery.JsonFormat}
        },
        %{
          __struct__: Protox.Field,
          json_name: "wrapper",
          kind: {:scalar, :JSON_WRAPPER_UNDEFINED},
          label: :optional,
          name: :wrapper,
          tag: 6,
          type: {:enum, PgQuery.JsonWrapper}
        },
        %{
          __struct__: Protox.Field,
          json_name: "quotes",
          kind: {:scalar, :JSON_QUOTES_UNDEFINED},
          label: :optional,
          name: :quotes,
          tag: 7,
          type: {:enum, PgQuery.JsonQuotes}
        },
        %{
          __struct__: Protox.Field,
          json_name: "columns",
          kind: :unpacked,
          label: :repeated,
          name: :columns,
          tag: 8,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "onEmpty",
          kind: {:scalar, nil},
          label: :optional,
          name: :on_empty,
          tag: 9,
          type: {:message, PgQuery.JsonBehavior}
        },
        %{
          __struct__: Protox.Field,
          json_name: "onError",
          kind: {:scalar, nil},
          label: :optional,
          name: :on_error,
          tag: 10,
          type: {:message, PgQuery.JsonBehavior}
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 11,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:coltype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coltype",
             kind: {:scalar, :JSON_TABLE_COLUMN_TYPE_UNDEFINED},
             label: :optional,
             name: :coltype,
             tag: 1,
             type: {:enum, PgQuery.JsonTableColumnType}
           }}
        end

        def field_def("coltype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "coltype",
             kind: {:scalar, :JSON_TABLE_COLUMN_TYPE_UNDEFINED},
             label: :optional,
             name: :coltype,
             tag: 1,
             type: {:enum, PgQuery.JsonTableColumnType}
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
        def field_def(:type_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeName",
             kind: {:scalar, nil},
             label: :optional,
             name: :type_name,
             tag: 3,
             type: {:message, PgQuery.TypeName}
           }}
        end

        def field_def("typeName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeName",
             kind: {:scalar, nil},
             label: :optional,
             name: :type_name,
             tag: 3,
             type: {:message, PgQuery.TypeName}
           }}
        end

        def field_def("type_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeName",
             kind: {:scalar, nil},
             label: :optional,
             name: :type_name,
             tag: 3,
             type: {:message, PgQuery.TypeName}
           }}
        end
      ),
      (
        def field_def(:pathspec) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pathspec",
             kind: {:scalar, nil},
             label: :optional,
             name: :pathspec,
             tag: 4,
             type: {:message, PgQuery.JsonTablePathSpec}
           }}
        end

        def field_def("pathspec") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pathspec",
             kind: {:scalar, nil},
             label: :optional,
             name: :pathspec,
             tag: 4,
             type: {:message, PgQuery.JsonTablePathSpec}
           }}
        end

        []
      ),
      (
        def field_def(:format) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "format",
             kind: {:scalar, nil},
             label: :optional,
             name: :format,
             tag: 5,
             type: {:message, PgQuery.JsonFormat}
           }}
        end

        def field_def("format") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "format",
             kind: {:scalar, nil},
             label: :optional,
             name: :format,
             tag: 5,
             type: {:message, PgQuery.JsonFormat}
           }}
        end

        []
      ),
      (
        def field_def(:wrapper) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "wrapper",
             kind: {:scalar, :JSON_WRAPPER_UNDEFINED},
             label: :optional,
             name: :wrapper,
             tag: 6,
             type: {:enum, PgQuery.JsonWrapper}
           }}
        end

        def field_def("wrapper") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "wrapper",
             kind: {:scalar, :JSON_WRAPPER_UNDEFINED},
             label: :optional,
             name: :wrapper,
             tag: 6,
             type: {:enum, PgQuery.JsonWrapper}
           }}
        end

        []
      ),
      (
        def field_def(:quotes) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "quotes",
             kind: {:scalar, :JSON_QUOTES_UNDEFINED},
             label: :optional,
             name: :quotes,
             tag: 7,
             type: {:enum, PgQuery.JsonQuotes}
           }}
        end

        def field_def("quotes") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "quotes",
             kind: {:scalar, :JSON_QUOTES_UNDEFINED},
             label: :optional,
             name: :quotes,
             tag: 7,
             type: {:enum, PgQuery.JsonQuotes}
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
             tag: 8,
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
             tag: 8,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:on_empty) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onEmpty",
             kind: {:scalar, nil},
             label: :optional,
             name: :on_empty,
             tag: 9,
             type: {:message, PgQuery.JsonBehavior}
           }}
        end

        def field_def("onEmpty") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onEmpty",
             kind: {:scalar, nil},
             label: :optional,
             name: :on_empty,
             tag: 9,
             type: {:message, PgQuery.JsonBehavior}
           }}
        end

        def field_def("on_empty") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onEmpty",
             kind: {:scalar, nil},
             label: :optional,
             name: :on_empty,
             tag: 9,
             type: {:message, PgQuery.JsonBehavior}
           }}
        end
      ),
      (
        def field_def(:on_error) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onError",
             kind: {:scalar, nil},
             label: :optional,
             name: :on_error,
             tag: 10,
             type: {:message, PgQuery.JsonBehavior}
           }}
        end

        def field_def("onError") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onError",
             kind: {:scalar, nil},
             label: :optional,
             name: :on_error,
             tag: 10,
             type: {:message, PgQuery.JsonBehavior}
           }}
        end

        def field_def("on_error") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "onError",
             kind: {:scalar, nil},
             label: :optional,
             name: :on_error,
             tag: 10,
             type: {:message, PgQuery.JsonBehavior}
           }}
        end
      ),
      (
        def field_def(:location) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "location",
             kind: {:scalar, 0},
             label: :optional,
             name: :location,
             tag: 11,
             type: :int32
           }}
        end

        def field_def("location") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "location",
             kind: {:scalar, 0},
             label: :optional,
             name: :location,
             tag: 11,
             type: :int32
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
    def default(:coltype) do
      {:ok, :JSON_TABLE_COLUMN_TYPE_UNDEFINED}
    end,
    def default(:name) do
      {:ok, ""}
    end,
    def default(:type_name) do
      {:ok, nil}
    end,
    def default(:pathspec) do
      {:ok, nil}
    end,
    def default(:format) do
      {:ok, nil}
    end,
    def default(:wrapper) do
      {:ok, :JSON_WRAPPER_UNDEFINED}
    end,
    def default(:quotes) do
      {:ok, :JSON_QUOTES_UNDEFINED}
    end,
    def default(:columns) do
      {:error, :no_default_value}
    end,
    def default(:on_empty) do
      {:ok, nil}
    end,
    def default(:on_error) do
      {:ok, nil}
    end,
    def default(:location) do
      {:ok, 0}
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
