# credo:disable-for-this-file
defmodule PgQuery.FuncExpr do
  @moduledoc false
  defstruct xpr: nil,
            funcid: 0,
            funcresulttype: 0,
            funcretset: false,
            funcvariadic: false,
            funcformat: :COERCION_FORM_UNDEFINED,
            funccollid: 0,
            inputcollid: 0,
            args: [],
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
        |> encode_funcid(msg)
        |> encode_funcresulttype(msg)
        |> encode_funcretset(msg)
        |> encode_funcvariadic(msg)
        |> encode_funcformat(msg)
        |> encode_funccollid(msg)
        |> encode_inputcollid(msg)
        |> encode_args(msg)
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
      defp encode_funcid(acc, msg) do
        try do
          if msg.funcid == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.funcid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:funcid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_funcresulttype(acc, msg) do
        try do
          if msg.funcresulttype == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.funcresulttype)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:funcresulttype, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_funcretset(acc, msg) do
        try do
          if msg.funcretset == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.funcretset)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:funcretset, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_funcvariadic(acc, msg) do
        try do
          if msg.funcvariadic == false do
            acc
          else
            [acc, "(", Protox.Encode.encode_bool(msg.funcvariadic)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:funcvariadic, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_funcformat(acc, msg) do
        try do
          if msg.funcformat == :COERCION_FORM_UNDEFINED do
            acc
          else
            [
              acc,
              "0",
              msg.funcformat |> PgQuery.CoercionForm.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:funcformat, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_funccollid(acc, msg) do
        try do
          if msg.funccollid == 0 do
            acc
          else
            [acc, "8", Protox.Encode.encode_uint32(msg.funccollid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:funccollid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_inputcollid(acc, msg) do
        try do
          if msg.inputcollid == 0 do
            acc
          else
            [acc, "@", Protox.Encode.encode_uint32(msg.inputcollid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:inputcollid, "invalid field value"), __STACKTRACE__
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
                  [acc, "J", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:args, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "P", Protox.Encode.encode_int32(msg.location)]
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
          parse_key_value(bytes, struct(PgQuery.FuncExpr))
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
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[funcid: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[funcresulttype: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[funcretset: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[funcvariadic: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.CoercionForm)
              {[funcformat: value], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[funccollid: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[inputcollid: value], rest}

            {9, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[args: msg.args ++ [PgQuery.Node.decode!(delimited)]], rest}

            {10, _, bytes} ->
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
        PgQuery.FuncExpr,
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
        2 => {:funcid, {:scalar, 0}, :uint32},
        3 => {:funcresulttype, {:scalar, 0}, :uint32},
        4 => {:funcretset, {:scalar, false}, :bool},
        5 => {:funcvariadic, {:scalar, false}, :bool},
        6 => {:funcformat, {:scalar, :COERCION_FORM_UNDEFINED}, {:enum, PgQuery.CoercionForm}},
        7 => {:funccollid, {:scalar, 0}, :uint32},
        8 => {:inputcollid, {:scalar, 0}, :uint32},
        9 => {:args, :unpacked, {:message, PgQuery.Node}},
        10 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        args: {9, :unpacked, {:message, PgQuery.Node}},
        funccollid: {7, {:scalar, 0}, :uint32},
        funcformat: {6, {:scalar, :COERCION_FORM_UNDEFINED}, {:enum, PgQuery.CoercionForm}},
        funcid: {2, {:scalar, 0}, :uint32},
        funcresulttype: {3, {:scalar, 0}, :uint32},
        funcretset: {4, {:scalar, false}, :bool},
        funcvariadic: {5, {:scalar, false}, :bool},
        inputcollid: {8, {:scalar, 0}, :uint32},
        location: {10, {:scalar, 0}, :int32},
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
          json_name: "funcid",
          kind: {:scalar, 0},
          label: :optional,
          name: :funcid,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "funcresulttype",
          kind: {:scalar, 0},
          label: :optional,
          name: :funcresulttype,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "funcretset",
          kind: {:scalar, false},
          label: :optional,
          name: :funcretset,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "funcvariadic",
          kind: {:scalar, false},
          label: :optional,
          name: :funcvariadic,
          tag: 5,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "funcformat",
          kind: {:scalar, :COERCION_FORM_UNDEFINED},
          label: :optional,
          name: :funcformat,
          tag: 6,
          type: {:enum, PgQuery.CoercionForm}
        },
        %{
          __struct__: Protox.Field,
          json_name: "funccollid",
          kind: {:scalar, 0},
          label: :optional,
          name: :funccollid,
          tag: 7,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "inputcollid",
          kind: {:scalar, 0},
          label: :optional,
          name: :inputcollid,
          tag: 8,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "args",
          kind: :unpacked,
          label: :repeated,
          name: :args,
          tag: 9,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 10,
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
        def field_def(:funcid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcid",
             kind: {:scalar, 0},
             label: :optional,
             name: :funcid,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("funcid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcid",
             kind: {:scalar, 0},
             label: :optional,
             name: :funcid,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:funcresulttype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcresulttype",
             kind: {:scalar, 0},
             label: :optional,
             name: :funcresulttype,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("funcresulttype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcresulttype",
             kind: {:scalar, 0},
             label: :optional,
             name: :funcresulttype,
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:funcretset) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcretset",
             kind: {:scalar, false},
             label: :optional,
             name: :funcretset,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("funcretset") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcretset",
             kind: {:scalar, false},
             label: :optional,
             name: :funcretset,
             tag: 4,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:funcvariadic) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcvariadic",
             kind: {:scalar, false},
             label: :optional,
             name: :funcvariadic,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("funcvariadic") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcvariadic",
             kind: {:scalar, false},
             label: :optional,
             name: :funcvariadic,
             tag: 5,
             type: :bool
           }}
        end

        []
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
             tag: 6,
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
             tag: 6,
             type: {:enum, PgQuery.CoercionForm}
           }}
        end

        []
      ),
      (
        def field_def(:funccollid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funccollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :funccollid,
             tag: 7,
             type: :uint32
           }}
        end

        def field_def("funccollid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funccollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :funccollid,
             tag: 7,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:inputcollid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inputcollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :inputcollid,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("inputcollid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inputcollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :inputcollid,
             tag: 8,
             type: :uint32
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
             tag: 9,
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
             tag: 9,
             type: {:message, PgQuery.Node}
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
             tag: 10,
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
             tag: 10,
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
    def default(:funcid) do
      {:ok, 0}
    end,
    def default(:funcresulttype) do
      {:ok, 0}
    end,
    def default(:funcretset) do
      {:ok, false}
    end,
    def default(:funcvariadic) do
      {:ok, false}
    end,
    def default(:funcformat) do
      {:ok, :COERCION_FORM_UNDEFINED}
    end,
    def default(:funccollid) do
      {:ok, 0}
    end,
    def default(:inputcollid) do
      {:ok, 0}
    end,
    def default(:args) do
      {:error, :no_default_value}
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
