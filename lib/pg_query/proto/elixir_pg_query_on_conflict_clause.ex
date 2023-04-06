# credo:disable-for-this-file
defmodule PgQuery.OnConflictClause do
  @moduledoc false
  defstruct action: :ON_CONFLICT_ACTION_UNDEFINED,
            infer: nil,
            target_list: [],
            where_clause: nil,
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
        |> encode_action(msg)
        |> encode_infer(msg)
        |> encode_target_list(msg)
        |> encode_where_clause(msg)
        |> encode_location(msg)
      end
    )

    []

    [
      defp encode_action(acc, msg) do
        try do
          if msg.action == :ON_CONFLICT_ACTION_UNDEFINED do
            acc
          else
            [
              acc,
              "\b",
              msg.action |> PgQuery.OnConflictAction.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:action, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_infer(acc, msg) do
        try do
          if msg.infer == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.infer)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:infer, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_target_list(acc, msg) do
        try do
          case msg.target_list do
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
            reraise Protox.EncodingError.new(:target_list, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_where_clause(acc, msg) do
        try do
          if msg.where_clause == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.where_clause)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:where_clause, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.OnConflictClause))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.OnConflictAction)
              {[action: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 infer:
                   Protox.MergeMessage.merge(msg.infer, PgQuery.InferClause.decode!(delimited))
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[target_list: msg.target_list ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 where_clause:
                   Protox.MergeMessage.merge(msg.where_clause, PgQuery.Node.decode!(delimited))
               ], rest}

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
        PgQuery.OnConflictClause,
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
        1 =>
          {:action, {:scalar, :ON_CONFLICT_ACTION_UNDEFINED}, {:enum, PgQuery.OnConflictAction}},
        2 => {:infer, {:scalar, nil}, {:message, PgQuery.InferClause}},
        3 => {:target_list, :unpacked, {:message, PgQuery.Node}},
        4 => {:where_clause, {:scalar, nil}, {:message, PgQuery.Node}},
        5 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        action: {1, {:scalar, :ON_CONFLICT_ACTION_UNDEFINED}, {:enum, PgQuery.OnConflictAction}},
        infer: {2, {:scalar, nil}, {:message, PgQuery.InferClause}},
        location: {5, {:scalar, 0}, :int32},
        target_list: {3, :unpacked, {:message, PgQuery.Node}},
        where_clause: {4, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "action",
          kind: {:scalar, :ON_CONFLICT_ACTION_UNDEFINED},
          label: :optional,
          name: :action,
          tag: 1,
          type: {:enum, PgQuery.OnConflictAction}
        },
        %{
          __struct__: Protox.Field,
          json_name: "infer",
          kind: {:scalar, nil},
          label: :optional,
          name: :infer,
          tag: 2,
          type: {:message, PgQuery.InferClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "targetList",
          kind: :unpacked,
          label: :repeated,
          name: :target_list,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "whereClause",
          kind: {:scalar, nil},
          label: :optional,
          name: :where_clause,
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
        def field_def(:action) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "action",
             kind: {:scalar, :ON_CONFLICT_ACTION_UNDEFINED},
             label: :optional,
             name: :action,
             tag: 1,
             type: {:enum, PgQuery.OnConflictAction}
           }}
        end

        def field_def("action") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "action",
             kind: {:scalar, :ON_CONFLICT_ACTION_UNDEFINED},
             label: :optional,
             name: :action,
             tag: 1,
             type: {:enum, PgQuery.OnConflictAction}
           }}
        end

        []
      ),
      (
        def field_def(:infer) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "infer",
             kind: {:scalar, nil},
             label: :optional,
             name: :infer,
             tag: 2,
             type: {:message, PgQuery.InferClause}
           }}
        end

        def field_def("infer") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "infer",
             kind: {:scalar, nil},
             label: :optional,
             name: :infer,
             tag: 2,
             type: {:message, PgQuery.InferClause}
           }}
        end

        []
      ),
      (
        def field_def(:target_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "targetList",
             kind: :unpacked,
             label: :repeated,
             name: :target_list,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("targetList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "targetList",
             kind: :unpacked,
             label: :repeated,
             name: :target_list,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("target_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "targetList",
             kind: :unpacked,
             label: :repeated,
             name: :target_list,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:where_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "whereClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :where_clause,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("whereClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "whereClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :where_clause,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("where_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "whereClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :where_clause,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end
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
    def default(:action) do
      {:ok, :ON_CONFLICT_ACTION_UNDEFINED}
    end,
    def default(:infer) do
      {:ok, nil}
    end,
    def default(:target_list) do
      {:error, :no_default_value}
    end,
    def default(:where_clause) do
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
