# credo:disable-for-this-file
defmodule PgQuery.SortBy do
  @moduledoc false
  defstruct node: nil,
            sortby_dir: :SORT_BY_DIR_UNDEFINED,
            sortby_nulls: :SORT_BY_NULLS_UNDEFINED,
            use_op: [],
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
        |> encode_node(msg)
        |> encode_sortby_dir(msg)
        |> encode_sortby_nulls(msg)
        |> encode_use_op(msg)
        |> encode_location(msg)
      end
    )

    []

    [
      defp encode_node(acc, msg) do
        try do
          if msg.node == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.node)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:node, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_sortby_dir(acc, msg) do
        try do
          if msg.sortby_dir == :SORT_BY_DIR_UNDEFINED do
            acc
          else
            [
              acc,
              "\x10",
              msg.sortby_dir |> PgQuery.SortByDir.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sortby_dir, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_sortby_nulls(acc, msg) do
        try do
          if msg.sortby_nulls == :SORT_BY_NULLS_UNDEFINED do
            acc
          else
            [
              acc,
              "\x18",
              msg.sortby_nulls |> PgQuery.SortByNulls.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sortby_nulls, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_use_op(acc, msg) do
        try do
          case msg.use_op do
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
            reraise Protox.EncodingError.new(:use_op, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.SortBy))
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
              {[node: Protox.MergeMessage.merge(msg.node, PgQuery.Node.decode!(delimited))], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.SortByDir)
              {[sortby_dir: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.SortByNulls)
              {[sortby_nulls: value], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[use_op: msg.use_op ++ [PgQuery.Node.decode!(delimited)]], rest}

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
        PgQuery.SortBy,
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
        1 => {:node, {:scalar, nil}, {:message, PgQuery.Node}},
        2 => {:sortby_dir, {:scalar, :SORT_BY_DIR_UNDEFINED}, {:enum, PgQuery.SortByDir}},
        3 => {:sortby_nulls, {:scalar, :SORT_BY_NULLS_UNDEFINED}, {:enum, PgQuery.SortByNulls}},
        4 => {:use_op, :unpacked, {:message, PgQuery.Node}},
        5 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        location: {5, {:scalar, 0}, :int32},
        node: {1, {:scalar, nil}, {:message, PgQuery.Node}},
        sortby_dir: {2, {:scalar, :SORT_BY_DIR_UNDEFINED}, {:enum, PgQuery.SortByDir}},
        sortby_nulls: {3, {:scalar, :SORT_BY_NULLS_UNDEFINED}, {:enum, PgQuery.SortByNulls}},
        use_op: {4, :unpacked, {:message, PgQuery.Node}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "node",
          kind: {:scalar, nil},
          label: :optional,
          name: :node,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "sortbyDir",
          kind: {:scalar, :SORT_BY_DIR_UNDEFINED},
          label: :optional,
          name: :sortby_dir,
          tag: 2,
          type: {:enum, PgQuery.SortByDir}
        },
        %{
          __struct__: Protox.Field,
          json_name: "sortbyNulls",
          kind: {:scalar, :SORT_BY_NULLS_UNDEFINED},
          label: :optional,
          name: :sortby_nulls,
          tag: 3,
          type: {:enum, PgQuery.SortByNulls}
        },
        %{
          __struct__: Protox.Field,
          json_name: "useOp",
          kind: :unpacked,
          label: :repeated,
          name: :use_op,
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
        def field_def(:node) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "node",
             kind: {:scalar, nil},
             label: :optional,
             name: :node,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("node") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "node",
             kind: {:scalar, nil},
             label: :optional,
             name: :node,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:sortby_dir) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sortbyDir",
             kind: {:scalar, :SORT_BY_DIR_UNDEFINED},
             label: :optional,
             name: :sortby_dir,
             tag: 2,
             type: {:enum, PgQuery.SortByDir}
           }}
        end

        def field_def("sortbyDir") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sortbyDir",
             kind: {:scalar, :SORT_BY_DIR_UNDEFINED},
             label: :optional,
             name: :sortby_dir,
             tag: 2,
             type: {:enum, PgQuery.SortByDir}
           }}
        end

        def field_def("sortby_dir") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sortbyDir",
             kind: {:scalar, :SORT_BY_DIR_UNDEFINED},
             label: :optional,
             name: :sortby_dir,
             tag: 2,
             type: {:enum, PgQuery.SortByDir}
           }}
        end
      ),
      (
        def field_def(:sortby_nulls) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sortbyNulls",
             kind: {:scalar, :SORT_BY_NULLS_UNDEFINED},
             label: :optional,
             name: :sortby_nulls,
             tag: 3,
             type: {:enum, PgQuery.SortByNulls}
           }}
        end

        def field_def("sortbyNulls") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sortbyNulls",
             kind: {:scalar, :SORT_BY_NULLS_UNDEFINED},
             label: :optional,
             name: :sortby_nulls,
             tag: 3,
             type: {:enum, PgQuery.SortByNulls}
           }}
        end

        def field_def("sortby_nulls") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sortbyNulls",
             kind: {:scalar, :SORT_BY_NULLS_UNDEFINED},
             label: :optional,
             name: :sortby_nulls,
             tag: 3,
             type: {:enum, PgQuery.SortByNulls}
           }}
        end
      ),
      (
        def field_def(:use_op) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "useOp",
             kind: :unpacked,
             label: :repeated,
             name: :use_op,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("useOp") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "useOp",
             kind: :unpacked,
             label: :repeated,
             name: :use_op,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("use_op") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "useOp",
             kind: :unpacked,
             label: :repeated,
             name: :use_op,
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
    def default(:node) do
      {:ok, nil}
    end,
    def default(:sortby_dir) do
      {:ok, :SORT_BY_DIR_UNDEFINED}
    end,
    def default(:sortby_nulls) do
      {:ok, :SORT_BY_NULLS_UNDEFINED}
    end,
    def default(:use_op) do
      {:error, :no_default_value}
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
