# credo:disable-for-this-file
defmodule PgQuery.JsonTable do
  @moduledoc false
  defstruct context_item: nil,
            pathspec: nil,
            passing: [],
            columns: [],
            on_error: nil,
            alias: nil,
            lateral: false,
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
        |> encode_context_item(msg)
        |> encode_pathspec(msg)
        |> encode_passing(msg)
        |> encode_columns(msg)
        |> encode_on_error(msg)
        |> encode_alias(msg)
        |> encode_lateral(msg)
        |> encode_location(msg)
      end
    )

    []

    [
      defp encode_context_item(acc, msg) do
        try do
          if msg.context_item == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.context_item)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:context_item, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_pathspec(acc, msg) do
        try do
          if msg.pathspec == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.pathspec)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:pathspec, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_passing(acc, msg) do
        try do
          case msg.passing do
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
            reraise Protox.EncodingError.new(:passing, "invalid field value"), __STACKTRACE__
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
                  [acc, "\"", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:columns, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_on_error(acc, msg) do
        try do
          if msg.on_error == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.on_error)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:on_error, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_alias(acc, msg) do
        try do
          if msg.alias == nil do
            acc
          else
            [acc, "2", Protox.Encode.encode_message(msg.alias)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alias, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_lateral(acc, msg) do
        try do
          if msg.lateral == false do
            acc
          else
            [acc, "8", Protox.Encode.encode_bool(msg.lateral)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:lateral, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "@", Protox.Encode.encode_int32(msg.location)]
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
          parse_key_value(bytes, struct(PgQuery.JsonTable))
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
                 context_item:
                   Protox.MergeMessage.merge(
                     msg.context_item,
                     PgQuery.JsonValueExpr.decode!(delimited)
                   )
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 pathspec:
                   Protox.MergeMessage.merge(
                     msg.pathspec,
                     PgQuery.JsonTablePathSpec.decode!(delimited)
                   )
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[passing: msg.passing ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[columns: msg.columns ++ [PgQuery.Node.decode!(delimited)]], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 on_error:
                   Protox.MergeMessage.merge(
                     msg.on_error,
                     PgQuery.JsonBehavior.decode!(delimited)
                   )
               ], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[alias: Protox.MergeMessage.merge(msg.alias, PgQuery.Alias.decode!(delimited))],
               rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[lateral: value], rest}

            {8, _, bytes} ->
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
        PgQuery.JsonTable,
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
        1 => {:context_item, {:scalar, nil}, {:message, PgQuery.JsonValueExpr}},
        2 => {:pathspec, {:scalar, nil}, {:message, PgQuery.JsonTablePathSpec}},
        3 => {:passing, :unpacked, {:message, PgQuery.Node}},
        4 => {:columns, :unpacked, {:message, PgQuery.Node}},
        5 => {:on_error, {:scalar, nil}, {:message, PgQuery.JsonBehavior}},
        6 => {:alias, {:scalar, nil}, {:message, PgQuery.Alias}},
        7 => {:lateral, {:scalar, false}, :bool},
        8 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        alias: {6, {:scalar, nil}, {:message, PgQuery.Alias}},
        columns: {4, :unpacked, {:message, PgQuery.Node}},
        context_item: {1, {:scalar, nil}, {:message, PgQuery.JsonValueExpr}},
        lateral: {7, {:scalar, false}, :bool},
        location: {8, {:scalar, 0}, :int32},
        on_error: {5, {:scalar, nil}, {:message, PgQuery.JsonBehavior}},
        passing: {3, :unpacked, {:message, PgQuery.Node}},
        pathspec: {2, {:scalar, nil}, {:message, PgQuery.JsonTablePathSpec}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "contextItem",
          kind: {:scalar, nil},
          label: :optional,
          name: :context_item,
          tag: 1,
          type: {:message, PgQuery.JsonValueExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "pathspec",
          kind: {:scalar, nil},
          label: :optional,
          name: :pathspec,
          tag: 2,
          type: {:message, PgQuery.JsonTablePathSpec}
        },
        %{
          __struct__: Protox.Field,
          json_name: "passing",
          kind: :unpacked,
          label: :repeated,
          name: :passing,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "columns",
          kind: :unpacked,
          label: :repeated,
          name: :columns,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "onError",
          kind: {:scalar, nil},
          label: :optional,
          name: :on_error,
          tag: 5,
          type: {:message, PgQuery.JsonBehavior}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alias",
          kind: {:scalar, nil},
          label: :optional,
          name: :alias,
          tag: 6,
          type: {:message, PgQuery.Alias}
        },
        %{
          __struct__: Protox.Field,
          json_name: "lateral",
          kind: {:scalar, false},
          label: :optional,
          name: :lateral,
          tag: 7,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 8,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:context_item) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contextItem",
             kind: {:scalar, nil},
             label: :optional,
             name: :context_item,
             tag: 1,
             type: {:message, PgQuery.JsonValueExpr}
           }}
        end

        def field_def("contextItem") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contextItem",
             kind: {:scalar, nil},
             label: :optional,
             name: :context_item,
             tag: 1,
             type: {:message, PgQuery.JsonValueExpr}
           }}
        end

        def field_def("context_item") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contextItem",
             kind: {:scalar, nil},
             label: :optional,
             name: :context_item,
             tag: 1,
             type: {:message, PgQuery.JsonValueExpr}
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
             tag: 2,
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
             tag: 2,
             type: {:message, PgQuery.JsonTablePathSpec}
           }}
        end

        []
      ),
      (
        def field_def(:passing) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "passing",
             kind: :unpacked,
             label: :repeated,
             name: :passing,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("passing") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "passing",
             kind: :unpacked,
             label: :repeated,
             name: :passing,
             tag: 3,
             type: {:message, PgQuery.Node}
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
             tag: 4,
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
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        []
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
             tag: 5,
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
             tag: 5,
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
             tag: 5,
             type: {:message, PgQuery.JsonBehavior}
           }}
        end
      ),
      (
        def field_def(:alias) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alias",
             kind: {:scalar, nil},
             label: :optional,
             name: :alias,
             tag: 6,
             type: {:message, PgQuery.Alias}
           }}
        end

        def field_def("alias") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alias",
             kind: {:scalar, nil},
             label: :optional,
             name: :alias,
             tag: 6,
             type: {:message, PgQuery.Alias}
           }}
        end

        []
      ),
      (
        def field_def(:lateral) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lateral",
             kind: {:scalar, false},
             label: :optional,
             name: :lateral,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("lateral") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lateral",
             kind: {:scalar, false},
             label: :optional,
             name: :lateral,
             tag: 7,
             type: :bool
           }}
        end

        []
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
             tag: 8,
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
             tag: 8,
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
    def default(:context_item) do
      {:ok, nil}
    end,
    def default(:pathspec) do
      {:ok, nil}
    end,
    def default(:passing) do
      {:error, :no_default_value}
    end,
    def default(:columns) do
      {:error, :no_default_value}
    end,
    def default(:on_error) do
      {:ok, nil}
    end,
    def default(:alias) do
      {:ok, nil}
    end,
    def default(:lateral) do
      {:ok, false}
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
