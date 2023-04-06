# credo:disable-for-this-file
defmodule PgQuery.AlterPublicationStmt do
  @moduledoc false
  defstruct pubname: "",
            options: [],
            pubobjects: [],
            for_all_tables: false,
            action: :ALTER_PUBLICATION_ACTION_UNDEFINED

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
        |> encode_pubname(msg)
        |> encode_options(msg)
        |> encode_pubobjects(msg)
        |> encode_for_all_tables(msg)
        |> encode_action(msg)
      end
    )

    []

    [
      defp encode_pubname(acc, msg) do
        try do
          if msg.pubname == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.pubname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:pubname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_options(acc, msg) do
        try do
          case msg.options do
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
            reraise Protox.EncodingError.new(:options, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_pubobjects(acc, msg) do
        try do
          case msg.pubobjects do
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
            reraise Protox.EncodingError.new(:pubobjects, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_for_all_tables(acc, msg) do
        try do
          if msg.for_all_tables == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.for_all_tables)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:for_all_tables, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_action(acc, msg) do
        try do
          if msg.action == :ALTER_PUBLICATION_ACTION_UNDEFINED do
            acc
          else
            [
              acc,
              "(",
              msg.action |> PgQuery.AlterPublicationAction.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:action, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.AlterPublicationStmt))
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
              {[pubname: delimited], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[options: msg.options ++ [PgQuery.Node.decode!(delimited)]], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[pubobjects: msg.pubobjects ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[for_all_tables: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.AlterPublicationAction)
              {[action: value], rest}

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
        PgQuery.AlterPublicationStmt,
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
        1 => {:pubname, {:scalar, ""}, :string},
        2 => {:options, :unpacked, {:message, PgQuery.Node}},
        3 => {:pubobjects, :unpacked, {:message, PgQuery.Node}},
        4 => {:for_all_tables, {:scalar, false}, :bool},
        5 =>
          {:action, {:scalar, :ALTER_PUBLICATION_ACTION_UNDEFINED},
           {:enum, PgQuery.AlterPublicationAction}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        action:
          {5, {:scalar, :ALTER_PUBLICATION_ACTION_UNDEFINED},
           {:enum, PgQuery.AlterPublicationAction}},
        for_all_tables: {4, {:scalar, false}, :bool},
        options: {2, :unpacked, {:message, PgQuery.Node}},
        pubname: {1, {:scalar, ""}, :string},
        pubobjects: {3, :unpacked, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "pubname",
          kind: {:scalar, ""},
          label: :optional,
          name: :pubname,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "options",
          kind: :unpacked,
          label: :repeated,
          name: :options,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "pubobjects",
          kind: :unpacked,
          label: :repeated,
          name: :pubobjects,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "forAllTables",
          kind: {:scalar, false},
          label: :optional,
          name: :for_all_tables,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "action",
          kind: {:scalar, :ALTER_PUBLICATION_ACTION_UNDEFINED},
          label: :optional,
          name: :action,
          tag: 5,
          type: {:enum, PgQuery.AlterPublicationAction}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:pubname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pubname",
             kind: {:scalar, ""},
             label: :optional,
             name: :pubname,
             tag: 1,
             type: :string
           }}
        end

        def field_def("pubname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pubname",
             kind: {:scalar, ""},
             label: :optional,
             name: :pubname,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:options) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "options",
             kind: :unpacked,
             label: :repeated,
             name: :options,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("options") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "options",
             kind: :unpacked,
             label: :repeated,
             name: :options,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:pubobjects) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pubobjects",
             kind: :unpacked,
             label: :repeated,
             name: :pubobjects,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("pubobjects") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pubobjects",
             kind: :unpacked,
             label: :repeated,
             name: :pubobjects,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:for_all_tables) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "forAllTables",
             kind: {:scalar, false},
             label: :optional,
             name: :for_all_tables,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("forAllTables") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "forAllTables",
             kind: {:scalar, false},
             label: :optional,
             name: :for_all_tables,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("for_all_tables") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "forAllTables",
             kind: {:scalar, false},
             label: :optional,
             name: :for_all_tables,
             tag: 4,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:action) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "action",
             kind: {:scalar, :ALTER_PUBLICATION_ACTION_UNDEFINED},
             label: :optional,
             name: :action,
             tag: 5,
             type: {:enum, PgQuery.AlterPublicationAction}
           }}
        end

        def field_def("action") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "action",
             kind: {:scalar, :ALTER_PUBLICATION_ACTION_UNDEFINED},
             label: :optional,
             name: :action,
             tag: 5,
             type: {:enum, PgQuery.AlterPublicationAction}
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
    def default(:pubname) do
      {:ok, ""}
    end,
    def default(:options) do
      {:error, :no_default_value}
    end,
    def default(:pubobjects) do
      {:error, :no_default_value}
    end,
    def default(:for_all_tables) do
      {:ok, false}
    end,
    def default(:action) do
      {:ok, :ALTER_PUBLICATION_ACTION_UNDEFINED}
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
