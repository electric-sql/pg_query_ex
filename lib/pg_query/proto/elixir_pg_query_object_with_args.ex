# credo:disable-for-this-file
defmodule PgQuery.ObjectWithArgs do
  @moduledoc false
  defstruct objname: [], objargs: [], objfuncargs: [], args_unspecified: false

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
        |> encode_objname(msg)
        |> encode_objargs(msg)
        |> encode_objfuncargs(msg)
        |> encode_args_unspecified(msg)
      end
    )

    []

    [
      defp encode_objname(acc, msg) do
        try do
          case msg.objname do
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
            reraise Protox.EncodingError.new(:objname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_objargs(acc, msg) do
        try do
          case msg.objargs do
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
            reraise Protox.EncodingError.new(:objargs, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_objfuncargs(acc, msg) do
        try do
          case msg.objfuncargs do
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
            reraise Protox.EncodingError.new(:objfuncargs, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_args_unspecified(acc, msg) do
        try do
          if msg.args_unspecified == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.args_unspecified)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:args_unspecified, "invalid field value"),
                    __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.ObjectWithArgs))
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
              {[objname: msg.objname ++ [PgQuery.Node.decode!(delimited)]], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[objargs: msg.objargs ++ [PgQuery.Node.decode!(delimited)]], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[objfuncargs: msg.objfuncargs ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[args_unspecified: value], rest}

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
        PgQuery.ObjectWithArgs,
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
        1 => {:objname, :unpacked, {:message, PgQuery.Node}},
        2 => {:objargs, :unpacked, {:message, PgQuery.Node}},
        3 => {:objfuncargs, :unpacked, {:message, PgQuery.Node}},
        4 => {:args_unspecified, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        args_unspecified: {4, {:scalar, false}, :bool},
        objargs: {2, :unpacked, {:message, PgQuery.Node}},
        objfuncargs: {3, :unpacked, {:message, PgQuery.Node}},
        objname: {1, :unpacked, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "objname",
          kind: :unpacked,
          label: :repeated,
          name: :objname,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "objargs",
          kind: :unpacked,
          label: :repeated,
          name: :objargs,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "objfuncargs",
          kind: :unpacked,
          label: :repeated,
          name: :objfuncargs,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "argsUnspecified",
          kind: {:scalar, false},
          label: :optional,
          name: :args_unspecified,
          tag: 4,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:objname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "objname",
             kind: :unpacked,
             label: :repeated,
             name: :objname,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("objname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "objname",
             kind: :unpacked,
             label: :repeated,
             name: :objname,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:objargs) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "objargs",
             kind: :unpacked,
             label: :repeated,
             name: :objargs,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("objargs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "objargs",
             kind: :unpacked,
             label: :repeated,
             name: :objargs,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:objfuncargs) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "objfuncargs",
             kind: :unpacked,
             label: :repeated,
             name: :objfuncargs,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("objfuncargs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "objfuncargs",
             kind: :unpacked,
             label: :repeated,
             name: :objfuncargs,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:args_unspecified) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "argsUnspecified",
             kind: {:scalar, false},
             label: :optional,
             name: :args_unspecified,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("argsUnspecified") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "argsUnspecified",
             kind: {:scalar, false},
             label: :optional,
             name: :args_unspecified,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("args_unspecified") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "argsUnspecified",
             kind: {:scalar, false},
             label: :optional,
             name: :args_unspecified,
             tag: 4,
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
    def default(:objname) do
      {:error, :no_default_value}
    end,
    def default(:objargs) do
      {:error, :no_default_value}
    end,
    def default(:objfuncargs) do
      {:error, :no_default_value}
    end,
    def default(:args_unspecified) do
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
