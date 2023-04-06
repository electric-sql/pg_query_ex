# credo:disable-for-this-file
defmodule PgQuery.FuncCall do
  @moduledoc false
  defstruct funcname: [],
            args: [],
            agg_order: [],
            agg_filter: nil,
            over: nil,
            agg_within_group: false,
            agg_star: false,
            agg_distinct: false,
            func_variadic: false,
            funcformat: :COERCION_FORM_UNDEFINED,
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
        |> encode_funcname(msg)
        |> encode_args(msg)
        |> encode_agg_order(msg)
        |> encode_agg_filter(msg)
        |> encode_over(msg)
        |> encode_agg_within_group(msg)
        |> encode_agg_star(msg)
        |> encode_agg_distinct(msg)
        |> encode_func_variadic(msg)
        |> encode_funcformat(msg)
        |> encode_location(msg)
      end
    )

    []

    [
      defp encode_funcname(acc, msg) do
        try do
          case msg.funcname do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\n", Protox.Encode.encode_message(value)]
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
                  [acc, "\x12", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:args, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_agg_order(acc, msg) do
        try do
          case msg.agg_order do
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
            reraise Protox.EncodingError.new(:agg_order, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_agg_filter(acc, msg) do
        try do
          if msg.agg_filter == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.agg_filter)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:agg_filter, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_over(acc, msg) do
        try do
          if msg.over == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.over)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:over, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_agg_within_group(acc, msg) do
        try do
          if msg.agg_within_group == false do
            acc
          else
            [acc, "0", Protox.Encode.encode_bool(msg.agg_within_group)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:agg_within_group, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_agg_star(acc, msg) do
        try do
          if msg.agg_star == false do
            acc
          else
            [acc, "8", Protox.Encode.encode_bool(msg.agg_star)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:agg_star, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_agg_distinct(acc, msg) do
        try do
          if msg.agg_distinct == false do
            acc
          else
            [acc, "@", Protox.Encode.encode_bool(msg.agg_distinct)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:agg_distinct, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_func_variadic(acc, msg) do
        try do
          if msg.func_variadic == false do
            acc
          else
            [acc, "H", Protox.Encode.encode_bool(msg.func_variadic)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:func_variadic, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_funcformat(acc, msg) do
        try do
          if msg.funcformat == :COERCION_FORM_UNDEFINED do
            acc
          else
            [
              acc,
              "P",
              msg.funcformat |> PgQuery.CoercionForm.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:funcformat, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.FuncCall))
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
              {[funcname: msg.funcname ++ [PgQuery.Node.decode!(delimited)]], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[args: msg.args ++ [PgQuery.Node.decode!(delimited)]], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[agg_order: msg.agg_order ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 agg_filter:
                   Protox.MergeMessage.merge(msg.agg_filter, PgQuery.Node.decode!(delimited))
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[over: Protox.MergeMessage.merge(msg.over, PgQuery.WindowDef.decode!(delimited))],
               rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[agg_within_group: value], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[agg_star: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[agg_distinct: value], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[func_variadic: value], rest}

            {10, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.CoercionForm)
              {[funcformat: value], rest}

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
        PgQuery.FuncCall,
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
        1 => {:funcname, :unpacked, {:message, PgQuery.Node}},
        2 => {:args, :unpacked, {:message, PgQuery.Node}},
        3 => {:agg_order, :unpacked, {:message, PgQuery.Node}},
        4 => {:agg_filter, {:scalar, nil}, {:message, PgQuery.Node}},
        5 => {:over, {:scalar, nil}, {:message, PgQuery.WindowDef}},
        6 => {:agg_within_group, {:scalar, false}, :bool},
        7 => {:agg_star, {:scalar, false}, :bool},
        8 => {:agg_distinct, {:scalar, false}, :bool},
        9 => {:func_variadic, {:scalar, false}, :bool},
        10 => {:funcformat, {:scalar, :COERCION_FORM_UNDEFINED}, {:enum, PgQuery.CoercionForm}},
        11 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        agg_distinct: {8, {:scalar, false}, :bool},
        agg_filter: {4, {:scalar, nil}, {:message, PgQuery.Node}},
        agg_order: {3, :unpacked, {:message, PgQuery.Node}},
        agg_star: {7, {:scalar, false}, :bool},
        agg_within_group: {6, {:scalar, false}, :bool},
        args: {2, :unpacked, {:message, PgQuery.Node}},
        func_variadic: {9, {:scalar, false}, :bool},
        funcformat: {10, {:scalar, :COERCION_FORM_UNDEFINED}, {:enum, PgQuery.CoercionForm}},
        funcname: {1, :unpacked, {:message, PgQuery.Node}},
        location: {11, {:scalar, 0}, :int32},
        over: {5, {:scalar, nil}, {:message, PgQuery.WindowDef}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "funcname",
          kind: :unpacked,
          label: :repeated,
          name: :funcname,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "args",
          kind: :unpacked,
          label: :repeated,
          name: :args,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggOrder",
          kind: :unpacked,
          label: :repeated,
          name: :agg_order,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggFilter",
          kind: {:scalar, nil},
          label: :optional,
          name: :agg_filter,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "over",
          kind: {:scalar, nil},
          label: :optional,
          name: :over,
          tag: 5,
          type: {:message, PgQuery.WindowDef}
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggWithinGroup",
          kind: {:scalar, false},
          label: :optional,
          name: :agg_within_group,
          tag: 6,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggStar",
          kind: {:scalar, false},
          label: :optional,
          name: :agg_star,
          tag: 7,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggDistinct",
          kind: {:scalar, false},
          label: :optional,
          name: :agg_distinct,
          tag: 8,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "funcVariadic",
          kind: {:scalar, false},
          label: :optional,
          name: :func_variadic,
          tag: 9,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "funcformat",
          kind: {:scalar, :COERCION_FORM_UNDEFINED},
          label: :optional,
          name: :funcformat,
          tag: 10,
          type: {:enum, PgQuery.CoercionForm}
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
        def field_def(:funcname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcname",
             kind: :unpacked,
             label: :repeated,
             name: :funcname,
             tag: 1,
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
             tag: 1,
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
             tag: 2,
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
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:agg_order) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggOrder",
             kind: :unpacked,
             label: :repeated,
             name: :agg_order,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("aggOrder") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggOrder",
             kind: :unpacked,
             label: :repeated,
             name: :agg_order,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("agg_order") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggOrder",
             kind: :unpacked,
             label: :repeated,
             name: :agg_order,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:agg_filter) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggFilter",
             kind: {:scalar, nil},
             label: :optional,
             name: :agg_filter,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("aggFilter") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggFilter",
             kind: {:scalar, nil},
             label: :optional,
             name: :agg_filter,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("agg_filter") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggFilter",
             kind: {:scalar, nil},
             label: :optional,
             name: :agg_filter,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:over) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "over",
             kind: {:scalar, nil},
             label: :optional,
             name: :over,
             tag: 5,
             type: {:message, PgQuery.WindowDef}
           }}
        end

        def field_def("over") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "over",
             kind: {:scalar, nil},
             label: :optional,
             name: :over,
             tag: 5,
             type: {:message, PgQuery.WindowDef}
           }}
        end

        []
      ),
      (
        def field_def(:agg_within_group) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggWithinGroup",
             kind: {:scalar, false},
             label: :optional,
             name: :agg_within_group,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("aggWithinGroup") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggWithinGroup",
             kind: {:scalar, false},
             label: :optional,
             name: :agg_within_group,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("agg_within_group") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggWithinGroup",
             kind: {:scalar, false},
             label: :optional,
             name: :agg_within_group,
             tag: 6,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:agg_star) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggStar",
             kind: {:scalar, false},
             label: :optional,
             name: :agg_star,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("aggStar") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggStar",
             kind: {:scalar, false},
             label: :optional,
             name: :agg_star,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("agg_star") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggStar",
             kind: {:scalar, false},
             label: :optional,
             name: :agg_star,
             tag: 7,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:agg_distinct) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggDistinct",
             kind: {:scalar, false},
             label: :optional,
             name: :agg_distinct,
             tag: 8,
             type: :bool
           }}
        end

        def field_def("aggDistinct") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggDistinct",
             kind: {:scalar, false},
             label: :optional,
             name: :agg_distinct,
             tag: 8,
             type: :bool
           }}
        end

        def field_def("agg_distinct") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggDistinct",
             kind: {:scalar, false},
             label: :optional,
             name: :agg_distinct,
             tag: 8,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:func_variadic) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcVariadic",
             kind: {:scalar, false},
             label: :optional,
             name: :func_variadic,
             tag: 9,
             type: :bool
           }}
        end

        def field_def("funcVariadic") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcVariadic",
             kind: {:scalar, false},
             label: :optional,
             name: :func_variadic,
             tag: 9,
             type: :bool
           }}
        end

        def field_def("func_variadic") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcVariadic",
             kind: {:scalar, false},
             label: :optional,
             name: :func_variadic,
             tag: 9,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:funcformat) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcformat",
             kind: {:scalar, :COERCION_FORM_UNDEFINED},
             label: :optional,
             name: :funcformat,
             tag: 10,
             type: {:enum, PgQuery.CoercionForm}
           }}
        end

        def field_def("funcformat") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcformat",
             kind: {:scalar, :COERCION_FORM_UNDEFINED},
             label: :optional,
             name: :funcformat,
             tag: 10,
             type: {:enum, PgQuery.CoercionForm}
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
    def default(:funcname) do
      {:error, :no_default_value}
    end,
    def default(:args) do
      {:error, :no_default_value}
    end,
    def default(:agg_order) do
      {:error, :no_default_value}
    end,
    def default(:agg_filter) do
      {:ok, nil}
    end,
    def default(:over) do
      {:ok, nil}
    end,
    def default(:agg_within_group) do
      {:ok, false}
    end,
    def default(:agg_star) do
      {:ok, false}
    end,
    def default(:agg_distinct) do
      {:ok, false}
    end,
    def default(:func_variadic) do
      {:ok, false}
    end,
    def default(:funcformat) do
      {:ok, :COERCION_FORM_UNDEFINED}
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
