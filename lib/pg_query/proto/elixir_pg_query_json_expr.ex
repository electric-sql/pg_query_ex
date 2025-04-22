# credo:disable-for-this-file
defmodule PgQuery.JsonExpr do
  @moduledoc false
  defstruct xpr: nil,
            op: :JSON_EXPR_OP_UNDEFINED,
            column_name: "",
            formatted_expr: nil,
            format: nil,
            path_spec: nil,
            returning: nil,
            passing_names: [],
            passing_values: [],
            on_empty: nil,
            on_error: nil,
            use_io_coercion: false,
            use_json_coercion: false,
            wrapper: :JSON_WRAPPER_UNDEFINED,
            omit_quotes: false,
            collation: 0,
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
        |> encode_xpr(msg)
        |> encode_op(msg)
        |> encode_column_name(msg)
        |> encode_formatted_expr(msg)
        |> encode_format(msg)
        |> encode_path_spec(msg)
        |> encode_returning(msg)
        |> encode_passing_names(msg)
        |> encode_passing_values(msg)
        |> encode_on_empty(msg)
        |> encode_on_error(msg)
        |> encode_use_io_coercion(msg)
        |> encode_use_json_coercion(msg)
        |> encode_wrapper(msg)
        |> encode_omit_quotes(msg)
        |> encode_collation(msg)
        |> encode_location(msg)
      end
    )

    []

    [
      defp encode_xpr(acc, msg) do
        try do
          if msg.xpr == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.xpr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:xpr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_op(acc, msg) do
        try do
          if msg.op == :JSON_EXPR_OP_UNDEFINED do
            acc
          else
            [acc, "\x10", msg.op |> PgQuery.JsonExprOp.encode() |> Protox.Encode.encode_enum()]
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
            [acc, "\x1A", Protox.Encode.encode_string(msg.column_name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:column_name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_formatted_expr(acc, msg) do
        try do
          if msg.formatted_expr == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.formatted_expr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:formatted_expr, "invalid field value"),
                    __STACKTRACE__
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
      defp encode_path_spec(acc, msg) do
        try do
          if msg.path_spec == nil do
            acc
          else
            [acc, "2", Protox.Encode.encode_message(msg.path_spec)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:path_spec, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_returning(acc, msg) do
        try do
          if msg.returning == nil do
            acc
          else
            [acc, ":", Protox.Encode.encode_message(msg.returning)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:returning, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_passing_names(acc, msg) do
        try do
          case msg.passing_names do
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
            reraise Protox.EncodingError.new(:passing_names, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_passing_values(acc, msg) do
        try do
          case msg.passing_values do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "J", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:passing_values, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_on_empty(acc, msg) do
        try do
          if msg.on_empty == nil do
            acc
          else
            [acc, "R", Protox.Encode.encode_message(msg.on_empty)]
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
            [acc, "Z", Protox.Encode.encode_message(msg.on_error)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:on_error, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_use_io_coercion(acc, msg) do
        try do
          if msg.use_io_coercion == false do
            acc
          else
            [acc, "`", Protox.Encode.encode_bool(msg.use_io_coercion)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:use_io_coercion, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_use_json_coercion(acc, msg) do
        try do
          if msg.use_json_coercion == false do
            acc
          else
            [acc, "h", Protox.Encode.encode_bool(msg.use_json_coercion)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:use_json_coercion, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_wrapper(acc, msg) do
        try do
          if msg.wrapper == :JSON_WRAPPER_UNDEFINED do
            acc
          else
            [acc, "p", msg.wrapper |> PgQuery.JsonWrapper.encode() |> Protox.Encode.encode_enum()]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:wrapper, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_omit_quotes(acc, msg) do
        try do
          if msg.omit_quotes == false do
            acc
          else
            [acc, "x", Protox.Encode.encode_bool(msg.omit_quotes)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:omit_quotes, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_collation(acc, msg) do
        try do
          if msg.collation == 0 do
            acc
          else
            [acc, "\x80\x01", Protox.Encode.encode_uint32(msg.collation)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:collation, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "\x88\x01", Protox.Encode.encode_int32(msg.location)]
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
          parse_key_value(bytes, struct(PgQuery.JsonExpr))
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
              {[xpr: Protox.MergeMessage.merge(msg.xpr, PgQuery.Node.decode!(delimited))], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.JsonExprOp)
              {[op: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[column_name: delimited], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 formatted_expr:
                   Protox.MergeMessage.merge(msg.formatted_expr, PgQuery.Node.decode!(delimited))
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 format:
                   Protox.MergeMessage.merge(msg.format, PgQuery.JsonFormat.decode!(delimited))
               ], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 path_spec:
                   Protox.MergeMessage.merge(msg.path_spec, PgQuery.Node.decode!(delimited))
               ], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 returning:
                   Protox.MergeMessage.merge(
                     msg.returning,
                     PgQuery.JsonReturning.decode!(delimited)
                   )
               ], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[passing_names: msg.passing_names ++ [PgQuery.Node.decode!(delimited)]], rest}

            {9, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[passing_values: msg.passing_values ++ [PgQuery.Node.decode!(delimited)]], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 on_empty:
                   Protox.MergeMessage.merge(
                     msg.on_empty,
                     PgQuery.JsonBehavior.decode!(delimited)
                   )
               ], rest}

            {11, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 on_error:
                   Protox.MergeMessage.merge(
                     msg.on_error,
                     PgQuery.JsonBehavior.decode!(delimited)
                   )
               ], rest}

            {12, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[use_io_coercion: value], rest}

            {13, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[use_json_coercion: value], rest}

            {14, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.JsonWrapper)
              {[wrapper: value], rest}

            {15, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[omit_quotes: value], rest}

            {16, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[collation: value], rest}

            {17, _, bytes} ->
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
        PgQuery.JsonExpr,
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
        1 => {:xpr, {:scalar, nil}, {:message, PgQuery.Node}},
        2 => {:op, {:scalar, :JSON_EXPR_OP_UNDEFINED}, {:enum, PgQuery.JsonExprOp}},
        3 => {:column_name, {:scalar, ""}, :string},
        4 => {:formatted_expr, {:scalar, nil}, {:message, PgQuery.Node}},
        5 => {:format, {:scalar, nil}, {:message, PgQuery.JsonFormat}},
        6 => {:path_spec, {:scalar, nil}, {:message, PgQuery.Node}},
        7 => {:returning, {:scalar, nil}, {:message, PgQuery.JsonReturning}},
        8 => {:passing_names, :unpacked, {:message, PgQuery.Node}},
        9 => {:passing_values, :unpacked, {:message, PgQuery.Node}},
        10 => {:on_empty, {:scalar, nil}, {:message, PgQuery.JsonBehavior}},
        11 => {:on_error, {:scalar, nil}, {:message, PgQuery.JsonBehavior}},
        12 => {:use_io_coercion, {:scalar, false}, :bool},
        13 => {:use_json_coercion, {:scalar, false}, :bool},
        14 => {:wrapper, {:scalar, :JSON_WRAPPER_UNDEFINED}, {:enum, PgQuery.JsonWrapper}},
        15 => {:omit_quotes, {:scalar, false}, :bool},
        16 => {:collation, {:scalar, 0}, :uint32},
        17 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        collation: {16, {:scalar, 0}, :uint32},
        column_name: {3, {:scalar, ""}, :string},
        format: {5, {:scalar, nil}, {:message, PgQuery.JsonFormat}},
        formatted_expr: {4, {:scalar, nil}, {:message, PgQuery.Node}},
        location: {17, {:scalar, 0}, :int32},
        omit_quotes: {15, {:scalar, false}, :bool},
        on_empty: {10, {:scalar, nil}, {:message, PgQuery.JsonBehavior}},
        on_error: {11, {:scalar, nil}, {:message, PgQuery.JsonBehavior}},
        op: {2, {:scalar, :JSON_EXPR_OP_UNDEFINED}, {:enum, PgQuery.JsonExprOp}},
        passing_names: {8, :unpacked, {:message, PgQuery.Node}},
        passing_values: {9, :unpacked, {:message, PgQuery.Node}},
        path_spec: {6, {:scalar, nil}, {:message, PgQuery.Node}},
        returning: {7, {:scalar, nil}, {:message, PgQuery.JsonReturning}},
        use_io_coercion: {12, {:scalar, false}, :bool},
        use_json_coercion: {13, {:scalar, false}, :bool},
        wrapper: {14, {:scalar, :JSON_WRAPPER_UNDEFINED}, {:enum, PgQuery.JsonWrapper}},
        xpr: {1, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "xpr",
          kind: {:scalar, nil},
          label: :optional,
          name: :xpr,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "op",
          kind: {:scalar, :JSON_EXPR_OP_UNDEFINED},
          label: :optional,
          name: :op,
          tag: 2,
          type: {:enum, PgQuery.JsonExprOp}
        },
        %{
          __struct__: Protox.Field,
          json_name: "columnName",
          kind: {:scalar, ""},
          label: :optional,
          name: :column_name,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "formattedExpr",
          kind: {:scalar, nil},
          label: :optional,
          name: :formatted_expr,
          tag: 4,
          type: {:message, PgQuery.Node}
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
          json_name: "pathSpec",
          kind: {:scalar, nil},
          label: :optional,
          name: :path_spec,
          tag: 6,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "returning",
          kind: {:scalar, nil},
          label: :optional,
          name: :returning,
          tag: 7,
          type: {:message, PgQuery.JsonReturning}
        },
        %{
          __struct__: Protox.Field,
          json_name: "passingNames",
          kind: :unpacked,
          label: :repeated,
          name: :passing_names,
          tag: 8,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "passingValues",
          kind: :unpacked,
          label: :repeated,
          name: :passing_values,
          tag: 9,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "onEmpty",
          kind: {:scalar, nil},
          label: :optional,
          name: :on_empty,
          tag: 10,
          type: {:message, PgQuery.JsonBehavior}
        },
        %{
          __struct__: Protox.Field,
          json_name: "onError",
          kind: {:scalar, nil},
          label: :optional,
          name: :on_error,
          tag: 11,
          type: {:message, PgQuery.JsonBehavior}
        },
        %{
          __struct__: Protox.Field,
          json_name: "useIoCoercion",
          kind: {:scalar, false},
          label: :optional,
          name: :use_io_coercion,
          tag: 12,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "useJsonCoercion",
          kind: {:scalar, false},
          label: :optional,
          name: :use_json_coercion,
          tag: 13,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "wrapper",
          kind: {:scalar, :JSON_WRAPPER_UNDEFINED},
          label: :optional,
          name: :wrapper,
          tag: 14,
          type: {:enum, PgQuery.JsonWrapper}
        },
        %{
          __struct__: Protox.Field,
          json_name: "omitQuotes",
          kind: {:scalar, false},
          label: :optional,
          name: :omit_quotes,
          tag: 15,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "collation",
          kind: {:scalar, 0},
          label: :optional,
          name: :collation,
          tag: 16,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 17,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:xpr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :xpr,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("xpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :xpr,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:op) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "op",
             kind: {:scalar, :JSON_EXPR_OP_UNDEFINED},
             label: :optional,
             name: :op,
             tag: 2,
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
             tag: 2,
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
             tag: 3,
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
             tag: 3,
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
             tag: 3,
             type: :string
           }}
        end
      ),
      (
        def field_def(:formatted_expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "formattedExpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :formatted_expr,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("formattedExpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "formattedExpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :formatted_expr,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("formatted_expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "formattedExpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :formatted_expr,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end
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
        def field_def(:path_spec) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pathSpec",
             kind: {:scalar, nil},
             label: :optional,
             name: :path_spec,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("pathSpec") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pathSpec",
             kind: {:scalar, nil},
             label: :optional,
             name: :path_spec,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("path_spec") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pathSpec",
             kind: {:scalar, nil},
             label: :optional,
             name: :path_spec,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:returning) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returning",
             kind: {:scalar, nil},
             label: :optional,
             name: :returning,
             tag: 7,
             type: {:message, PgQuery.JsonReturning}
           }}
        end

        def field_def("returning") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returning",
             kind: {:scalar, nil},
             label: :optional,
             name: :returning,
             tag: 7,
             type: {:message, PgQuery.JsonReturning}
           }}
        end

        []
      ),
      (
        def field_def(:passing_names) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "passingNames",
             kind: :unpacked,
             label: :repeated,
             name: :passing_names,
             tag: 8,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("passingNames") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "passingNames",
             kind: :unpacked,
             label: :repeated,
             name: :passing_names,
             tag: 8,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("passing_names") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "passingNames",
             kind: :unpacked,
             label: :repeated,
             name: :passing_names,
             tag: 8,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:passing_values) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "passingValues",
             kind: :unpacked,
             label: :repeated,
             name: :passing_values,
             tag: 9,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("passingValues") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "passingValues",
             kind: :unpacked,
             label: :repeated,
             name: :passing_values,
             tag: 9,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("passing_values") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "passingValues",
             kind: :unpacked,
             label: :repeated,
             name: :passing_values,
             tag: 9,
             type: {:message, PgQuery.Node}
           }}
        end
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
             tag: 10,
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
             tag: 10,
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
             tag: 10,
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
             tag: 11,
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
             tag: 11,
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
             tag: 11,
             type: {:message, PgQuery.JsonBehavior}
           }}
        end
      ),
      (
        def field_def(:use_io_coercion) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "useIoCoercion",
             kind: {:scalar, false},
             label: :optional,
             name: :use_io_coercion,
             tag: 12,
             type: :bool
           }}
        end

        def field_def("useIoCoercion") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "useIoCoercion",
             kind: {:scalar, false},
             label: :optional,
             name: :use_io_coercion,
             tag: 12,
             type: :bool
           }}
        end

        def field_def("use_io_coercion") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "useIoCoercion",
             kind: {:scalar, false},
             label: :optional,
             name: :use_io_coercion,
             tag: 12,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:use_json_coercion) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "useJsonCoercion",
             kind: {:scalar, false},
             label: :optional,
             name: :use_json_coercion,
             tag: 13,
             type: :bool
           }}
        end

        def field_def("useJsonCoercion") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "useJsonCoercion",
             kind: {:scalar, false},
             label: :optional,
             name: :use_json_coercion,
             tag: 13,
             type: :bool
           }}
        end

        def field_def("use_json_coercion") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "useJsonCoercion",
             kind: {:scalar, false},
             label: :optional,
             name: :use_json_coercion,
             tag: 13,
             type: :bool
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
             tag: 14,
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
             tag: 14,
             type: {:enum, PgQuery.JsonWrapper}
           }}
        end

        []
      ),
      (
        def field_def(:omit_quotes) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "omitQuotes",
             kind: {:scalar, false},
             label: :optional,
             name: :omit_quotes,
             tag: 15,
             type: :bool
           }}
        end

        def field_def("omitQuotes") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "omitQuotes",
             kind: {:scalar, false},
             label: :optional,
             name: :omit_quotes,
             tag: 15,
             type: :bool
           }}
        end

        def field_def("omit_quotes") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "omitQuotes",
             kind: {:scalar, false},
             label: :optional,
             name: :omit_quotes,
             tag: 15,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:collation) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collation",
             kind: {:scalar, 0},
             label: :optional,
             name: :collation,
             tag: 16,
             type: :uint32
           }}
        end

        def field_def("collation") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collation",
             kind: {:scalar, 0},
             label: :optional,
             name: :collation,
             tag: 16,
             type: :uint32
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
             tag: 17,
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
             tag: 17,
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
    def default(:xpr) do
      {:ok, nil}
    end,
    def default(:op) do
      {:ok, :JSON_EXPR_OP_UNDEFINED}
    end,
    def default(:column_name) do
      {:ok, ""}
    end,
    def default(:formatted_expr) do
      {:ok, nil}
    end,
    def default(:format) do
      {:ok, nil}
    end,
    def default(:path_spec) do
      {:ok, nil}
    end,
    def default(:returning) do
      {:ok, nil}
    end,
    def default(:passing_names) do
      {:error, :no_default_value}
    end,
    def default(:passing_values) do
      {:error, :no_default_value}
    end,
    def default(:on_empty) do
      {:ok, nil}
    end,
    def default(:on_error) do
      {:ok, nil}
    end,
    def default(:use_io_coercion) do
      {:ok, false}
    end,
    def default(:use_json_coercion) do
      {:ok, false}
    end,
    def default(:wrapper) do
      {:ok, :JSON_WRAPPER_UNDEFINED}
    end,
    def default(:omit_quotes) do
      {:ok, false}
    end,
    def default(:collation) do
      {:ok, 0}
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
