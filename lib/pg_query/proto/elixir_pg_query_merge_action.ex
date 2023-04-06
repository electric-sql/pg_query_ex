# credo:disable-for-this-file
defmodule PgQuery.MergeAction do
  @moduledoc false
  defstruct matched: false,
            command_type: :CMD_TYPE_UNDEFINED,
            override: :OVERRIDING_KIND_UNDEFINED,
            qual: nil,
            target_list: [],
            update_colnos: []

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
        |> encode_matched(msg)
        |> encode_command_type(msg)
        |> encode_override(msg)
        |> encode_qual(msg)
        |> encode_target_list(msg)
        |> encode_update_colnos(msg)
      end
    )

    []

    [
      defp encode_matched(acc, msg) do
        try do
          if msg.matched == false do
            acc
          else
            [acc, "\b", Protox.Encode.encode_bool(msg.matched)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:matched, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_command_type(acc, msg) do
        try do
          if msg.command_type == :CMD_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "\x10",
              msg.command_type |> PgQuery.CmdType.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:command_type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_override(acc, msg) do
        try do
          if msg.override == :OVERRIDING_KIND_UNDEFINED do
            acc
          else
            [
              acc,
              "\x18",
              msg.override |> PgQuery.OverridingKind.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:override, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_qual(acc, msg) do
        try do
          if msg.qual == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.qual)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:qual, "invalid field value"), __STACKTRACE__
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
                  [acc, "*", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:target_list, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_update_colnos(acc, msg) do
        try do
          case msg.update_colnos do
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
            reraise Protox.EncodingError.new(:update_colnos, "invalid field value"),
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
          parse_key_value(bytes, struct(PgQuery.MergeAction))
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
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[matched: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.CmdType)
              {[command_type: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.OverridingKind)
              {[override: value], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[qual: Protox.MergeMessage.merge(msg.qual, PgQuery.Node.decode!(delimited))], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[target_list: msg.target_list ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[update_colnos: msg.update_colnos ++ [PgQuery.Node.decode!(delimited)]], rest}

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
        PgQuery.MergeAction,
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
        1 => {:matched, {:scalar, false}, :bool},
        2 => {:command_type, {:scalar, :CMD_TYPE_UNDEFINED}, {:enum, PgQuery.CmdType}},
        3 => {:override, {:scalar, :OVERRIDING_KIND_UNDEFINED}, {:enum, PgQuery.OverridingKind}},
        4 => {:qual, {:scalar, nil}, {:message, PgQuery.Node}},
        5 => {:target_list, :unpacked, {:message, PgQuery.Node}},
        6 => {:update_colnos, :unpacked, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        command_type: {2, {:scalar, :CMD_TYPE_UNDEFINED}, {:enum, PgQuery.CmdType}},
        matched: {1, {:scalar, false}, :bool},
        override: {3, {:scalar, :OVERRIDING_KIND_UNDEFINED}, {:enum, PgQuery.OverridingKind}},
        qual: {4, {:scalar, nil}, {:message, PgQuery.Node}},
        target_list: {5, :unpacked, {:message, PgQuery.Node}},
        update_colnos: {6, :unpacked, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "matched",
          kind: {:scalar, false},
          label: :optional,
          name: :matched,
          tag: 1,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "commandType",
          kind: {:scalar, :CMD_TYPE_UNDEFINED},
          label: :optional,
          name: :command_type,
          tag: 2,
          type: {:enum, PgQuery.CmdType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "override",
          kind: {:scalar, :OVERRIDING_KIND_UNDEFINED},
          label: :optional,
          name: :override,
          tag: 3,
          type: {:enum, PgQuery.OverridingKind}
        },
        %{
          __struct__: Protox.Field,
          json_name: "qual",
          kind: {:scalar, nil},
          label: :optional,
          name: :qual,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "targetList",
          kind: :unpacked,
          label: :repeated,
          name: :target_list,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "updateColnos",
          kind: :unpacked,
          label: :repeated,
          name: :update_colnos,
          tag: 6,
          type: {:message, PgQuery.Node}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:matched) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "matched",
             kind: {:scalar, false},
             label: :optional,
             name: :matched,
             tag: 1,
             type: :bool
           }}
        end

        def field_def("matched") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "matched",
             kind: {:scalar, false},
             label: :optional,
             name: :matched,
             tag: 1,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:command_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commandType",
             kind: {:scalar, :CMD_TYPE_UNDEFINED},
             label: :optional,
             name: :command_type,
             tag: 2,
             type: {:enum, PgQuery.CmdType}
           }}
        end

        def field_def("commandType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commandType",
             kind: {:scalar, :CMD_TYPE_UNDEFINED},
             label: :optional,
             name: :command_type,
             tag: 2,
             type: {:enum, PgQuery.CmdType}
           }}
        end

        def field_def("command_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commandType",
             kind: {:scalar, :CMD_TYPE_UNDEFINED},
             label: :optional,
             name: :command_type,
             tag: 2,
             type: {:enum, PgQuery.CmdType}
           }}
        end
      ),
      (
        def field_def(:override) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "override",
             kind: {:scalar, :OVERRIDING_KIND_UNDEFINED},
             label: :optional,
             name: :override,
             tag: 3,
             type: {:enum, PgQuery.OverridingKind}
           }}
        end

        def field_def("override") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "override",
             kind: {:scalar, :OVERRIDING_KIND_UNDEFINED},
             label: :optional,
             name: :override,
             tag: 3,
             type: {:enum, PgQuery.OverridingKind}
           }}
        end

        []
      ),
      (
        def field_def(:qual) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "qual",
             kind: {:scalar, nil},
             label: :optional,
             name: :qual,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("qual") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "qual",
             kind: {:scalar, nil},
             label: :optional,
             name: :qual,
             tag: 4,
             type: {:message, PgQuery.Node}
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
             tag: 5,
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
             tag: 5,
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
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:update_colnos) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "updateColnos",
             kind: :unpacked,
             label: :repeated,
             name: :update_colnos,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("updateColnos") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "updateColnos",
             kind: :unpacked,
             label: :repeated,
             name: :update_colnos,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("update_colnos") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "updateColnos",
             kind: :unpacked,
             label: :repeated,
             name: :update_colnos,
             tag: 6,
             type: {:message, PgQuery.Node}
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
    def default(:matched) do
      {:ok, false}
    end,
    def default(:command_type) do
      {:ok, :CMD_TYPE_UNDEFINED}
    end,
    def default(:override) do
      {:ok, :OVERRIDING_KIND_UNDEFINED}
    end,
    def default(:qual) do
      {:ok, nil}
    end,
    def default(:target_list) do
      {:error, :no_default_value}
    end,
    def default(:update_colnos) do
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
