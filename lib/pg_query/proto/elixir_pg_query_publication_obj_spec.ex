# credo:disable-for-this-file
defmodule PgQuery.PublicationObjSpec do
  @moduledoc false
  defstruct pubobjtype: :PUBLICATION_OBJ_SPEC_TYPE_UNDEFINED, name: "", pubtable: nil, location: 0

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
        |> encode_pubobjtype(msg)
        |> encode_name(msg)
        |> encode_pubtable(msg)
        |> encode_location(msg)
      end
    )

    []

    [
      defp encode_pubobjtype(acc, msg) do
        try do
          if msg.pubobjtype == :PUBLICATION_OBJ_SPEC_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "\b",
              msg.pubobjtype
              |> PgQuery.PublicationObjSpecType.encode()
              |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:pubobjtype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_name(acc, msg) do
        try do
          if msg.name == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_pubtable(acc, msg) do
        try do
          if msg.pubtable == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.pubtable)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:pubtable, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_int32(msg.location)]
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
          parse_key_value(bytes, struct(PgQuery.PublicationObjSpec))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.PublicationObjSpecType)
              {[pubobjtype: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[name: delimited], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 pubtable:
                   Protox.MergeMessage.merge(
                     msg.pubtable,
                     PgQuery.PublicationTable.decode!(delimited)
                   )
               ], rest}

            {4, _, bytes} ->
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
        PgQuery.PublicationObjSpec,
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
          {:pubobjtype, {:scalar, :PUBLICATION_OBJ_SPEC_TYPE_UNDEFINED},
           {:enum, PgQuery.PublicationObjSpecType}},
        2 => {:name, {:scalar, ""}, :string},
        3 => {:pubtable, {:scalar, nil}, {:message, PgQuery.PublicationTable}},
        4 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        location: {4, {:scalar, 0}, :int32},
        name: {2, {:scalar, ""}, :string},
        pubobjtype:
          {1, {:scalar, :PUBLICATION_OBJ_SPEC_TYPE_UNDEFINED},
           {:enum, PgQuery.PublicationObjSpecType}},
        pubtable: {3, {:scalar, nil}, {:message, PgQuery.PublicationTable}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "pubobjtype",
          kind: {:scalar, :PUBLICATION_OBJ_SPEC_TYPE_UNDEFINED},
          label: :optional,
          name: :pubobjtype,
          tag: 1,
          type: {:enum, PgQuery.PublicationObjSpecType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "name",
          kind: {:scalar, ""},
          label: :optional,
          name: :name,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "pubtable",
          kind: {:scalar, nil},
          label: :optional,
          name: :pubtable,
          tag: 3,
          type: {:message, PgQuery.PublicationTable}
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 4,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:pubobjtype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pubobjtype",
             kind: {:scalar, :PUBLICATION_OBJ_SPEC_TYPE_UNDEFINED},
             label: :optional,
             name: :pubobjtype,
             tag: 1,
             type: {:enum, PgQuery.PublicationObjSpecType}
           }}
        end

        def field_def("pubobjtype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pubobjtype",
             kind: {:scalar, :PUBLICATION_OBJ_SPEC_TYPE_UNDEFINED},
             label: :optional,
             name: :pubobjtype,
             tag: 1,
             type: {:enum, PgQuery.PublicationObjSpecType}
           }}
        end

        []
      ),
      (
        def field_def(:name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, ""},
             label: :optional,
             name: :name,
             tag: 2,
             type: :string
           }}
        end

        def field_def("name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, ""},
             label: :optional,
             name: :name,
             tag: 2,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:pubtable) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pubtable",
             kind: {:scalar, nil},
             label: :optional,
             name: :pubtable,
             tag: 3,
             type: {:message, PgQuery.PublicationTable}
           }}
        end

        def field_def("pubtable") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pubtable",
             kind: {:scalar, nil},
             label: :optional,
             name: :pubtable,
             tag: 3,
             type: {:message, PgQuery.PublicationTable}
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
             kind: {:scalar, 0},
             label: :optional,
             name: :location,
             tag: 4,
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
             tag: 4,
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
    def default(:pubobjtype) do
      {:ok, :PUBLICATION_OBJ_SPEC_TYPE_UNDEFINED}
    end,
    def default(:name) do
      {:ok, ""}
    end,
    def default(:pubtable) do
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
