# credo:disable-for-this-file
defmodule PgQuery.AlterTableMoveAllStmt do
  @moduledoc false
  defstruct orig_tablespacename: "",
            objtype: :OBJECT_TYPE_UNDEFINED,
            roles: [],
            new_tablespacename: "",
            nowait: false

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
        |> encode_orig_tablespacename(msg)
        |> encode_objtype(msg)
        |> encode_roles(msg)
        |> encode_new_tablespacename(msg)
        |> encode_nowait(msg)
      end
    )

    []

    [
      defp encode_orig_tablespacename(acc, msg) do
        try do
          if msg.orig_tablespacename == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.orig_tablespacename)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:orig_tablespacename, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_objtype(acc, msg) do
        try do
          if msg.objtype == :OBJECT_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "\x10",
              msg.objtype |> PgQuery.ObjectType.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:objtype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_roles(acc, msg) do
        try do
          case msg.roles do
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
            reraise Protox.EncodingError.new(:roles, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_new_tablespacename(acc, msg) do
        try do
          if msg.new_tablespacename == "" do
            acc
          else
            [acc, "\"", Protox.Encode.encode_string(msg.new_tablespacename)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:new_tablespacename, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_nowait(acc, msg) do
        try do
          if msg.nowait == false do
            acc
          else
            [acc, "(", Protox.Encode.encode_bool(msg.nowait)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:nowait, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.AlterTableMoveAllStmt))
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
              {[orig_tablespacename: delimited], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.ObjectType)
              {[objtype: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[roles: msg.roles ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[new_tablespacename: delimited], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[nowait: value], rest}

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
        PgQuery.AlterTableMoveAllStmt,
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
        1 => {:orig_tablespacename, {:scalar, ""}, :string},
        2 => {:objtype, {:scalar, :OBJECT_TYPE_UNDEFINED}, {:enum, PgQuery.ObjectType}},
        3 => {:roles, :unpacked, {:message, PgQuery.Node}},
        4 => {:new_tablespacename, {:scalar, ""}, :string},
        5 => {:nowait, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        new_tablespacename: {4, {:scalar, ""}, :string},
        nowait: {5, {:scalar, false}, :bool},
        objtype: {2, {:scalar, :OBJECT_TYPE_UNDEFINED}, {:enum, PgQuery.ObjectType}},
        orig_tablespacename: {1, {:scalar, ""}, :string},
        roles: {3, :unpacked, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "origTablespacename",
          kind: {:scalar, ""},
          label: :optional,
          name: :orig_tablespacename,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "objtype",
          kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
          label: :optional,
          name: :objtype,
          tag: 2,
          type: {:enum, PgQuery.ObjectType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "roles",
          kind: :unpacked,
          label: :repeated,
          name: :roles,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "newTablespacename",
          kind: {:scalar, ""},
          label: :optional,
          name: :new_tablespacename,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "nowait",
          kind: {:scalar, false},
          label: :optional,
          name: :nowait,
          tag: 5,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:orig_tablespacename) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "origTablespacename",
             kind: {:scalar, ""},
             label: :optional,
             name: :orig_tablespacename,
             tag: 1,
             type: :string
           }}
        end

        def field_def("origTablespacename") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "origTablespacename",
             kind: {:scalar, ""},
             label: :optional,
             name: :orig_tablespacename,
             tag: 1,
             type: :string
           }}
        end

        def field_def("orig_tablespacename") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "origTablespacename",
             kind: {:scalar, ""},
             label: :optional,
             name: :orig_tablespacename,
             tag: 1,
             type: :string
           }}
        end
      ),
      (
        def field_def(:objtype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "objtype",
             kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
             label: :optional,
             name: :objtype,
             tag: 2,
             type: {:enum, PgQuery.ObjectType}
           }}
        end

        def field_def("objtype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "objtype",
             kind: {:scalar, :OBJECT_TYPE_UNDEFINED},
             label: :optional,
             name: :objtype,
             tag: 2,
             type: {:enum, PgQuery.ObjectType}
           }}
        end

        []
      ),
      (
        def field_def(:roles) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roles",
             kind: :unpacked,
             label: :repeated,
             name: :roles,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("roles") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roles",
             kind: :unpacked,
             label: :repeated,
             name: :roles,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:new_tablespacename) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "newTablespacename",
             kind: {:scalar, ""},
             label: :optional,
             name: :new_tablespacename,
             tag: 4,
             type: :string
           }}
        end

        def field_def("newTablespacename") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "newTablespacename",
             kind: {:scalar, ""},
             label: :optional,
             name: :new_tablespacename,
             tag: 4,
             type: :string
           }}
        end

        def field_def("new_tablespacename") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "newTablespacename",
             kind: {:scalar, ""},
             label: :optional,
             name: :new_tablespacename,
             tag: 4,
             type: :string
           }}
        end
      ),
      (
        def field_def(:nowait) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nowait",
             kind: {:scalar, false},
             label: :optional,
             name: :nowait,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("nowait") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nowait",
             kind: {:scalar, false},
             label: :optional,
             name: :nowait,
             tag: 5,
             type: :bool
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
    def default(:orig_tablespacename) do
      {:ok, ""}
    end,
    def default(:objtype) do
      {:ok, :OBJECT_TYPE_UNDEFINED}
    end,
    def default(:roles) do
      {:error, :no_default_value}
    end,
    def default(:new_tablespacename) do
      {:ok, ""}
    end,
    def default(:nowait) do
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
