# credo:disable-for-this-file
defmodule PgQuery.CreateTableSpaceStmt do
  @moduledoc false
  defstruct tablespacename: "", owner: nil, location: "", options: []

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
        |> encode_tablespacename(msg)
        |> encode_owner(msg)
        |> encode_location(msg)
        |> encode_options(msg)
      end
    )

    []

    [
      defp encode_tablespacename(acc, msg) do
        try do
          if msg.tablespacename == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.tablespacename)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:tablespacename, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_owner(acc, msg) do
        try do
          if msg.owner == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.owner)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:owner, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.location)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:location, "invalid field value"), __STACKTRACE__
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
                  [acc, "\"", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:options, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.CreateTableSpaceStmt))
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
              {[tablespacename: delimited], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[owner: Protox.MergeMessage.merge(msg.owner, PgQuery.RoleSpec.decode!(delimited))],
               rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[location: delimited], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[options: msg.options ++ [PgQuery.Node.decode!(delimited)]], rest}

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
        PgQuery.CreateTableSpaceStmt,
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
        1 => {:tablespacename, {:scalar, ""}, :string},
        2 => {:owner, {:scalar, nil}, {:message, PgQuery.RoleSpec}},
        3 => {:location, {:scalar, ""}, :string},
        4 => {:options, :unpacked, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        location: {3, {:scalar, ""}, :string},
        options: {4, :unpacked, {:message, PgQuery.Node}},
        owner: {2, {:scalar, nil}, {:message, PgQuery.RoleSpec}},
        tablespacename: {1, {:scalar, ""}, :string}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "tablespacename",
          kind: {:scalar, ""},
          label: :optional,
          name: :tablespacename,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "owner",
          kind: {:scalar, nil},
          label: :optional,
          name: :owner,
          tag: 2,
          type: {:message, PgQuery.RoleSpec}
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, ""},
          label: :optional,
          name: :location,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "options",
          kind: :unpacked,
          label: :repeated,
          name: :options,
          tag: 4,
          type: {:message, PgQuery.Node}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:tablespacename) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tablespacename",
             kind: {:scalar, ""},
             label: :optional,
             name: :tablespacename,
             tag: 1,
             type: :string
           }}
        end

        def field_def("tablespacename") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tablespacename",
             kind: {:scalar, ""},
             label: :optional,
             name: :tablespacename,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:owner) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "owner",
             kind: {:scalar, nil},
             label: :optional,
             name: :owner,
             tag: 2,
             type: {:message, PgQuery.RoleSpec}
           }}
        end

        def field_def("owner") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "owner",
             kind: {:scalar, nil},
             label: :optional,
             name: :owner,
             tag: 2,
             type: {:message, PgQuery.RoleSpec}
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
             kind: {:scalar, ""},
             label: :optional,
             name: :location,
             tag: 3,
             type: :string
           }}
        end

        def field_def("location") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "location",
             kind: {:scalar, ""},
             label: :optional,
             name: :location,
             tag: 3,
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
             tag: 4,
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
             tag: 4,
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
    def default(:tablespacename) do
      {:ok, ""}
    end,
    def default(:owner) do
      {:ok, nil}
    end,
    def default(:location) do
      {:ok, ""}
    end,
    def default(:options) do
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
