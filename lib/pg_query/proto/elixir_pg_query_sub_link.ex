# credo:disable-for-this-file
defmodule PgQuery.SubLink do
  @moduledoc false
  defstruct xpr: nil,
            sub_link_type: :SUB_LINK_TYPE_UNDEFINED,
            sub_link_id: 0,
            testexpr: nil,
            oper_name: [],
            subselect: nil,
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
        |> encode_xpr(msg)
        |> encode_sub_link_type(msg)
        |> encode_sub_link_id(msg)
        |> encode_testexpr(msg)
        |> encode_oper_name(msg)
        |> encode_subselect(msg)
        |> encode_location(msg)
      end
    )

    []

    [
      defp encode_xpr(acc, msg) do
        try do
          if msg.xpr == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.xpr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:xpr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_sub_link_type(acc, msg) do
        try do
          if msg.sub_link_type == :SUB_LINK_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "\x10",
              msg.sub_link_type |> PgQuery.SubLinkType.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sub_link_type, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_sub_link_id(acc, msg) do
        try do
          if msg.sub_link_id == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_int32(msg.sub_link_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sub_link_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_testexpr(acc, msg) do
        try do
          if msg.testexpr == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.testexpr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:testexpr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_oper_name(acc, msg) do
        try do
          case msg.oper_name do
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
            reraise Protox.EncodingError.new(:oper_name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_subselect(acc, msg) do
        try do
          if msg.subselect == nil do
            acc
          else
            [acc, "2", Protox.Encode.encode_message(msg.subselect)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:subselect, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "8", Protox.Encode.encode_int32(msg.location)]
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
          parse_key_value(bytes, struct(PgQuery.SubLink))
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
              {[xpr: Protox.MergeMessage.merge(msg.xpr, PgQuery.Node.decode!(delimited))], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.SubLinkType)
              {[sub_link_type: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[sub_link_id: value], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 testexpr:
                   Protox.MergeMessage.merge(msg.testexpr, PgQuery.Node.decode!(delimited))
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[oper_name: msg.oper_name ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 subselect:
                   Protox.MergeMessage.merge(msg.subselect, PgQuery.Node.decode!(delimited))
               ], rest}

            {7, _, bytes} ->
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
        PgQuery.SubLink,
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
        1 => {:xpr, {:scalar, nil}, {:message, PgQuery.Node}},
        2 => {:sub_link_type, {:scalar, :SUB_LINK_TYPE_UNDEFINED}, {:enum, PgQuery.SubLinkType}},
        3 => {:sub_link_id, {:scalar, 0}, :int32},
        4 => {:testexpr, {:scalar, nil}, {:message, PgQuery.Node}},
        5 => {:oper_name, :unpacked, {:message, PgQuery.Node}},
        6 => {:subselect, {:scalar, nil}, {:message, PgQuery.Node}},
        7 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        location: {7, {:scalar, 0}, :int32},
        oper_name: {5, :unpacked, {:message, PgQuery.Node}},
        sub_link_id: {3, {:scalar, 0}, :int32},
        sub_link_type: {2, {:scalar, :SUB_LINK_TYPE_UNDEFINED}, {:enum, PgQuery.SubLinkType}},
        subselect: {6, {:scalar, nil}, {:message, PgQuery.Node}},
        testexpr: {4, {:scalar, nil}, {:message, PgQuery.Node}},
        xpr: {1, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "xpr",
          kind: {:scalar, nil},
          label: :optional,
          name: :xpr,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "subLinkType",
          kind: {:scalar, :SUB_LINK_TYPE_UNDEFINED},
          label: :optional,
          name: :sub_link_type,
          tag: 2,
          type: {:enum, PgQuery.SubLinkType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "subLinkId",
          kind: {:scalar, 0},
          label: :optional,
          name: :sub_link_id,
          tag: 3,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "testexpr",
          kind: {:scalar, nil},
          label: :optional,
          name: :testexpr,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "operName",
          kind: :unpacked,
          label: :repeated,
          name: :oper_name,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "subselect",
          kind: {:scalar, nil},
          label: :optional,
          name: :subselect,
          tag: 6,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 7,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:xpr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :xpr,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("xpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :xpr,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:sub_link_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subLinkType",
             kind: {:scalar, :SUB_LINK_TYPE_UNDEFINED},
             label: :optional,
             name: :sub_link_type,
             tag: 2,
             type: {:enum, PgQuery.SubLinkType}
           }}
        end

        def field_def("subLinkType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subLinkType",
             kind: {:scalar, :SUB_LINK_TYPE_UNDEFINED},
             label: :optional,
             name: :sub_link_type,
             tag: 2,
             type: {:enum, PgQuery.SubLinkType}
           }}
        end

        def field_def("sub_link_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subLinkType",
             kind: {:scalar, :SUB_LINK_TYPE_UNDEFINED},
             label: :optional,
             name: :sub_link_type,
             tag: 2,
             type: {:enum, PgQuery.SubLinkType}
           }}
        end
      ),
      (
        def field_def(:sub_link_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subLinkId",
             kind: {:scalar, 0},
             label: :optional,
             name: :sub_link_id,
             tag: 3,
             type: :int32
           }}
        end

        def field_def("subLinkId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subLinkId",
             kind: {:scalar, 0},
             label: :optional,
             name: :sub_link_id,
             tag: 3,
             type: :int32
           }}
        end

        def field_def("sub_link_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subLinkId",
             kind: {:scalar, 0},
             label: :optional,
             name: :sub_link_id,
             tag: 3,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:testexpr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "testexpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :testexpr,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("testexpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "testexpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :testexpr,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:oper_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "operName",
             kind: :unpacked,
             label: :repeated,
             name: :oper_name,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("operName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "operName",
             kind: :unpacked,
             label: :repeated,
             name: :oper_name,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("oper_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "operName",
             kind: :unpacked,
             label: :repeated,
             name: :oper_name,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:subselect) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subselect",
             kind: {:scalar, nil},
             label: :optional,
             name: :subselect,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("subselect") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subselect",
             kind: {:scalar, nil},
             label: :optional,
             name: :subselect,
             tag: 6,
             type: {:message, PgQuery.Node}
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
             tag: 7,
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
             tag: 7,
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
    def default(:xpr) do
      {:ok, nil}
    end,
    def default(:sub_link_type) do
      {:ok, :SUB_LINK_TYPE_UNDEFINED}
    end,
    def default(:sub_link_id) do
      {:ok, 0}
    end,
    def default(:testexpr) do
      {:ok, nil}
    end,
    def default(:oper_name) do
      {:error, :no_default_value}
    end,
    def default(:subselect) do
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
