# credo:disable-for-this-file
defmodule PgQuery.JoinExpr do
  @moduledoc false
  defstruct jointype: :JOIN_TYPE_UNDEFINED,
            is_natural: false,
            larg: nil,
            rarg: nil,
            using_clause: [],
            join_using_alias: nil,
            quals: nil,
            alias: nil,
            rtindex: 0

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
        |> encode_jointype(msg)
        |> encode_is_natural(msg)
        |> encode_larg(msg)
        |> encode_rarg(msg)
        |> encode_using_clause(msg)
        |> encode_join_using_alias(msg)
        |> encode_quals(msg)
        |> encode_alias(msg)
        |> encode_rtindex(msg)
      end
    )

    []

    [
      defp encode_jointype(acc, msg) do
        try do
          if msg.jointype == :JOIN_TYPE_UNDEFINED do
            acc
          else
            [acc, "\b", msg.jointype |> PgQuery.JoinType.encode() |> Protox.Encode.encode_enum()]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:jointype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_is_natural(acc, msg) do
        try do
          if msg.is_natural == false do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_bool(msg.is_natural)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_natural, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_larg(acc, msg) do
        try do
          if msg.larg == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.larg)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:larg, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rarg(acc, msg) do
        try do
          if msg.rarg == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.rarg)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rarg, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_using_clause(acc, msg) do
        try do
          case msg.using_clause do
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
            reraise Protox.EncodingError.new(:using_clause, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_join_using_alias(acc, msg) do
        try do
          if msg.join_using_alias == nil do
            acc
          else
            [acc, "2", Protox.Encode.encode_message(msg.join_using_alias)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:join_using_alias, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_quals(acc, msg) do
        try do
          if msg.quals == nil do
            acc
          else
            [acc, ":", Protox.Encode.encode_message(msg.quals)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:quals, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_alias(acc, msg) do
        try do
          if msg.alias == nil do
            acc
          else
            [acc, "B", Protox.Encode.encode_message(msg.alias)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:alias, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rtindex(acc, msg) do
        try do
          if msg.rtindex == 0 do
            acc
          else
            [acc, "H", Protox.Encode.encode_int32(msg.rtindex)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rtindex, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.JoinExpr))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.JoinType)
              {[jointype: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_natural: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[larg: Protox.MergeMessage.merge(msg.larg, PgQuery.Node.decode!(delimited))], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[rarg: Protox.MergeMessage.merge(msg.rarg, PgQuery.Node.decode!(delimited))], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[using_clause: msg.using_clause ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 join_using_alias:
                   Protox.MergeMessage.merge(
                     msg.join_using_alias,
                     PgQuery.Alias.decode!(delimited)
                   )
               ], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[quals: Protox.MergeMessage.merge(msg.quals, PgQuery.Node.decode!(delimited))],
               rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[alias: Protox.MergeMessage.merge(msg.alias, PgQuery.Alias.decode!(delimited))],
               rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[rtindex: value], rest}

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
        PgQuery.JoinExpr,
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
        1 => {:jointype, {:scalar, :JOIN_TYPE_UNDEFINED}, {:enum, PgQuery.JoinType}},
        2 => {:is_natural, {:scalar, false}, :bool},
        3 => {:larg, {:scalar, nil}, {:message, PgQuery.Node}},
        4 => {:rarg, {:scalar, nil}, {:message, PgQuery.Node}},
        5 => {:using_clause, :unpacked, {:message, PgQuery.Node}},
        6 => {:join_using_alias, {:scalar, nil}, {:message, PgQuery.Alias}},
        7 => {:quals, {:scalar, nil}, {:message, PgQuery.Node}},
        8 => {:alias, {:scalar, nil}, {:message, PgQuery.Alias}},
        9 => {:rtindex, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        alias: {8, {:scalar, nil}, {:message, PgQuery.Alias}},
        is_natural: {2, {:scalar, false}, :bool},
        join_using_alias: {6, {:scalar, nil}, {:message, PgQuery.Alias}},
        jointype: {1, {:scalar, :JOIN_TYPE_UNDEFINED}, {:enum, PgQuery.JoinType}},
        larg: {3, {:scalar, nil}, {:message, PgQuery.Node}},
        quals: {7, {:scalar, nil}, {:message, PgQuery.Node}},
        rarg: {4, {:scalar, nil}, {:message, PgQuery.Node}},
        rtindex: {9, {:scalar, 0}, :int32},
        using_clause: {5, :unpacked, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "jointype",
          kind: {:scalar, :JOIN_TYPE_UNDEFINED},
          label: :optional,
          name: :jointype,
          tag: 1,
          type: {:enum, PgQuery.JoinType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "isNatural",
          kind: {:scalar, false},
          label: :optional,
          name: :is_natural,
          tag: 2,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "larg",
          kind: {:scalar, nil},
          label: :optional,
          name: :larg,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rarg",
          kind: {:scalar, nil},
          label: :optional,
          name: :rarg,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "usingClause",
          kind: :unpacked,
          label: :repeated,
          name: :using_clause,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "joinUsingAlias",
          kind: {:scalar, nil},
          label: :optional,
          name: :join_using_alias,
          tag: 6,
          type: {:message, PgQuery.Alias}
        },
        %{
          __struct__: Protox.Field,
          json_name: "quals",
          kind: {:scalar, nil},
          label: :optional,
          name: :quals,
          tag: 7,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alias",
          kind: {:scalar, nil},
          label: :optional,
          name: :alias,
          tag: 8,
          type: {:message, PgQuery.Alias}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rtindex",
          kind: {:scalar, 0},
          label: :optional,
          name: :rtindex,
          tag: 9,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:jointype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "jointype",
             kind: {:scalar, :JOIN_TYPE_UNDEFINED},
             label: :optional,
             name: :jointype,
             tag: 1,
             type: {:enum, PgQuery.JoinType}
           }}
        end

        def field_def("jointype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "jointype",
             kind: {:scalar, :JOIN_TYPE_UNDEFINED},
             label: :optional,
             name: :jointype,
             tag: 1,
             type: {:enum, PgQuery.JoinType}
           }}
        end

        []
      ),
      (
        def field_def(:is_natural) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isNatural",
             kind: {:scalar, false},
             label: :optional,
             name: :is_natural,
             tag: 2,
             type: :bool
           }}
        end

        def field_def("isNatural") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isNatural",
             kind: {:scalar, false},
             label: :optional,
             name: :is_natural,
             tag: 2,
             type: :bool
           }}
        end

        def field_def("is_natural") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isNatural",
             kind: {:scalar, false},
             label: :optional,
             name: :is_natural,
             tag: 2,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:larg) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "larg",
             kind: {:scalar, nil},
             label: :optional,
             name: :larg,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("larg") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "larg",
             kind: {:scalar, nil},
             label: :optional,
             name: :larg,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:rarg) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rarg",
             kind: {:scalar, nil},
             label: :optional,
             name: :rarg,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("rarg") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rarg",
             kind: {:scalar, nil},
             label: :optional,
             name: :rarg,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:using_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "usingClause",
             kind: :unpacked,
             label: :repeated,
             name: :using_clause,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("usingClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "usingClause",
             kind: :unpacked,
             label: :repeated,
             name: :using_clause,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("using_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "usingClause",
             kind: :unpacked,
             label: :repeated,
             name: :using_clause,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:join_using_alias) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "joinUsingAlias",
             kind: {:scalar, nil},
             label: :optional,
             name: :join_using_alias,
             tag: 6,
             type: {:message, PgQuery.Alias}
           }}
        end

        def field_def("joinUsingAlias") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "joinUsingAlias",
             kind: {:scalar, nil},
             label: :optional,
             name: :join_using_alias,
             tag: 6,
             type: {:message, PgQuery.Alias}
           }}
        end

        def field_def("join_using_alias") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "joinUsingAlias",
             kind: {:scalar, nil},
             label: :optional,
             name: :join_using_alias,
             tag: 6,
             type: {:message, PgQuery.Alias}
           }}
        end
      ),
      (
        def field_def(:quals) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "quals",
             kind: {:scalar, nil},
             label: :optional,
             name: :quals,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("quals") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "quals",
             kind: {:scalar, nil},
             label: :optional,
             name: :quals,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:alias) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alias",
             kind: {:scalar, nil},
             label: :optional,
             name: :alias,
             tag: 8,
             type: {:message, PgQuery.Alias}
           }}
        end

        def field_def("alias") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alias",
             kind: {:scalar, nil},
             label: :optional,
             name: :alias,
             tag: 8,
             type: {:message, PgQuery.Alias}
           }}
        end

        []
      ),
      (
        def field_def(:rtindex) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rtindex",
             kind: {:scalar, 0},
             label: :optional,
             name: :rtindex,
             tag: 9,
             type: :int32
           }}
        end

        def field_def("rtindex") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rtindex",
             kind: {:scalar, 0},
             label: :optional,
             name: :rtindex,
             tag: 9,
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
    def default(:jointype) do
      {:ok, :JOIN_TYPE_UNDEFINED}
    end,
    def default(:is_natural) do
      {:ok, false}
    end,
    def default(:larg) do
      {:ok, nil}
    end,
    def default(:rarg) do
      {:ok, nil}
    end,
    def default(:using_clause) do
      {:error, :no_default_value}
    end,
    def default(:join_using_alias) do
      {:ok, nil}
    end,
    def default(:quals) do
      {:ok, nil}
    end,
    def default(:alias) do
      {:ok, nil}
    end,
    def default(:rtindex) do
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
