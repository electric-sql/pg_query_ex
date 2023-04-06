# credo:disable-for-this-file
defmodule PgQuery.WindowFunc do
  @moduledoc false
  defstruct xpr: nil,
            winfnoid: 0,
            wintype: 0,
            wincollid: 0,
            inputcollid: 0,
            args: [],
            aggfilter: nil,
            winref: 0,
            winstar: false,
            winagg: false,
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
        |> encode_winfnoid(msg)
        |> encode_wintype(msg)
        |> encode_wincollid(msg)
        |> encode_inputcollid(msg)
        |> encode_args(msg)
        |> encode_aggfilter(msg)
        |> encode_winref(msg)
        |> encode_winstar(msg)
        |> encode_winagg(msg)
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
      defp encode_winfnoid(acc, msg) do
        try do
          if msg.winfnoid == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.winfnoid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:winfnoid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_wintype(acc, msg) do
        try do
          if msg.wintype == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.wintype)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:wintype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_wincollid(acc, msg) do
        try do
          if msg.wincollid == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.wincollid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:wincollid, "invalid field value"), __STACKTRACE__
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
      defp encode_args(acc, msg) do
        try do
          case msg.args do
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
            reraise Protox.EncodingError.new(:args, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_aggfilter(acc, msg) do
        try do
          if msg.aggfilter == nil do
            acc
          else
            [acc, ":", Protox.Encode.encode_message(msg.aggfilter)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:aggfilter, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_winref(acc, msg) do
        try do
          if msg.winref == 0 do
            acc
          else
            [acc, "@", Protox.Encode.encode_uint32(msg.winref)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:winref, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_winstar(acc, msg) do
        try do
          if msg.winstar == false do
            acc
          else
            [acc, "H", Protox.Encode.encode_bool(msg.winstar)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:winstar, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_winagg(acc, msg) do
        try do
          if msg.winagg == false do
            acc
          else
            [acc, "P", Protox.Encode.encode_bool(msg.winagg)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:winagg, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "X", Protox.Encode.encode_int32(msg.location)]
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
          parse_key_value(bytes, struct(PgQuery.WindowFunc))
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
              {[winfnoid: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[wintype: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[wincollid: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[inputcollid: value], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[args: msg.args ++ [PgQuery.Node.decode!(delimited)]], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 aggfilter:
                   Protox.MergeMessage.merge(msg.aggfilter, PgQuery.Node.decode!(delimited))
               ], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[winref: value], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[winstar: value], rest}

            {10, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[winagg: value], rest}

            {11, _, bytes} ->
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
        PgQuery.WindowFunc,
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
        2 => {:winfnoid, {:scalar, 0}, :uint32},
        3 => {:wintype, {:scalar, 0}, :uint32},
        4 => {:wincollid, {:scalar, 0}, :uint32},
        5 => {:inputcollid, {:scalar, 0}, :uint32},
        6 => {:args, :unpacked, {:message, PgQuery.Node}},
        7 => {:aggfilter, {:scalar, nil}, {:message, PgQuery.Node}},
        8 => {:winref, {:scalar, 0}, :uint32},
        9 => {:winstar, {:scalar, false}, :bool},
        10 => {:winagg, {:scalar, false}, :bool},
        11 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        aggfilter: {7, {:scalar, nil}, {:message, PgQuery.Node}},
        args: {6, :unpacked, {:message, PgQuery.Node}},
        inputcollid: {5, {:scalar, 0}, :uint32},
        location: {11, {:scalar, 0}, :int32},
        winagg: {10, {:scalar, false}, :bool},
        wincollid: {4, {:scalar, 0}, :uint32},
        winfnoid: {2, {:scalar, 0}, :uint32},
        winref: {8, {:scalar, 0}, :uint32},
        winstar: {9, {:scalar, false}, :bool},
        wintype: {3, {:scalar, 0}, :uint32},
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
          json_name: "winfnoid",
          kind: {:scalar, 0},
          label: :optional,
          name: :winfnoid,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "wintype",
          kind: {:scalar, 0},
          label: :optional,
          name: :wintype,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "wincollid",
          kind: {:scalar, 0},
          label: :optional,
          name: :wincollid,
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
          json_name: "args",
          kind: :unpacked,
          label: :repeated,
          name: :args,
          tag: 6,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggfilter",
          kind: {:scalar, nil},
          label: :optional,
          name: :aggfilter,
          tag: 7,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "winref",
          kind: {:scalar, 0},
          label: :optional,
          name: :winref,
          tag: 8,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "winstar",
          kind: {:scalar, false},
          label: :optional,
          name: :winstar,
          tag: 9,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "winagg",
          kind: {:scalar, false},
          label: :optional,
          name: :winagg,
          tag: 10,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 11,
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
        def field_def(:winfnoid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "winfnoid",
             kind: {:scalar, 0},
             label: :optional,
             name: :winfnoid,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("winfnoid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "winfnoid",
             kind: {:scalar, 0},
             label: :optional,
             name: :winfnoid,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:wintype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "wintype",
             kind: {:scalar, 0},
             label: :optional,
             name: :wintype,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("wintype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "wintype",
             kind: {:scalar, 0},
             label: :optional,
             name: :wintype,
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:wincollid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "wincollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :wincollid,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("wincollid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "wincollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :wincollid,
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
        def field_def(:args) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "args",
             kind: :unpacked,
             label: :repeated,
             name: :args,
             tag: 6,
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
             tag: 6,
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
             tag: 7,
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
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:winref) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "winref",
             kind: {:scalar, 0},
             label: :optional,
             name: :winref,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("winref") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "winref",
             kind: {:scalar, 0},
             label: :optional,
             name: :winref,
             tag: 8,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:winstar) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "winstar",
             kind: {:scalar, false},
             label: :optional,
             name: :winstar,
             tag: 9,
             type: :bool
           }}
        end

        def field_def("winstar") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "winstar",
             kind: {:scalar, false},
             label: :optional,
             name: :winstar,
             tag: 9,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:winagg) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "winagg",
             kind: {:scalar, false},
             label: :optional,
             name: :winagg,
             tag: 10,
             type: :bool
           }}
        end

        def field_def("winagg") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "winagg",
             kind: {:scalar, false},
             label: :optional,
             name: :winagg,
             tag: 10,
             type: :bool
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
             tag: 11,
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
             tag: 11,
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
    def default(:winfnoid) do
      {:ok, 0}
    end,
    def default(:wintype) do
      {:ok, 0}
    end,
    def default(:wincollid) do
      {:ok, 0}
    end,
    def default(:inputcollid) do
      {:ok, 0}
    end,
    def default(:args) do
      {:error, :no_default_value}
    end,
    def default(:aggfilter) do
      {:ok, nil}
    end,
    def default(:winref) do
      {:ok, 0}
    end,
    def default(:winstar) do
      {:ok, false}
    end,
    def default(:winagg) do
      {:ok, false}
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
