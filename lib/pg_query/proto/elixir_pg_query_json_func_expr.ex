# credo:disable-for-this-file
defmodule PgQuery.JsonFuncExpr do
  @moduledoc false
  defstruct op: :JSON_EXPR_OP_UNDEFINED,
            column_name: "",
            context_item: nil,
            pathspec: nil,
            passing: [],
            output: nil,
            on_empty: nil,
            on_error: nil,
            wrapper: :JSON_WRAPPER_UNDEFINED,
            quotes: :JSON_QUOTES_UNDEFINED,
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
        |> encode_op(msg)
        |> encode_column_name(msg)
        |> encode_context_item(msg)
        |> encode_pathspec(msg)
        |> encode_passing(msg)
        |> encode_output(msg)
        |> encode_on_empty(msg)
        |> encode_on_error(msg)
        |> encode_wrapper(msg)
        |> encode_quotes(msg)
        |> encode_location(msg)
      end
    )

    []

    [
      defp encode_op(acc, msg) do
        try do
          if msg.op == :JSON_EXPR_OP_UNDEFINED do
            acc
          else
            [acc, "\b", msg.op |> PgQuery.JsonExprOp.encode() |> Protox.Encode.encode_enum()]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:op, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_column_name(acc, msg) do
        try do
          if msg.column_name == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.column_name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:column_name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_context_item(acc, msg) do
        try do
          if msg.context_item == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.context_item)]
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
            [acc, "\"", Protox.Encode.encode_message(msg.pathspec)]
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
                  [acc, "*", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:passing, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_output(acc, msg) do
        try do
          if msg.output == nil do
            acc
          else
            [acc, "2", Protox.Encode.encode_message(msg.output)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:output, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_on_empty(acc, msg) do
        try do
          if msg.on_empty == nil do
            acc
          else
            [acc, ":", Protox.Encode.encode_message(msg.on_empty)]
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
            [acc, "B", Protox.Encode.encode_message(msg.on_error)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:on_error, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_wrapper(acc, msg) do
        try do
          if msg.wrapper == :JSON_WRAPPER_UNDEFINED do
            acc
          else
            [acc, "H", msg.wrapper |> PgQuery.JsonWrapper.encode() |> Protox.Encode.encode_enum()]
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
            [acc, "P", msg.quotes |> PgQuery.JsonQuotes.encode() |> Protox.Encode.encode_enum()]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:quotes, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.JsonFuncExpr))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.JsonExprOp)
              {[op: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[column_name: delimited], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 context_item:
                   Protox.MergeMessage.merge(
                     msg.context_item,
                     PgQuery.JsonValueExpr.decode!(delimited)
                   )
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 pathspec:
                   Protox.MergeMessage.merge(msg.pathspec, PgQuery.Node.decode!(delimited))
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[passing: msg.passing ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 output:
                   Protox.MergeMessage.merge(msg.output, PgQuery.JsonOutput.decode!(delimited))
               ], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 on_empty:
                   Protox.MergeMessage.merge(
                     msg.on_empty,
                     PgQuery.JsonBehavior.decode!(delimited)
                   )
               ], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 on_error:
                   Protox.MergeMessage.merge(
                     msg.on_error,
                     PgQuery.JsonBehavior.decode!(delimited)
                   )
               ], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.JsonWrapper)
              {[wrapper: value], rest}

            {10, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.JsonQuotes)
              {[quotes: value], rest}

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
        PgQuery.JsonFuncExpr,
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
        1 => {:op, {:scalar, :JSON_EXPR_OP_UNDEFINED}, {:enum, PgQuery.JsonExprOp}},
        2 => {:column_name, {:scalar, ""}, :string},
        3 => {:context_item, {:scalar, nil}, {:message, PgQuery.JsonValueExpr}},
        4 => {:pathspec, {:scalar, nil}, {:message, PgQuery.Node}},
        5 => {:passing, :unpacked, {:message, PgQuery.Node}},
        6 => {:output, {:scalar, nil}, {:message, PgQuery.JsonOutput}},
        7 => {:on_empty, {:scalar, nil}, {:message, PgQuery.JsonBehavior}},
        8 => {:on_error, {:scalar, nil}, {:message, PgQuery.JsonBehavior}},
        9 => {:wrapper, {:scalar, :JSON_WRAPPER_UNDEFINED}, {:enum, PgQuery.JsonWrapper}},
        10 => {:quotes, {:scalar, :JSON_QUOTES_UNDEFINED}, {:enum, PgQuery.JsonQuotes}},
        11 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        column_name: {2, {:scalar, ""}, :string},
        context_item: {3, {:scalar, nil}, {:message, PgQuery.JsonValueExpr}},
        location: {11, {:scalar, 0}, :int32},
        on_empty: {7, {:scalar, nil}, {:message, PgQuery.JsonBehavior}},
        on_error: {8, {:scalar, nil}, {:message, PgQuery.JsonBehavior}},
        op: {1, {:scalar, :JSON_EXPR_OP_UNDEFINED}, {:enum, PgQuery.JsonExprOp}},
        output: {6, {:scalar, nil}, {:message, PgQuery.JsonOutput}},
        passing: {5, :unpacked, {:message, PgQuery.Node}},
        pathspec: {4, {:scalar, nil}, {:message, PgQuery.Node}},
        quotes: {10, {:scalar, :JSON_QUOTES_UNDEFINED}, {:enum, PgQuery.JsonQuotes}},
        wrapper: {9, {:scalar, :JSON_WRAPPER_UNDEFINED}, {:enum, PgQuery.JsonWrapper}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "op",
          kind: {:scalar, :JSON_EXPR_OP_UNDEFINED},
          label: :optional,
          name: :op,
          tag: 1,
          type: {:enum, PgQuery.JsonExprOp}
        },
        %{
          __struct__: Protox.Field,
          json_name: "columnName",
          kind: {:scalar, ""},
          label: :optional,
          name: :column_name,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "contextItem",
          kind: {:scalar, nil},
          label: :optional,
          name: :context_item,
          tag: 3,
          type: {:message, PgQuery.JsonValueExpr}
        },
        %{
          __struct__: Protox.Field,
          json_name: "pathspec",
          kind: {:scalar, nil},
          label: :optional,
          name: :pathspec,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "passing",
          kind: :unpacked,
          label: :repeated,
          name: :passing,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "output",
          kind: {:scalar, nil},
          label: :optional,
          name: :output,
          tag: 6,
          type: {:message, PgQuery.JsonOutput}
        },
        %{
          __struct__: Protox.Field,
          json_name: "onEmpty",
          kind: {:scalar, nil},
          label: :optional,
          name: :on_empty,
          tag: 7,
          type: {:message, PgQuery.JsonBehavior}
        },
        %{
          __struct__: Protox.Field,
          json_name: "onError",
          kind: {:scalar, nil},
          label: :optional,
          name: :on_error,
          tag: 8,
          type: {:message, PgQuery.JsonBehavior}
        },
        %{
          __struct__: Protox.Field,
          json_name: "wrapper",
          kind: {:scalar, :JSON_WRAPPER_UNDEFINED},
          label: :optional,
          name: :wrapper,
          tag: 9,
          type: {:enum, PgQuery.JsonWrapper}
        },
        %{
          __struct__: Protox.Field,
          json_name: "quotes",
          kind: {:scalar, :JSON_QUOTES_UNDEFINED},
          label: :optional,
          name: :quotes,
          tag: 10,
          type: {:enum, PgQuery.JsonQuotes}
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
        def field_def(:op) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "op",
             kind: {:scalar, :JSON_EXPR_OP_UNDEFINED},
             label: :optional,
             name: :op,
             tag: 1,
             type: {:enum, PgQuery.JsonExprOp}
           }}
        end

        def field_def("op") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "op",
             kind: {:scalar, :JSON_EXPR_OP_UNDEFINED},
             label: :optional,
             name: :op,
             tag: 1,
             type: {:enum, PgQuery.JsonExprOp}
           }}
        end

        []
      ),
      (
        def field_def(:column_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columnName",
             kind: {:scalar, ""},
             label: :optional,
             name: :column_name,
             tag: 2,
             type: :string
           }}
        end

        def field_def("columnName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columnName",
             kind: {:scalar, ""},
             label: :optional,
             name: :column_name,
             tag: 2,
             type: :string
           }}
        end

        def field_def("column_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columnName",
             kind: {:scalar, ""},
             label: :optional,
             name: :column_name,
             tag: 2,
             type: :string
           }}
        end
      ),
      (
        def field_def(:context_item) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contextItem",
             kind: {:scalar, nil},
             label: :optional,
             name: :context_item,
             tag: 3,
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
             tag: 3,
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
             tag: 3,
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
             tag: 4,
             type: {:message, PgQuery.Node}
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
             type: {:message, PgQuery.Node}
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
             tag: 5,
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
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:output) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "output",
             kind: {:scalar, nil},
             label: :optional,
             name: :output,
             tag: 6,
             type: {:message, PgQuery.JsonOutput}
           }}
        end

        def field_def("output") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "output",
             kind: {:scalar, nil},
             label: :optional,
             name: :output,
             tag: 6,
             type: {:message, PgQuery.JsonOutput}
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
             tag: 7,
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
             tag: 7,
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
             tag: 7,
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
             tag: 8,
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
             tag: 8,
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
             tag: 8,
             type: {:message, PgQuery.JsonBehavior}
           }}
        end
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
             tag: 9,
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
             tag: 9,
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
             tag: 10,
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
             tag: 10,
             type: {:enum, PgQuery.JsonQuotes}
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
    def default(:op) do
      {:ok, :JSON_EXPR_OP_UNDEFINED}
    end,
    def default(:column_name) do
      {:ok, ""}
    end,
    def default(:context_item) do
      {:ok, nil}
    end,
    def default(:pathspec) do
      {:ok, nil}
    end,
    def default(:passing) do
      {:error, :no_default_value}
    end,
    def default(:output) do
      {:ok, nil}
    end,
    def default(:on_empty) do
      {:ok, nil}
    end,
    def default(:on_error) do
      {:ok, nil}
    end,
    def default(:wrapper) do
      {:ok, :JSON_WRAPPER_UNDEFINED}
    end,
    def default(:quotes) do
      {:ok, :JSON_QUOTES_UNDEFINED}
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
