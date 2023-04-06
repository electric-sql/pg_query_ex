# credo:disable-for-this-file
defmodule PgQuery.A_Expr do
  @moduledoc false
  defstruct kind: :A_EXPR_KIND_UNDEFINED, name: [], lexpr: nil, rexpr: nil, location: 0

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
        |> encode_kind(msg)
        |> encode_name(msg)
        |> encode_lexpr(msg)
        |> encode_rexpr(msg)
        |> encode_location(msg)
      end
    )

    []

    [
      defp encode_kind(acc, msg) do
        try do
          if msg.kind == :A_EXPR_KIND_UNDEFINED do
            acc
          else
            [acc, "\b", msg.kind |> PgQuery.A_Expr_Kind.encode() |> Protox.Encode.encode_enum()]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:kind, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_name(acc, msg) do
        try do
          case msg.name do
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
            reraise Protox.EncodingError.new(:name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_lexpr(acc, msg) do
        try do
          if msg.lexpr == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.lexpr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:lexpr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rexpr(acc, msg) do
        try do
          if msg.rexpr == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.rexpr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rexpr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_int32(msg.location)]
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
          parse_key_value(bytes, struct(PgQuery.A_Expr))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.A_Expr_Kind)
              {[kind: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[name: msg.name ++ [PgQuery.Node.decode!(delimited)]], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[lexpr: Protox.MergeMessage.merge(msg.lexpr, PgQuery.Node.decode!(delimited))],
               rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[rexpr: Protox.MergeMessage.merge(msg.rexpr, PgQuery.Node.decode!(delimited))],
               rest}

            {5, _, bytes} ->
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
        PgQuery.A_Expr,
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
        1 => {:kind, {:scalar, :A_EXPR_KIND_UNDEFINED}, {:enum, PgQuery.A_Expr_Kind}},
        2 => {:name, :unpacked, {:message, PgQuery.Node}},
        3 => {:lexpr, {:scalar, nil}, {:message, PgQuery.Node}},
        4 => {:rexpr, {:scalar, nil}, {:message, PgQuery.Node}},
        5 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        kind: {1, {:scalar, :A_EXPR_KIND_UNDEFINED}, {:enum, PgQuery.A_Expr_Kind}},
        lexpr: {3, {:scalar, nil}, {:message, PgQuery.Node}},
        location: {5, {:scalar, 0}, :int32},
        name: {2, :unpacked, {:message, PgQuery.Node}},
        rexpr: {4, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "kind",
          kind: {:scalar, :A_EXPR_KIND_UNDEFINED},
          label: :optional,
          name: :kind,
          tag: 1,
          type: {:enum, PgQuery.A_Expr_Kind}
        },
        %{
          __struct__: Protox.Field,
          json_name: "name",
          kind: :unpacked,
          label: :repeated,
          name: :name,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "lexpr",
          kind: {:scalar, nil},
          label: :optional,
          name: :lexpr,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rexpr",
          kind: {:scalar, nil},
          label: :optional,
          name: :rexpr,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 5,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:kind) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "kind",
             kind: {:scalar, :A_EXPR_KIND_UNDEFINED},
             label: :optional,
             name: :kind,
             tag: 1,
             type: {:enum, PgQuery.A_Expr_Kind}
           }}
        end

        def field_def("kind") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "kind",
             kind: {:scalar, :A_EXPR_KIND_UNDEFINED},
             label: :optional,
             name: :kind,
             tag: 1,
             type: {:enum, PgQuery.A_Expr_Kind}
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
             kind: :unpacked,
             label: :repeated,
             name: :name,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: :unpacked,
             label: :repeated,
             name: :name,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:lexpr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lexpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :lexpr,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("lexpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lexpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :lexpr,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:rexpr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rexpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :rexpr,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("rexpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rexpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :rexpr,
             tag: 4,
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
             tag: 5,
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
             tag: 5,
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
    def default(:kind) do
      {:ok, :A_EXPR_KIND_UNDEFINED}
    end,
    def default(:name) do
      {:error, :no_default_value}
    end,
    def default(:lexpr) do
      {:ok, nil}
    end,
    def default(:rexpr) do
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
