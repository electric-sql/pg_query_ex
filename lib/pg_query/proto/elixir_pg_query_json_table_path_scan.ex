# credo:disable-for-this-file
defmodule PgQuery.JsonTablePathScan do
  @moduledoc false
  defstruct plan: nil, path: nil, error_on_error: false, child: nil, col_min: 0, col_max: 0

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
        |> encode_plan(msg)
        |> encode_path(msg)
        |> encode_error_on_error(msg)
        |> encode_child(msg)
        |> encode_col_min(msg)
        |> encode_col_max(msg)
      end
    )

    []

    [
      defp encode_plan(acc, msg) do
        try do
          if msg.plan == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.plan)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:plan, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_path(acc, msg) do
        try do
          if msg.path == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.path)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:path, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_error_on_error(acc, msg) do
        try do
          if msg.error_on_error == false do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_bool(msg.error_on_error)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:error_on_error, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_child(acc, msg) do
        try do
          if msg.child == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.child)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:child, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_col_min(acc, msg) do
        try do
          if msg.col_min == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_int32(msg.col_min)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:col_min, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_col_max(acc, msg) do
        try do
          if msg.col_max == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_int32(msg.col_max)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:col_max, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.JsonTablePathScan))
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
              {[plan: Protox.MergeMessage.merge(msg.plan, PgQuery.Node.decode!(delimited))], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 path:
                   Protox.MergeMessage.merge(msg.path, PgQuery.JsonTablePath.decode!(delimited))
               ], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[error_on_error: value], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[child: Protox.MergeMessage.merge(msg.child, PgQuery.Node.decode!(delimited))],
               rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[col_min: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[col_max: value], rest}

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
        PgQuery.JsonTablePathScan,
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
        1 => {:plan, {:scalar, nil}, {:message, PgQuery.Node}},
        2 => {:path, {:scalar, nil}, {:message, PgQuery.JsonTablePath}},
        3 => {:error_on_error, {:scalar, false}, :bool},
        4 => {:child, {:scalar, nil}, {:message, PgQuery.Node}},
        5 => {:col_min, {:scalar, 0}, :int32},
        6 => {:col_max, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        child: {4, {:scalar, nil}, {:message, PgQuery.Node}},
        col_max: {6, {:scalar, 0}, :int32},
        col_min: {5, {:scalar, 0}, :int32},
        error_on_error: {3, {:scalar, false}, :bool},
        path: {2, {:scalar, nil}, {:message, PgQuery.JsonTablePath}},
        plan: {1, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "plan",
          kind: {:scalar, nil},
          label: :optional,
          name: :plan,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "path",
          kind: {:scalar, nil},
          label: :optional,
          name: :path,
          tag: 2,
          type: {:message, PgQuery.JsonTablePath}
        },
        %{
          __struct__: Protox.Field,
          json_name: "errorOnError",
          kind: {:scalar, false},
          label: :optional,
          name: :error_on_error,
          tag: 3,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "child",
          kind: {:scalar, nil},
          label: :optional,
          name: :child,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "colMin",
          kind: {:scalar, 0},
          label: :optional,
          name: :col_min,
          tag: 5,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "colMax",
          kind: {:scalar, 0},
          label: :optional,
          name: :col_max,
          tag: 6,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:plan) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "plan",
             kind: {:scalar, nil},
             label: :optional,
             name: :plan,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("plan") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "plan",
             kind: {:scalar, nil},
             label: :optional,
             name: :plan,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:path) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "path",
             kind: {:scalar, nil},
             label: :optional,
             name: :path,
             tag: 2,
             type: {:message, PgQuery.JsonTablePath}
           }}
        end

        def field_def("path") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "path",
             kind: {:scalar, nil},
             label: :optional,
             name: :path,
             tag: 2,
             type: {:message, PgQuery.JsonTablePath}
           }}
        end

        []
      ),
      (
        def field_def(:error_on_error) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "errorOnError",
             kind: {:scalar, false},
             label: :optional,
             name: :error_on_error,
             tag: 3,
             type: :bool
           }}
        end

        def field_def("errorOnError") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "errorOnError",
             kind: {:scalar, false},
             label: :optional,
             name: :error_on_error,
             tag: 3,
             type: :bool
           }}
        end

        def field_def("error_on_error") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "errorOnError",
             kind: {:scalar, false},
             label: :optional,
             name: :error_on_error,
             tag: 3,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:child) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "child",
             kind: {:scalar, nil},
             label: :optional,
             name: :child,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("child") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "child",
             kind: {:scalar, nil},
             label: :optional,
             name: :child,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:col_min) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colMin",
             kind: {:scalar, 0},
             label: :optional,
             name: :col_min,
             tag: 5,
             type: :int32
           }}
        end

        def field_def("colMin") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colMin",
             kind: {:scalar, 0},
             label: :optional,
             name: :col_min,
             tag: 5,
             type: :int32
           }}
        end

        def field_def("col_min") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colMin",
             kind: {:scalar, 0},
             label: :optional,
             name: :col_min,
             tag: 5,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:col_max) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colMax",
             kind: {:scalar, 0},
             label: :optional,
             name: :col_max,
             tag: 6,
             type: :int32
           }}
        end

        def field_def("colMax") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colMax",
             kind: {:scalar, 0},
             label: :optional,
             name: :col_max,
             tag: 6,
             type: :int32
           }}
        end

        def field_def("col_max") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "colMax",
             kind: {:scalar, 0},
             label: :optional,
             name: :col_max,
             tag: 6,
             type: :int32
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
    def default(:plan) do
      {:ok, nil}
    end,
    def default(:path) do
      {:ok, nil}
    end,
    def default(:error_on_error) do
      {:ok, false}
    end,
    def default(:child) do
      {:ok, nil}
    end,
    def default(:col_min) do
      {:ok, 0}
    end,
    def default(:col_max) do
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
