# credo:disable-for-this-file
defmodule PgQuery.RowCompareExpr do
  @moduledoc false
  defstruct xpr: nil,
            rctype: :ROW_COMPARE_TYPE_UNDEFINED,
            opnos: [],
            opfamilies: [],
            inputcollids: [],
            largs: [],
            rargs: []

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
        |> encode_rctype(msg)
        |> encode_opnos(msg)
        |> encode_opfamilies(msg)
        |> encode_inputcollids(msg)
        |> encode_largs(msg)
        |> encode_rargs(msg)
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
      defp encode_rctype(acc, msg) do
        try do
          if msg.rctype == :ROW_COMPARE_TYPE_UNDEFINED do
            acc
          else
            [
              acc,
              "\x10",
              msg.rctype |> PgQuery.RowCompareType.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rctype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_opnos(acc, msg) do
        try do
          case msg.opnos do
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
            reraise Protox.EncodingError.new(:opnos, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_opfamilies(acc, msg) do
        try do
          case msg.opfamilies do
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
            reraise Protox.EncodingError.new(:opfamilies, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_inputcollids(acc, msg) do
        try do
          case msg.inputcollids do
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
            reraise Protox.EncodingError.new(:inputcollids, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_largs(acc, msg) do
        try do
          case msg.largs do
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
            reraise Protox.EncodingError.new(:largs, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rargs(acc, msg) do
        try do
          case msg.rargs do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, ":", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rargs, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.RowCompareExpr))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.RowCompareType)
              {[rctype: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[opnos: msg.opnos ++ [PgQuery.Node.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[opfamilies: msg.opfamilies ++ [PgQuery.Node.decode!(delimited)]], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[inputcollids: msg.inputcollids ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[largs: msg.largs ++ [PgQuery.Node.decode!(delimited)]], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[rargs: msg.rargs ++ [PgQuery.Node.decode!(delimited)]], rest}

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
        PgQuery.RowCompareExpr,
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
        2 => {:rctype, {:scalar, :ROW_COMPARE_TYPE_UNDEFINED}, {:enum, PgQuery.RowCompareType}},
        3 => {:opnos, :unpacked, {:message, PgQuery.Node}},
        4 => {:opfamilies, :unpacked, {:message, PgQuery.Node}},
        5 => {:inputcollids, :unpacked, {:message, PgQuery.Node}},
        6 => {:largs, :unpacked, {:message, PgQuery.Node}},
        7 => {:rargs, :unpacked, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        inputcollids: {5, :unpacked, {:message, PgQuery.Node}},
        largs: {6, :unpacked, {:message, PgQuery.Node}},
        opfamilies: {4, :unpacked, {:message, PgQuery.Node}},
        opnos: {3, :unpacked, {:message, PgQuery.Node}},
        rargs: {7, :unpacked, {:message, PgQuery.Node}},
        rctype: {2, {:scalar, :ROW_COMPARE_TYPE_UNDEFINED}, {:enum, PgQuery.RowCompareType}},
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
          json_name: "rctype",
          kind: {:scalar, :ROW_COMPARE_TYPE_UNDEFINED},
          label: :optional,
          name: :rctype,
          tag: 2,
          type: {:enum, PgQuery.RowCompareType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "opnos",
          kind: :unpacked,
          label: :repeated,
          name: :opnos,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "opfamilies",
          kind: :unpacked,
          label: :repeated,
          name: :opfamilies,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "inputcollids",
          kind: :unpacked,
          label: :repeated,
          name: :inputcollids,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "largs",
          kind: :unpacked,
          label: :repeated,
          name: :largs,
          tag: 6,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rargs",
          kind: :unpacked,
          label: :repeated,
          name: :rargs,
          tag: 7,
          type: {:message, PgQuery.Node}
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
        def field_def(:rctype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rctype",
             kind: {:scalar, :ROW_COMPARE_TYPE_UNDEFINED},
             label: :optional,
             name: :rctype,
             tag: 2,
             type: {:enum, PgQuery.RowCompareType}
           }}
        end

        def field_def("rctype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rctype",
             kind: {:scalar, :ROW_COMPARE_TYPE_UNDEFINED},
             label: :optional,
             name: :rctype,
             tag: 2,
             type: {:enum, PgQuery.RowCompareType}
           }}
        end

        []
      ),
      (
        def field_def(:opnos) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opnos",
             kind: :unpacked,
             label: :repeated,
             name: :opnos,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("opnos") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opnos",
             kind: :unpacked,
             label: :repeated,
             name: :opnos,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:opfamilies) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opfamilies",
             kind: :unpacked,
             label: :repeated,
             name: :opfamilies,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("opfamilies") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opfamilies",
             kind: :unpacked,
             label: :repeated,
             name: :opfamilies,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:inputcollids) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inputcollids",
             kind: :unpacked,
             label: :repeated,
             name: :inputcollids,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("inputcollids") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inputcollids",
             kind: :unpacked,
             label: :repeated,
             name: :inputcollids,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:largs) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "largs",
             kind: :unpacked,
             label: :repeated,
             name: :largs,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("largs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "largs",
             kind: :unpacked,
             label: :repeated,
             name: :largs,
             tag: 6,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:rargs) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rargs",
             kind: :unpacked,
             label: :repeated,
             name: :rargs,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("rargs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rargs",
             kind: :unpacked,
             label: :repeated,
             name: :rargs,
             tag: 7,
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
    def default(:xpr) do
      {:ok, nil}
    end,
    def default(:rctype) do
      {:ok, :ROW_COMPARE_TYPE_UNDEFINED}
    end,
    def default(:opnos) do
      {:error, :no_default_value}
    end,
    def default(:opfamilies) do
      {:error, :no_default_value}
    end,
    def default(:inputcollids) do
      {:error, :no_default_value}
    end,
    def default(:largs) do
      {:error, :no_default_value}
    end,
    def default(:rargs) do
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
