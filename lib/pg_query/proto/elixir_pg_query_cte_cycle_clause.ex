# credo:disable-for-this-file
defmodule PgQuery.CTECycleClause do
  @moduledoc false
  defstruct cycle_col_list: [],
            cycle_mark_column: "",
            cycle_mark_value: nil,
            cycle_mark_default: nil,
            cycle_path_column: "",
            location: 0,
            cycle_mark_type: 0,
            cycle_mark_typmod: 0,
            cycle_mark_collation: 0,
            cycle_mark_neop: 0

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
        |> encode_cycle_col_list(msg)
        |> encode_cycle_mark_column(msg)
        |> encode_cycle_mark_value(msg)
        |> encode_cycle_mark_default(msg)
        |> encode_cycle_path_column(msg)
        |> encode_location(msg)
        |> encode_cycle_mark_type(msg)
        |> encode_cycle_mark_typmod(msg)
        |> encode_cycle_mark_collation(msg)
        |> encode_cycle_mark_neop(msg)
      end
    )

    []

    [
      defp encode_cycle_col_list(acc, msg) do
        try do
          case msg.cycle_col_list do
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
            reraise Protox.EncodingError.new(:cycle_col_list, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_cycle_mark_column(acc, msg) do
        try do
          if msg.cycle_mark_column == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.cycle_mark_column)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:cycle_mark_column, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_cycle_mark_value(acc, msg) do
        try do
          if msg.cycle_mark_value == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.cycle_mark_value)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:cycle_mark_value, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_cycle_mark_default(acc, msg) do
        try do
          if msg.cycle_mark_default == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.cycle_mark_default)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:cycle_mark_default, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_cycle_path_column(acc, msg) do
        try do
          if msg.cycle_path_column == "" do
            acc
          else
            [acc, "*", Protox.Encode.encode_string(msg.cycle_path_column)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:cycle_path_column, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_int32(msg.location)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:location, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_cycle_mark_type(acc, msg) do
        try do
          if msg.cycle_mark_type == 0 do
            acc
          else
            [acc, "8", Protox.Encode.encode_uint32(msg.cycle_mark_type)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:cycle_mark_type, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_cycle_mark_typmod(acc, msg) do
        try do
          if msg.cycle_mark_typmod == 0 do
            acc
          else
            [acc, "@", Protox.Encode.encode_int32(msg.cycle_mark_typmod)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:cycle_mark_typmod, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_cycle_mark_collation(acc, msg) do
        try do
          if msg.cycle_mark_collation == 0 do
            acc
          else
            [acc, "H", Protox.Encode.encode_uint32(msg.cycle_mark_collation)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:cycle_mark_collation, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_cycle_mark_neop(acc, msg) do
        try do
          if msg.cycle_mark_neop == 0 do
            acc
          else
            [acc, "P", Protox.Encode.encode_uint32(msg.cycle_mark_neop)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:cycle_mark_neop, "invalid field value"),
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
          parse_key_value(bytes, struct(PgQuery.CTECycleClause))
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
              {[cycle_col_list: msg.cycle_col_list ++ [PgQuery.Node.decode!(delimited)]], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[cycle_mark_column: delimited], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 cycle_mark_value:
                   Protox.MergeMessage.merge(
                     msg.cycle_mark_value,
                     PgQuery.Node.decode!(delimited)
                   )
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 cycle_mark_default:
                   Protox.MergeMessage.merge(
                     msg.cycle_mark_default,
                     PgQuery.Node.decode!(delimited)
                   )
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[cycle_path_column: delimited], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[location: value], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[cycle_mark_type: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[cycle_mark_typmod: value], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[cycle_mark_collation: value], rest}

            {10, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[cycle_mark_neop: value], rest}

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
        PgQuery.CTECycleClause,
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
        1 => {:cycle_col_list, :unpacked, {:message, PgQuery.Node}},
        2 => {:cycle_mark_column, {:scalar, ""}, :string},
        3 => {:cycle_mark_value, {:scalar, nil}, {:message, PgQuery.Node}},
        4 => {:cycle_mark_default, {:scalar, nil}, {:message, PgQuery.Node}},
        5 => {:cycle_path_column, {:scalar, ""}, :string},
        6 => {:location, {:scalar, 0}, :int32},
        7 => {:cycle_mark_type, {:scalar, 0}, :uint32},
        8 => {:cycle_mark_typmod, {:scalar, 0}, :int32},
        9 => {:cycle_mark_collation, {:scalar, 0}, :uint32},
        10 => {:cycle_mark_neop, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        cycle_col_list: {1, :unpacked, {:message, PgQuery.Node}},
        cycle_mark_collation: {9, {:scalar, 0}, :uint32},
        cycle_mark_column: {2, {:scalar, ""}, :string},
        cycle_mark_default: {4, {:scalar, nil}, {:message, PgQuery.Node}},
        cycle_mark_neop: {10, {:scalar, 0}, :uint32},
        cycle_mark_type: {7, {:scalar, 0}, :uint32},
        cycle_mark_typmod: {8, {:scalar, 0}, :int32},
        cycle_mark_value: {3, {:scalar, nil}, {:message, PgQuery.Node}},
        cycle_path_column: {5, {:scalar, ""}, :string},
        location: {6, {:scalar, 0}, :int32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "cycleColList",
          kind: :unpacked,
          label: :repeated,
          name: :cycle_col_list,
          tag: 1,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "cycleMarkColumn",
          kind: {:scalar, ""},
          label: :optional,
          name: :cycle_mark_column,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "cycleMarkValue",
          kind: {:scalar, nil},
          label: :optional,
          name: :cycle_mark_value,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "cycleMarkDefault",
          kind: {:scalar, nil},
          label: :optional,
          name: :cycle_mark_default,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "cyclePathColumn",
          kind: {:scalar, ""},
          label: :optional,
          name: :cycle_path_column,
          tag: 5,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 6,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "cycleMarkType",
          kind: {:scalar, 0},
          label: :optional,
          name: :cycle_mark_type,
          tag: 7,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "cycleMarkTypmod",
          kind: {:scalar, 0},
          label: :optional,
          name: :cycle_mark_typmod,
          tag: 8,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "cycleMarkCollation",
          kind: {:scalar, 0},
          label: :optional,
          name: :cycle_mark_collation,
          tag: 9,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "cycleMarkNeop",
          kind: {:scalar, 0},
          label: :optional,
          name: :cycle_mark_neop,
          tag: 10,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:cycle_col_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleColList",
             kind: :unpacked,
             label: :repeated,
             name: :cycle_col_list,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("cycleColList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleColList",
             kind: :unpacked,
             label: :repeated,
             name: :cycle_col_list,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("cycle_col_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleColList",
             kind: :unpacked,
             label: :repeated,
             name: :cycle_col_list,
             tag: 1,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:cycle_mark_column) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleMarkColumn",
             kind: {:scalar, ""},
             label: :optional,
             name: :cycle_mark_column,
             tag: 2,
             type: :string
           }}
        end

        def field_def("cycleMarkColumn") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleMarkColumn",
             kind: {:scalar, ""},
             label: :optional,
             name: :cycle_mark_column,
             tag: 2,
             type: :string
           }}
        end

        def field_def("cycle_mark_column") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleMarkColumn",
             kind: {:scalar, ""},
             label: :optional,
             name: :cycle_mark_column,
             tag: 2,
             type: :string
           }}
        end
      ),
      (
        def field_def(:cycle_mark_value) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleMarkValue",
             kind: {:scalar, nil},
             label: :optional,
             name: :cycle_mark_value,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("cycleMarkValue") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleMarkValue",
             kind: {:scalar, nil},
             label: :optional,
             name: :cycle_mark_value,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("cycle_mark_value") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleMarkValue",
             kind: {:scalar, nil},
             label: :optional,
             name: :cycle_mark_value,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:cycle_mark_default) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleMarkDefault",
             kind: {:scalar, nil},
             label: :optional,
             name: :cycle_mark_default,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("cycleMarkDefault") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleMarkDefault",
             kind: {:scalar, nil},
             label: :optional,
             name: :cycle_mark_default,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("cycle_mark_default") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleMarkDefault",
             kind: {:scalar, nil},
             label: :optional,
             name: :cycle_mark_default,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end
      ),
      (
        def field_def(:cycle_path_column) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cyclePathColumn",
             kind: {:scalar, ""},
             label: :optional,
             name: :cycle_path_column,
             tag: 5,
             type: :string
           }}
        end

        def field_def("cyclePathColumn") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cyclePathColumn",
             kind: {:scalar, ""},
             label: :optional,
             name: :cycle_path_column,
             tag: 5,
             type: :string
           }}
        end

        def field_def("cycle_path_column") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cyclePathColumn",
             kind: {:scalar, ""},
             label: :optional,
             name: :cycle_path_column,
             tag: 5,
             type: :string
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
             tag: 6,
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
             tag: 6,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:cycle_mark_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleMarkType",
             kind: {:scalar, 0},
             label: :optional,
             name: :cycle_mark_type,
             tag: 7,
             type: :uint32
           }}
        end

        def field_def("cycleMarkType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleMarkType",
             kind: {:scalar, 0},
             label: :optional,
             name: :cycle_mark_type,
             tag: 7,
             type: :uint32
           }}
        end

        def field_def("cycle_mark_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleMarkType",
             kind: {:scalar, 0},
             label: :optional,
             name: :cycle_mark_type,
             tag: 7,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:cycle_mark_typmod) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleMarkTypmod",
             kind: {:scalar, 0},
             label: :optional,
             name: :cycle_mark_typmod,
             tag: 8,
             type: :int32
           }}
        end

        def field_def("cycleMarkTypmod") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleMarkTypmod",
             kind: {:scalar, 0},
             label: :optional,
             name: :cycle_mark_typmod,
             tag: 8,
             type: :int32
           }}
        end

        def field_def("cycle_mark_typmod") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleMarkTypmod",
             kind: {:scalar, 0},
             label: :optional,
             name: :cycle_mark_typmod,
             tag: 8,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:cycle_mark_collation) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleMarkCollation",
             kind: {:scalar, 0},
             label: :optional,
             name: :cycle_mark_collation,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("cycleMarkCollation") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleMarkCollation",
             kind: {:scalar, 0},
             label: :optional,
             name: :cycle_mark_collation,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("cycle_mark_collation") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleMarkCollation",
             kind: {:scalar, 0},
             label: :optional,
             name: :cycle_mark_collation,
             tag: 9,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:cycle_mark_neop) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleMarkNeop",
             kind: {:scalar, 0},
             label: :optional,
             name: :cycle_mark_neop,
             tag: 10,
             type: :uint32
           }}
        end

        def field_def("cycleMarkNeop") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleMarkNeop",
             kind: {:scalar, 0},
             label: :optional,
             name: :cycle_mark_neop,
             tag: 10,
             type: :uint32
           }}
        end

        def field_def("cycle_mark_neop") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleMarkNeop",
             kind: {:scalar, 0},
             label: :optional,
             name: :cycle_mark_neop,
             tag: 10,
             type: :uint32
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
    def default(:cycle_col_list) do
      {:error, :no_default_value}
    end,
    def default(:cycle_mark_column) do
      {:ok, ""}
    end,
    def default(:cycle_mark_value) do
      {:ok, nil}
    end,
    def default(:cycle_mark_default) do
      {:ok, nil}
    end,
    def default(:cycle_path_column) do
      {:ok, ""}
    end,
    def default(:location) do
      {:ok, 0}
    end,
    def default(:cycle_mark_type) do
      {:ok, 0}
    end,
    def default(:cycle_mark_typmod) do
      {:ok, 0}
    end,
    def default(:cycle_mark_collation) do
      {:ok, 0}
    end,
    def default(:cycle_mark_neop) do
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
