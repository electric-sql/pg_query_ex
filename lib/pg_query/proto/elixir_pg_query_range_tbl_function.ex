# credo:disable-for-this-file
defmodule PgQuery.RangeTblFunction do
  @moduledoc false
  defstruct funcexpr: nil,
            funccolcount: 0,
            funccolnames: [],
            funccoltypes: [],
            funccoltypmods: [],
            funccolcollations: [],
            funcparams: []

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
        |> encode_funcexpr(msg)
        |> encode_funccolcount(msg)
        |> encode_funccolnames(msg)
        |> encode_funccoltypes(msg)
        |> encode_funccoltypmods(msg)
        |> encode_funccolcollations(msg)
        |> encode_funcparams(msg)
      end
    )

    []

    [
      defp encode_funcexpr(acc, msg) do
        try do
          if msg.funcexpr == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.funcexpr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:funcexpr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_funccolcount(acc, msg) do
        try do
          if msg.funccolcount == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_int32(msg.funccolcount)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:funccolcount, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_funccolnames(acc, msg) do
        try do
          case msg.funccolnames do
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
            reraise Protox.EncodingError.new(:funccolnames, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_funccoltypes(acc, msg) do
        try do
          case msg.funccoltypes do
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
            reraise Protox.EncodingError.new(:funccoltypes, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_funccoltypmods(acc, msg) do
        try do
          case msg.funccoltypmods do
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
            reraise Protox.EncodingError.new(:funccoltypmods, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_funccolcollations(acc, msg) do
        try do
          case msg.funccolcollations do
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
            reraise Protox.EncodingError.new(:funccolcollations, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_funcparams(acc, msg) do
        try do
          case msg.funcparams do
            [] ->
              acc

            values ->
              [
                acc,
                ":",
                (
                  {bytes, len} =
                    Enum.reduce(values, {[], 0}, fn value, {acc, len} ->
                      value_bytes = :binary.list_to_bin([Protox.Encode.encode_uint64(value)])
                      {[acc, value_bytes], len + byte_size(value_bytes)}
                    end)

                  [Protox.Varint.encode(len), bytes]
                )
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:funcparams, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.RangeTblFunction))
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
                 funcexpr:
                   Protox.MergeMessage.merge(msg.funcexpr, PgQuery.Node.decode!(delimited))
               ], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[funccolcount: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[funccolnames: msg.funccolnames ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[funccoltypes: msg.funccoltypes ++ [PgQuery.Node.decode!(delimited)]], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[funccoltypmods: msg.funccoltypmods ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[funccolcollations: msg.funccolcollations ++ [PgQuery.Node.decode!(delimited)]],
               rest}

            {7, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[funcparams: msg.funcparams ++ Protox.Decode.parse_repeated_uint64([], delimited)],
               rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint64(bytes)
              {[funcparams: msg.funcparams ++ [value]], rest}

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
        PgQuery.RangeTblFunction,
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
        1 => {:funcexpr, {:scalar, nil}, {:message, PgQuery.Node}},
        2 => {:funccolcount, {:scalar, 0}, :int32},
        3 => {:funccolnames, :unpacked, {:message, PgQuery.Node}},
        4 => {:funccoltypes, :unpacked, {:message, PgQuery.Node}},
        5 => {:funccoltypmods, :unpacked, {:message, PgQuery.Node}},
        6 => {:funccolcollations, :unpacked, {:message, PgQuery.Node}},
        7 => {:funcparams, :packed, :uint64}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        funccolcollations: {6, :unpacked, {:message, PgQuery.Node}},
        funccolcount: {2, {:scalar, 0}, :int32},
        funccolnames: {3, :unpacked, {:message, PgQuery.Node}},
        funccoltypes: {4, :unpacked, {:message, PgQuery.Node}},
        funccoltypmods: {5, :unpacked, {:message, PgQuery.Node}},
        funcexpr: {1, {:scalar, nil}, {:message, PgQuery.Node}},
        funcparams: {7, :packed, :uint64}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "funcexpr",
          kind: {:scalar, nil},
          label: :optional,
          name: :funcexpr,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "funccolcount",
          kind: {:scalar, 0},
          label: :optional,
          name: :funccolcount,
          tag: 2,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "funccolnames",
          kind: :unpacked,
          label: :repeated,
          name: :funccolnames,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "funccoltypes",
          kind: :unpacked,
          label: :repeated,
          name: :funccoltypes,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "funccoltypmods",
          kind: :unpacked,
          label: :repeated,
          name: :funccoltypmods,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "funccolcollations",
          kind: :unpacked,
          label: :repeated,
          name: :funccolcollations,
          tag: 6,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "funcparams",
          kind: :packed,
          label: :repeated,
          name: :funcparams,
          tag: 7,
          type: :uint64
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:funcexpr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcexpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :funcexpr,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("funcexpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcexpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :funcexpr,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:funccolcount) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funccolcount",
             kind: {:scalar, 0},
             label: :optional,
             name: :funccolcount,
             tag: 2,
             type: :int32
           }}
        end

        def field_def("funccolcount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funccolcount",
             kind: {:scalar, 0},
             label: :optional,
             name: :funccolcount,
             tag: 2,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:funccolnames) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funccolnames",
             kind: :unpacked,
             label: :repeated,
             name: :funccolnames,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("funccolnames") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funccolnames",
             kind: :unpacked,
             label: :repeated,
             name: :funccolnames,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:funccoltypes) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funccoltypes",
             kind: :unpacked,
             label: :repeated,
             name: :funccoltypes,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("funccoltypes") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funccoltypes",
             kind: :unpacked,
             label: :repeated,
             name: :funccoltypes,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:funccoltypmods) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funccoltypmods",
             kind: :unpacked,
             label: :repeated,
             name: :funccoltypmods,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("funccoltypmods") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funccoltypmods",
             kind: :unpacked,
             label: :repeated,
             name: :funccoltypmods,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:funccolcollations) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funccolcollations",
             kind: :unpacked,
             label: :repeated,
             name: :funccolcollations,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("funccolcollations") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funccolcollations",
             kind: :unpacked,
             label: :repeated,
             name: :funccolcollations,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:funcparams) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcparams",
             kind: :packed,
             label: :repeated,
             name: :funcparams,
             tag: 7,
             type: :uint64
           }}
        end

        def field_def("funcparams") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "funcparams",
             kind: :packed,
             label: :repeated,
             name: :funcparams,
             tag: 7,
             type: :uint64
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
    def default(:funcexpr) do
      {:ok, nil}
    end,
    def default(:funccolcount) do
      {:ok, 0}
    end,
    def default(:funccolnames) do
      {:error, :no_default_value}
    end,
    def default(:funccoltypes) do
      {:error, :no_default_value}
    end,
    def default(:funccoltypmods) do
      {:error, :no_default_value}
    end,
    def default(:funccolcollations) do
      {:error, :no_default_value}
    end,
    def default(:funcparams) do
      {:error, :no_default_value}
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
