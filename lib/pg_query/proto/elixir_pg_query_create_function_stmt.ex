# credo:disable-for-this-file
defmodule PgQuery.CreateFunctionStmt do
  @moduledoc false
  defstruct is_procedure: false,
            replace: false,
            funcname: [],
            parameters: [],
            return_type: nil,
            options: [],
            sql_body: nil

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
        |> encode_is_procedure(msg)
        |> encode_replace(msg)
        |> encode_funcname(msg)
        |> encode_parameters(msg)
        |> encode_return_type(msg)
        |> encode_options(msg)
        |> encode_sql_body(msg)
      end
    )

    []

    [
      defp encode_is_procedure(acc, msg) do
        try do
          if msg.is_procedure == false do
            acc
          else
            [acc, "\b", Protox.Encode.encode_bool(msg.is_procedure)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_procedure, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_replace(acc, msg) do
        try do
          if msg.replace == false do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_bool(msg.replace)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:replace, "invalid field value"), __STACKTRACE__
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
                  [acc, "\x1A", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:funcname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_parameters(acc, msg) do
        try do
          case msg.parameters do
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
            reraise Protox.EncodingError.new(:parameters, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_return_type(acc, msg) do
        try do
          if msg.return_type == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.return_type)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:return_type, "invalid field value"), __STACKTRACE__
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
                  [acc, "2", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:options, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_sql_body(acc, msg) do
        try do
          if msg.sql_body == nil do
            acc
          else
            [acc, ":", Protox.Encode.encode_message(msg.sql_body)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sql_body, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.CreateFunctionStmt))
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
              {[is_procedure: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[replace: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[funcname: msg.funcname ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[parameters: msg.parameters ++ [PgQuery.Node.decode!(delimited)]], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 return_type:
                   Protox.MergeMessage.merge(msg.return_type, PgQuery.TypeName.decode!(delimited))
               ], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[options: msg.options ++ [PgQuery.Node.decode!(delimited)]], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 sql_body:
                   Protox.MergeMessage.merge(msg.sql_body, PgQuery.Node.decode!(delimited))
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
        PgQuery.CreateFunctionStmt,
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
        1 => {:is_procedure, {:scalar, false}, :bool},
        2 => {:replace, {:scalar, false}, :bool},
        3 => {:funcname, :unpacked, {:message, PgQuery.Node}},
        4 => {:parameters, :unpacked, {:message, PgQuery.Node}},
        5 => {:return_type, {:scalar, nil}, {:message, PgQuery.TypeName}},
        6 => {:options, :unpacked, {:message, PgQuery.Node}},
        7 => {:sql_body, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        funcname: {3, :unpacked, {:message, PgQuery.Node}},
        is_procedure: {1, {:scalar, false}, :bool},
        options: {6, :unpacked, {:message, PgQuery.Node}},
        parameters: {4, :unpacked, {:message, PgQuery.Node}},
        replace: {2, {:scalar, false}, :bool},
        return_type: {5, {:scalar, nil}, {:message, PgQuery.TypeName}},
        sql_body: {7, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "isProcedure",
          kind: {:scalar, false},
          label: :optional,
          name: :is_procedure,
          tag: 1,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "replace",
          kind: {:scalar, false},
          label: :optional,
          name: :replace,
          tag: 2,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "funcname",
          kind: :unpacked,
          label: :repeated,
          name: :funcname,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "parameters",
          kind: :unpacked,
          label: :repeated,
          name: :parameters,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "returnType",
          kind: {:scalar, nil},
          label: :optional,
          name: :return_type,
          tag: 5,
          type: {:message, PgQuery.TypeName}
        },
        %{
          __struct__: Protox.Field,
          json_name: "options",
          kind: :unpacked,
          label: :repeated,
          name: :options,
          tag: 6,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "sqlBody",
          kind: {:scalar, nil},
          label: :optional,
          name: :sql_body,
          tag: 7,
          type: {:message, PgQuery.Node}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:is_procedure) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isProcedure",
             kind: {:scalar, false},
             label: :optional,
             name: :is_procedure,
             tag: 1,
             type: :bool
           }}
        end

        def field_def("isProcedure") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isProcedure",
             kind: {:scalar, false},
             label: :optional,
             name: :is_procedure,
             tag: 1,
             type: :bool
           }}
        end

        def field_def("is_procedure") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isProcedure",
             kind: {:scalar, false},
             label: :optional,
             name: :is_procedure,
             tag: 1,
             type: :bool
           }}
        end
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
             tag: 2,
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
             tag: 2,
             type: :bool
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
             tag: 3,
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
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:parameters) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "parameters",
             kind: :unpacked,
             label: :repeated,
             name: :parameters,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("parameters") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "parameters",
             kind: :unpacked,
             label: :repeated,
             name: :parameters,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:return_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returnType",
             kind: {:scalar, nil},
             label: :optional,
             name: :return_type,
             tag: 5,
             type: {:message, PgQuery.TypeName}
           }}
        end

        def field_def("returnType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returnType",
             kind: {:scalar, nil},
             label: :optional,
             name: :return_type,
             tag: 5,
             type: {:message, PgQuery.TypeName}
           }}
        end

        def field_def("return_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returnType",
             kind: {:scalar, nil},
             label: :optional,
             name: :return_type,
             tag: 5,
             type: {:message, PgQuery.TypeName}
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
             tag: 6,
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
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:sql_body) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sqlBody",
             kind: {:scalar, nil},
             label: :optional,
             name: :sql_body,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("sqlBody") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sqlBody",
             kind: {:scalar, nil},
             label: :optional,
             name: :sql_body,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("sql_body") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sqlBody",
             kind: {:scalar, nil},
             label: :optional,
             name: :sql_body,
             tag: 7,
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
    def default(:is_procedure) do
      {:ok, false}
    end,
    def default(:replace) do
      {:ok, false}
    end,
    def default(:funcname) do
      {:error, :no_default_value}
    end,
    def default(:parameters) do
      {:error, :no_default_value}
    end,
    def default(:return_type) do
      {:ok, nil}
    end,
    def default(:options) do
      {:error, :no_default_value}
    end,
    def default(:sql_body) do
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
