# credo:disable-for-this-file
defmodule PgQuery.Aggref do
  @moduledoc false
  defstruct xpr: nil,
            aggfnoid: 0,
            aggtype: 0,
            aggcollid: 0,
            inputcollid: 0,
            aggtranstype: 0,
            aggargtypes: [],
            aggdirectargs: [],
            args: [],
            aggorder: [],
            aggdistinct: [],
            aggfilter: nil,
            aggstar: false,
            aggvariadic: false,
            aggkind: "",
            agglevelsup: 0,
            aggsplit: :AGG_SPLIT_UNDEFINED,
            aggno: 0,
            aggtransno: 0,
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
        |> encode_aggfnoid(msg)
        |> encode_aggtype(msg)
        |> encode_aggcollid(msg)
        |> encode_inputcollid(msg)
        |> encode_aggtranstype(msg)
        |> encode_aggargtypes(msg)
        |> encode_aggdirectargs(msg)
        |> encode_args(msg)
        |> encode_aggorder(msg)
        |> encode_aggdistinct(msg)
        |> encode_aggfilter(msg)
        |> encode_aggstar(msg)
        |> encode_aggvariadic(msg)
        |> encode_aggkind(msg)
        |> encode_agglevelsup(msg)
        |> encode_aggsplit(msg)
        |> encode_aggno(msg)
        |> encode_aggtransno(msg)
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
      defp encode_aggfnoid(acc, msg) do
        try do
          if msg.aggfnoid == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.aggfnoid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:aggfnoid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_aggtype(acc, msg) do
        try do
          if msg.aggtype == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.aggtype)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:aggtype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_aggcollid(acc, msg) do
        try do
          if msg.aggcollid == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.aggcollid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:aggcollid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_inputcollid(acc, msg) do
        try do
          if msg.inputcollid == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_uint32(msg.inputcollid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:inputcollid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_aggtranstype(acc, msg) do
        try do
          if msg.aggtranstype == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_uint32(msg.aggtranstype)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:aggtranstype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_aggargtypes(acc, msg) do
        try do
          case msg.aggargtypes do
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
            reraise Protox.EncodingError.new(:aggargtypes, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_aggdirectargs(acc, msg) do
        try do
          case msg.aggdirectargs do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "B", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:aggdirectargs, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_args(acc, msg) do
        try do
          case msg.args do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "J", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:args, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_aggorder(acc, msg) do
        try do
          case msg.aggorder do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "R", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:aggorder, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_aggdistinct(acc, msg) do
        try do
          case msg.aggdistinct do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "Z", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:aggdistinct, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_aggfilter(acc, msg) do
        try do
          if msg.aggfilter == nil do
            acc
          else
            [acc, "b", Protox.Encode.encode_message(msg.aggfilter)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:aggfilter, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_aggstar(acc, msg) do
        try do
          if msg.aggstar == false do
            acc
          else
            [acc, "h", Protox.Encode.encode_bool(msg.aggstar)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:aggstar, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_aggvariadic(acc, msg) do
        try do
          if msg.aggvariadic == false do
            acc
          else
            [acc, "p", Protox.Encode.encode_bool(msg.aggvariadic)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:aggvariadic, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_aggkind(acc, msg) do
        try do
          if msg.aggkind == "" do
            acc
          else
            [acc, "z", Protox.Encode.encode_string(msg.aggkind)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:aggkind, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_agglevelsup(acc, msg) do
        try do
          if msg.agglevelsup == 0 do
            acc
          else
            [acc, "\x80\x01", Protox.Encode.encode_uint32(msg.agglevelsup)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:agglevelsup, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_aggsplit(acc, msg) do
        try do
          if msg.aggsplit == :AGG_SPLIT_UNDEFINED do
            acc
          else
            [
              acc,
              "\x88\x01",
              msg.aggsplit |> PgQuery.AggSplit.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:aggsplit, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_aggno(acc, msg) do
        try do
          if msg.aggno == 0 do
            acc
          else
            [acc, "\x90\x01", Protox.Encode.encode_int32(msg.aggno)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:aggno, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_aggtransno(acc, msg) do
        try do
          if msg.aggtransno == 0 do
            acc
          else
            [acc, "\x98\x01", Protox.Encode.encode_int32(msg.aggtransno)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:aggtransno, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "\xA0\x01", Protox.Encode.encode_int32(msg.location)]
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
          parse_key_value(bytes, struct(PgQuery.Aggref))
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
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[aggfnoid: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[aggtype: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[aggcollid: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[inputcollid: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[aggtranstype: value], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[aggargtypes: msg.aggargtypes ++ [PgQuery.Node.decode!(delimited)]], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[aggdirectargs: msg.aggdirectargs ++ [PgQuery.Node.decode!(delimited)]], rest}

            {9, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[args: msg.args ++ [PgQuery.Node.decode!(delimited)]], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[aggorder: msg.aggorder ++ [PgQuery.Node.decode!(delimited)]], rest}

            {11, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[aggdistinct: msg.aggdistinct ++ [PgQuery.Node.decode!(delimited)]], rest}

            {12, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 aggfilter:
                   Protox.MergeMessage.merge(msg.aggfilter, PgQuery.Node.decode!(delimited))
               ], rest}

            {13, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[aggstar: value], rest}

            {14, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[aggvariadic: value], rest}

            {15, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[aggkind: delimited], rest}

            {16, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[agglevelsup: value], rest}

            {17, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.AggSplit)
              {[aggsplit: value], rest}

            {18, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[aggno: value], rest}

            {19, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[aggtransno: value], rest}

            {20, _, bytes} ->
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
        PgQuery.Aggref,
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
        2 => {:aggfnoid, {:scalar, 0}, :uint32},
        3 => {:aggtype, {:scalar, 0}, :uint32},
        4 => {:aggcollid, {:scalar, 0}, :uint32},
        5 => {:inputcollid, {:scalar, 0}, :uint32},
        6 => {:aggtranstype, {:scalar, 0}, :uint32},
        7 => {:aggargtypes, :unpacked, {:message, PgQuery.Node}},
        8 => {:aggdirectargs, :unpacked, {:message, PgQuery.Node}},
        9 => {:args, :unpacked, {:message, PgQuery.Node}},
        10 => {:aggorder, :unpacked, {:message, PgQuery.Node}},
        11 => {:aggdistinct, :unpacked, {:message, PgQuery.Node}},
        12 => {:aggfilter, {:scalar, nil}, {:message, PgQuery.Node}},
        13 => {:aggstar, {:scalar, false}, :bool},
        14 => {:aggvariadic, {:scalar, false}, :bool},
        15 => {:aggkind, {:scalar, ""}, :string},
        16 => {:agglevelsup, {:scalar, 0}, :uint32},
        17 => {:aggsplit, {:scalar, :AGG_SPLIT_UNDEFINED}, {:enum, PgQuery.AggSplit}},
        18 => {:aggno, {:scalar, 0}, :int32},
        19 => {:aggtransno, {:scalar, 0}, :int32},
        20 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        aggargtypes: {7, :unpacked, {:message, PgQuery.Node}},
        aggcollid: {4, {:scalar, 0}, :uint32},
        aggdirectargs: {8, :unpacked, {:message, PgQuery.Node}},
        aggdistinct: {11, :unpacked, {:message, PgQuery.Node}},
        aggfilter: {12, {:scalar, nil}, {:message, PgQuery.Node}},
        aggfnoid: {2, {:scalar, 0}, :uint32},
        aggkind: {15, {:scalar, ""}, :string},
        agglevelsup: {16, {:scalar, 0}, :uint32},
        aggno: {18, {:scalar, 0}, :int32},
        aggorder: {10, :unpacked, {:message, PgQuery.Node}},
        aggsplit: {17, {:scalar, :AGG_SPLIT_UNDEFINED}, {:enum, PgQuery.AggSplit}},
        aggstar: {13, {:scalar, false}, :bool},
        aggtransno: {19, {:scalar, 0}, :int32},
        aggtranstype: {6, {:scalar, 0}, :uint32},
        aggtype: {3, {:scalar, 0}, :uint32},
        aggvariadic: {14, {:scalar, false}, :bool},
        args: {9, :unpacked, {:message, PgQuery.Node}},
        inputcollid: {5, {:scalar, 0}, :uint32},
        location: {20, {:scalar, 0}, :int32},
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
          json_name: "aggfnoid",
          kind: {:scalar, 0},
          label: :optional,
          name: :aggfnoid,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggtype",
          kind: {:scalar, 0},
          label: :optional,
          name: :aggtype,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggcollid",
          kind: {:scalar, 0},
          label: :optional,
          name: :aggcollid,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "inputcollid",
          kind: {:scalar, 0},
          label: :optional,
          name: :inputcollid,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggtranstype",
          kind: {:scalar, 0},
          label: :optional,
          name: :aggtranstype,
          tag: 6,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggargtypes",
          kind: :unpacked,
          label: :repeated,
          name: :aggargtypes,
          tag: 7,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggdirectargs",
          kind: :unpacked,
          label: :repeated,
          name: :aggdirectargs,
          tag: 8,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "args",
          kind: :unpacked,
          label: :repeated,
          name: :args,
          tag: 9,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggorder",
          kind: :unpacked,
          label: :repeated,
          name: :aggorder,
          tag: 10,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggdistinct",
          kind: :unpacked,
          label: :repeated,
          name: :aggdistinct,
          tag: 11,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggfilter",
          kind: {:scalar, nil},
          label: :optional,
          name: :aggfilter,
          tag: 12,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggstar",
          kind: {:scalar, false},
          label: :optional,
          name: :aggstar,
          tag: 13,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggvariadic",
          kind: {:scalar, false},
          label: :optional,
          name: :aggvariadic,
          tag: 14,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggkind",
          kind: {:scalar, ""},
          label: :optional,
          name: :aggkind,
          tag: 15,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "agglevelsup",
          kind: {:scalar, 0},
          label: :optional,
          name: :agglevelsup,
          tag: 16,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggsplit",
          kind: {:scalar, :AGG_SPLIT_UNDEFINED},
          label: :optional,
          name: :aggsplit,
          tag: 17,
          type: {:enum, PgQuery.AggSplit}
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggno",
          kind: {:scalar, 0},
          label: :optional,
          name: :aggno,
          tag: 18,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggtransno",
          kind: {:scalar, 0},
          label: :optional,
          name: :aggtransno,
          tag: 19,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 20,
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
        def field_def(:aggfnoid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggfnoid",
             kind: {:scalar, 0},
             label: :optional,
             name: :aggfnoid,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("aggfnoid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggfnoid",
             kind: {:scalar, 0},
             label: :optional,
             name: :aggfnoid,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:aggtype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggtype",
             kind: {:scalar, 0},
             label: :optional,
             name: :aggtype,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("aggtype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggtype",
             kind: {:scalar, 0},
             label: :optional,
             name: :aggtype,
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:aggcollid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggcollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :aggcollid,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("aggcollid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggcollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :aggcollid,
             tag: 4,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:inputcollid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inputcollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :inputcollid,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("inputcollid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inputcollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :inputcollid,
             tag: 5,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:aggtranstype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggtranstype",
             kind: {:scalar, 0},
             label: :optional,
             name: :aggtranstype,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("aggtranstype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggtranstype",
             kind: {:scalar, 0},
             label: :optional,
             name: :aggtranstype,
             tag: 6,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:aggargtypes) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggargtypes",
             kind: :unpacked,
             label: :repeated,
             name: :aggargtypes,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("aggargtypes") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggargtypes",
             kind: :unpacked,
             label: :repeated,
             name: :aggargtypes,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:aggdirectargs) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggdirectargs",
             kind: :unpacked,
             label: :repeated,
             name: :aggdirectargs,
             tag: 8,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("aggdirectargs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggdirectargs",
             kind: :unpacked,
             label: :repeated,
             name: :aggdirectargs,
             tag: 8,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:args) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "args",
             kind: :unpacked,
             label: :repeated,
             name: :args,
             tag: 9,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("args") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "args",
             kind: :unpacked,
             label: :repeated,
             name: :args,
             tag: 9,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:aggorder) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggorder",
             kind: :unpacked,
             label: :repeated,
             name: :aggorder,
             tag: 10,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("aggorder") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggorder",
             kind: :unpacked,
             label: :repeated,
             name: :aggorder,
             tag: 10,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:aggdistinct) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggdistinct",
             kind: :unpacked,
             label: :repeated,
             name: :aggdistinct,
             tag: 11,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("aggdistinct") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggdistinct",
             kind: :unpacked,
             label: :repeated,
             name: :aggdistinct,
             tag: 11,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:aggfilter) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggfilter",
             kind: {:scalar, nil},
             label: :optional,
             name: :aggfilter,
             tag: 12,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("aggfilter") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggfilter",
             kind: {:scalar, nil},
             label: :optional,
             name: :aggfilter,
             tag: 12,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:aggstar) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggstar",
             kind: {:scalar, false},
             label: :optional,
             name: :aggstar,
             tag: 13,
             type: :bool
           }}
        end

        def field_def("aggstar") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggstar",
             kind: {:scalar, false},
             label: :optional,
             name: :aggstar,
             tag: 13,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:aggvariadic) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggvariadic",
             kind: {:scalar, false},
             label: :optional,
             name: :aggvariadic,
             tag: 14,
             type: :bool
           }}
        end

        def field_def("aggvariadic") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggvariadic",
             kind: {:scalar, false},
             label: :optional,
             name: :aggvariadic,
             tag: 14,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:aggkind) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggkind",
             kind: {:scalar, ""},
             label: :optional,
             name: :aggkind,
             tag: 15,
             type: :string
           }}
        end

        def field_def("aggkind") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggkind",
             kind: {:scalar, ""},
             label: :optional,
             name: :aggkind,
             tag: 15,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:agglevelsup) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "agglevelsup",
             kind: {:scalar, 0},
             label: :optional,
             name: :agglevelsup,
             tag: 16,
             type: :uint32
           }}
        end

        def field_def("agglevelsup") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "agglevelsup",
             kind: {:scalar, 0},
             label: :optional,
             name: :agglevelsup,
             tag: 16,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:aggsplit) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggsplit",
             kind: {:scalar, :AGG_SPLIT_UNDEFINED},
             label: :optional,
             name: :aggsplit,
             tag: 17,
             type: {:enum, PgQuery.AggSplit}
           }}
        end

        def field_def("aggsplit") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggsplit",
             kind: {:scalar, :AGG_SPLIT_UNDEFINED},
             label: :optional,
             name: :aggsplit,
             tag: 17,
             type: {:enum, PgQuery.AggSplit}
           }}
        end

        []
      ),
      (
        def field_def(:aggno) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggno",
             kind: {:scalar, 0},
             label: :optional,
             name: :aggno,
             tag: 18,
             type: :int32
           }}
        end

        def field_def("aggno") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggno",
             kind: {:scalar, 0},
             label: :optional,
             name: :aggno,
             tag: 18,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:aggtransno) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggtransno",
             kind: {:scalar, 0},
             label: :optional,
             name: :aggtransno,
             tag: 19,
             type: :int32
           }}
        end

        def field_def("aggtransno") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggtransno",
             kind: {:scalar, 0},
             label: :optional,
             name: :aggtransno,
             tag: 19,
             type: :int32
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
             tag: 20,
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
             tag: 20,
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
    def default(:aggfnoid) do
      {:ok, 0}
    end,
    def default(:aggtype) do
      {:ok, 0}
    end,
    def default(:aggcollid) do
      {:ok, 0}
    end,
    def default(:inputcollid) do
      {:ok, 0}
    end,
    def default(:aggtranstype) do
      {:ok, 0}
    end,
    def default(:aggargtypes) do
      {:error, :no_default_value}
    end,
    def default(:aggdirectargs) do
      {:error, :no_default_value}
    end,
    def default(:args) do
      {:error, :no_default_value}
    end,
    def default(:aggorder) do
      {:error, :no_default_value}
    end,
    def default(:aggdistinct) do
      {:error, :no_default_value}
    end,
    def default(:aggfilter) do
      {:ok, nil}
    end,
    def default(:aggstar) do
      {:ok, false}
    end,
    def default(:aggvariadic) do
      {:ok, false}
    end,
    def default(:aggkind) do
      {:ok, ""}
    end,
    def default(:agglevelsup) do
      {:ok, 0}
    end,
    def default(:aggsplit) do
      {:ok, :AGG_SPLIT_UNDEFINED}
    end,
    def default(:aggno) do
      {:ok, 0}
    end,
    def default(:aggtransno) do
      {:ok, 0}
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
