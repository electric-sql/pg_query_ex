# credo:disable-for-this-file
defmodule PgQuery.CreateDomainStmt do
  @moduledoc false
  defstruct domainname: [], type_name: nil, coll_clause: nil, constraints: []

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
        |> encode_domainname(msg)
        |> encode_type_name(msg)
        |> encode_coll_clause(msg)
        |> encode_constraints(msg)
      end
    )

    []

    [
      defp encode_domainname(acc, msg) do
        try do
          case msg.domainname do
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
            reraise Protox.EncodingError.new(:domainname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_type_name(acc, msg) do
        try do
          if msg.type_name == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.type_name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:type_name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_coll_clause(acc, msg) do
        try do
          if msg.coll_clause == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.coll_clause)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:coll_clause, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_constraints(acc, msg) do
        try do
          case msg.constraints do
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
            reraise Protox.EncodingError.new(:constraints, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.CreateDomainStmt))
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
              {[domainname: msg.domainname ++ [PgQuery.Node.decode!(delimited)]], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 type_name:
                   Protox.MergeMessage.merge(msg.type_name, PgQuery.TypeName.decode!(delimited))
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 coll_clause:
                   Protox.MergeMessage.merge(
                     msg.coll_clause,
                     PgQuery.CollateClause.decode!(delimited)
                   )
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[constraints: msg.constraints ++ [PgQuery.Node.decode!(delimited)]], rest}

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
        PgQuery.CreateDomainStmt,
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
        1 => {:domainname, :unpacked, {:message, PgQuery.Node}},
        2 => {:type_name, {:scalar, nil}, {:message, PgQuery.TypeName}},
        3 => {:coll_clause, {:scalar, nil}, {:message, PgQuery.CollateClause}},
        4 => {:constraints, :unpacked, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        coll_clause: {3, {:scalar, nil}, {:message, PgQuery.CollateClause}},
        constraints: {4, :unpacked, {:message, PgQuery.Node}},
        domainname: {1, :unpacked, {:message, PgQuery.Node}},
        type_name: {2, {:scalar, nil}, {:message, PgQuery.TypeName}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "domainname",
          kind: :unpacked,
          label: :repeated,
          name: :domainname,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "typeName",
          kind: {:scalar, nil},
          label: :optional,
          name: :type_name,
          tag: 2,
          type: {:message, PgQuery.TypeName}
        },
        %{
          __struct__: Protox.Field,
          json_name: "collClause",
          kind: {:scalar, nil},
          label: :optional,
          name: :coll_clause,
          tag: 3,
          type: {:message, PgQuery.CollateClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "constraints",
          kind: :unpacked,
          label: :repeated,
          name: :constraints,
          tag: 4,
          type: {:message, PgQuery.Node}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:domainname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "domainname",
             kind: :unpacked,
             label: :repeated,
             name: :domainname,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("domainname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "domainname",
             kind: :unpacked,
             label: :repeated,
             name: :domainname,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:type_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeName",
             kind: {:scalar, nil},
             label: :optional,
             name: :type_name,
             tag: 2,
             type: {:message, PgQuery.TypeName}
           }}
        end

        def field_def("typeName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeName",
             kind: {:scalar, nil},
             label: :optional,
             name: :type_name,
             tag: 2,
             type: {:message, PgQuery.TypeName}
           }}
        end

        def field_def("type_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "typeName",
             kind: {:scalar, nil},
             label: :optional,
             name: :type_name,
             tag: 2,
             type: {:message, PgQuery.TypeName}
           }}
        end
      ),
      (
        def field_def(:coll_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :coll_clause,
             tag: 3,
             type: {:message, PgQuery.CollateClause}
           }}
        end

        def field_def("collClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :coll_clause,
             tag: 3,
             type: {:message, PgQuery.CollateClause}
           }}
        end

        def field_def("coll_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :coll_clause,
             tag: 3,
             type: {:message, PgQuery.CollateClause}
           }}
        end
      ),
      (
        def field_def(:constraints) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "constraints",
             kind: :unpacked,
             label: :repeated,
             name: :constraints,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("constraints") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "constraints",
             kind: :unpacked,
             label: :repeated,
             name: :constraints,
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
    def default(:domainname) do
      {:error, :no_default_value}
    end,
    def default(:type_name) do
      {:ok, nil}
    end,
    def default(:coll_clause) do
      {:ok, nil}
    end,
    def default(:constraints) do
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
