# credo:disable-for-this-file
defmodule PgQuery.JsonTableSiblingJoin do
  @moduledoc false
  defstruct plan: nil, lplan: nil, rplan: nil

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
        [] |> encode_plan(msg) |> encode_lplan(msg) |> encode_rplan(msg)
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
      defp encode_lplan(acc, msg) do
        try do
          if msg.lplan == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.lplan)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:lplan, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rplan(acc, msg) do
        try do
          if msg.rplan == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.rplan)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rplan, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.JsonTableSiblingJoin))
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

              {[lplan: Protox.MergeMessage.merge(msg.lplan, PgQuery.Node.decode!(delimited))],
               rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[rplan: Protox.MergeMessage.merge(msg.rplan, PgQuery.Node.decode!(delimited))],
               rest}

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
        PgQuery.JsonTableSiblingJoin,
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
        2 => {:lplan, {:scalar, nil}, {:message, PgQuery.Node}},
        3 => {:rplan, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        lplan: {2, {:scalar, nil}, {:message, PgQuery.Node}},
        plan: {1, {:scalar, nil}, {:message, PgQuery.Node}},
        rplan: {3, {:scalar, nil}, {:message, PgQuery.Node}}
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
          json_name: "lplan",
          kind: {:scalar, nil},
          label: :optional,
          name: :lplan,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rplan",
          kind: {:scalar, nil},
          label: :optional,
          name: :rplan,
          tag: 3,
          type: {:message, PgQuery.Node}
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
        def field_def(:lplan) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lplan",
             kind: {:scalar, nil},
             label: :optional,
             name: :lplan,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("lplan") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lplan",
             kind: {:scalar, nil},
             label: :optional,
             name: :lplan,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:rplan) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rplan",
             kind: {:scalar, nil},
             label: :optional,
             name: :rplan,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("rplan") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rplan",
             kind: {:scalar, nil},
             label: :optional,
             name: :rplan,
             tag: 3,
             type: {:message, PgQuery.Node}
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
    def default(:plan) do
      {:ok, nil}
    end,
    def default(:lplan) do
      {:ok, nil}
    end,
    def default(:rplan) do
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
