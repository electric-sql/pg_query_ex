# credo:disable-for-this-file
defmodule PgQuery.RowMarkClause do
  @moduledoc false
  defstruct rti: 0,
            strength: :LOCK_CLAUSE_STRENGTH_UNDEFINED,
            wait_policy: :LOCK_WAIT_POLICY_UNDEFINED,
            pushed_down: false

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
        |> encode_rti(msg)
        |> encode_strength(msg)
        |> encode_wait_policy(msg)
        |> encode_pushed_down(msg)
      end
    )

    []

    [
      defp encode_rti(acc, msg) do
        try do
          if msg.rti == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.rti)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rti, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_strength(acc, msg) do
        try do
          if msg.strength == :LOCK_CLAUSE_STRENGTH_UNDEFINED do
            acc
          else
            [
              acc,
              "\x10",
              msg.strength |> PgQuery.LockClauseStrength.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:strength, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_wait_policy(acc, msg) do
        try do
          if msg.wait_policy == :LOCK_WAIT_POLICY_UNDEFINED do
            acc
          else
            [
              acc,
              "\x18",
              msg.wait_policy |> PgQuery.LockWaitPolicy.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:wait_policy, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_pushed_down(acc, msg) do
        try do
          if msg.pushed_down == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.pushed_down)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:pushed_down, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.RowMarkClause))
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
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[rti: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.LockClauseStrength)
              {[strength: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.LockWaitPolicy)
              {[wait_policy: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[pushed_down: value], rest}

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
        PgQuery.RowMarkClause,
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
        1 => {:rti, {:scalar, 0}, :uint32},
        2 =>
          {:strength, {:scalar, :LOCK_CLAUSE_STRENGTH_UNDEFINED},
           {:enum, PgQuery.LockClauseStrength}},
        3 =>
          {:wait_policy, {:scalar, :LOCK_WAIT_POLICY_UNDEFINED}, {:enum, PgQuery.LockWaitPolicy}},
        4 => {:pushed_down, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        pushed_down: {4, {:scalar, false}, :bool},
        rti: {1, {:scalar, 0}, :uint32},
        strength:
          {2, {:scalar, :LOCK_CLAUSE_STRENGTH_UNDEFINED}, {:enum, PgQuery.LockClauseStrength}},
        wait_policy: {3, {:scalar, :LOCK_WAIT_POLICY_UNDEFINED}, {:enum, PgQuery.LockWaitPolicy}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "rti",
          kind: {:scalar, 0},
          label: :optional,
          name: :rti,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "strength",
          kind: {:scalar, :LOCK_CLAUSE_STRENGTH_UNDEFINED},
          label: :optional,
          name: :strength,
          tag: 2,
          type: {:enum, PgQuery.LockClauseStrength}
        },
        %{
          __struct__: Protox.Field,
          json_name: "waitPolicy",
          kind: {:scalar, :LOCK_WAIT_POLICY_UNDEFINED},
          label: :optional,
          name: :wait_policy,
          tag: 3,
          type: {:enum, PgQuery.LockWaitPolicy}
        },
        %{
          __struct__: Protox.Field,
          json_name: "pushedDown",
          kind: {:scalar, false},
          label: :optional,
          name: :pushed_down,
          tag: 4,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:rti) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rti",
             kind: {:scalar, 0},
             label: :optional,
             name: :rti,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("rti") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rti",
             kind: {:scalar, 0},
             label: :optional,
             name: :rti,
             tag: 1,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:strength) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "strength",
             kind: {:scalar, :LOCK_CLAUSE_STRENGTH_UNDEFINED},
             label: :optional,
             name: :strength,
             tag: 2,
             type: {:enum, PgQuery.LockClauseStrength}
           }}
        end

        def field_def("strength") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "strength",
             kind: {:scalar, :LOCK_CLAUSE_STRENGTH_UNDEFINED},
             label: :optional,
             name: :strength,
             tag: 2,
             type: {:enum, PgQuery.LockClauseStrength}
           }}
        end

        []
      ),
      (
        def field_def(:wait_policy) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "waitPolicy",
             kind: {:scalar, :LOCK_WAIT_POLICY_UNDEFINED},
             label: :optional,
             name: :wait_policy,
             tag: 3,
             type: {:enum, PgQuery.LockWaitPolicy}
           }}
        end

        def field_def("waitPolicy") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "waitPolicy",
             kind: {:scalar, :LOCK_WAIT_POLICY_UNDEFINED},
             label: :optional,
             name: :wait_policy,
             tag: 3,
             type: {:enum, PgQuery.LockWaitPolicy}
           }}
        end

        def field_def("wait_policy") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "waitPolicy",
             kind: {:scalar, :LOCK_WAIT_POLICY_UNDEFINED},
             label: :optional,
             name: :wait_policy,
             tag: 3,
             type: {:enum, PgQuery.LockWaitPolicy}
           }}
        end
      ),
      (
        def field_def(:pushed_down) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pushedDown",
             kind: {:scalar, false},
             label: :optional,
             name: :pushed_down,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("pushedDown") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pushedDown",
             kind: {:scalar, false},
             label: :optional,
             name: :pushed_down,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("pushed_down") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pushedDown",
             kind: {:scalar, false},
             label: :optional,
             name: :pushed_down,
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
    def default(:rti) do
      {:ok, 0}
    end,
    def default(:strength) do
      {:ok, :LOCK_CLAUSE_STRENGTH_UNDEFINED}
    end,
    def default(:wait_policy) do
      {:ok, :LOCK_WAIT_POLICY_UNDEFINED}
    end,
    def default(:pushed_down) do
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
