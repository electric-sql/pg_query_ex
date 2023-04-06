# credo:disable-for-this-file
defmodule PgQuery.TruncateStmt do
  @moduledoc false
  defstruct relations: [], restart_seqs: false, behavior: :DROP_BEHAVIOR_UNDEFINED

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
        [] |> encode_relations(msg) |> encode_restart_seqs(msg) |> encode_behavior(msg)
      end
    )

    []

    [
      defp encode_relations(acc, msg) do
        try do
          case msg.relations do
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
            reraise Protox.EncodingError.new(:relations, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_restart_seqs(acc, msg) do
        try do
          if msg.restart_seqs == false do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_bool(msg.restart_seqs)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:restart_seqs, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_behavior(acc, msg) do
        try do
          if msg.behavior == :DROP_BEHAVIOR_UNDEFINED do
            acc
          else
            [
              acc,
              "\x18",
              msg.behavior |> PgQuery.DropBehavior.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:behavior, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.TruncateStmt))
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
              {[relations: msg.relations ++ [PgQuery.Node.decode!(delimited)]], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[restart_seqs: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.DropBehavior)
              {[behavior: value], rest}

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
        PgQuery.TruncateStmt,
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
        1 => {:relations, :unpacked, {:message, PgQuery.Node}},
        2 => {:restart_seqs, {:scalar, false}, :bool},
        3 => {:behavior, {:scalar, :DROP_BEHAVIOR_UNDEFINED}, {:enum, PgQuery.DropBehavior}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        behavior: {3, {:scalar, :DROP_BEHAVIOR_UNDEFINED}, {:enum, PgQuery.DropBehavior}},
        relations: {1, :unpacked, {:message, PgQuery.Node}},
        restart_seqs: {2, {:scalar, false}, :bool}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "relations",
          kind: :unpacked,
          label: :repeated,
          name: :relations,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "restartSeqs",
          kind: {:scalar, false},
          label: :optional,
          name: :restart_seqs,
          tag: 2,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "behavior",
          kind: {:scalar, :DROP_BEHAVIOR_UNDEFINED},
          label: :optional,
          name: :behavior,
          tag: 3,
          type: {:enum, PgQuery.DropBehavior}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:relations) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relations",
             kind: :unpacked,
             label: :repeated,
             name: :relations,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("relations") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relations",
             kind: :unpacked,
             label: :repeated,
             name: :relations,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:restart_seqs) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "restartSeqs",
             kind: {:scalar, false},
             label: :optional,
             name: :restart_seqs,
             tag: 2,
             type: :bool
           }}
        end

        def field_def("restartSeqs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "restartSeqs",
             kind: {:scalar, false},
             label: :optional,
             name: :restart_seqs,
             tag: 2,
             type: :bool
           }}
        end

        def field_def("restart_seqs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "restartSeqs",
             kind: {:scalar, false},
             label: :optional,
             name: :restart_seqs,
             tag: 2,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:behavior) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "behavior",
             kind: {:scalar, :DROP_BEHAVIOR_UNDEFINED},
             label: :optional,
             name: :behavior,
             tag: 3,
             type: {:enum, PgQuery.DropBehavior}
           }}
        end

        def field_def("behavior") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "behavior",
             kind: {:scalar, :DROP_BEHAVIOR_UNDEFINED},
             label: :optional,
             name: :behavior,
             tag: 3,
             type: {:enum, PgQuery.DropBehavior}
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
    def default(:relations) do
      {:error, :no_default_value}
    end,
    def default(:restart_seqs) do
      {:ok, false}
    end,
    def default(:behavior) do
      {:ok, :DROP_BEHAVIOR_UNDEFINED}
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
