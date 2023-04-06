# credo:disable-for-this-file
defmodule PgQuery.SubscriptingRef do
  @moduledoc false
  defstruct xpr: nil,
            refcontainertype: 0,
            refelemtype: 0,
            refrestype: 0,
            reftypmod: 0,
            refcollid: 0,
            refupperindexpr: [],
            reflowerindexpr: [],
            refexpr: nil,
            refassgnexpr: nil

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
        |> encode_refcontainertype(msg)
        |> encode_refelemtype(msg)
        |> encode_refrestype(msg)
        |> encode_reftypmod(msg)
        |> encode_refcollid(msg)
        |> encode_refupperindexpr(msg)
        |> encode_reflowerindexpr(msg)
        |> encode_refexpr(msg)
        |> encode_refassgnexpr(msg)
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
      defp encode_refcontainertype(acc, msg) do
        try do
          if msg.refcontainertype == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.refcontainertype)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:refcontainertype, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_refelemtype(acc, msg) do
        try do
          if msg.refelemtype == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.refelemtype)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:refelemtype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_refrestype(acc, msg) do
        try do
          if msg.refrestype == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.refrestype)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:refrestype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_reftypmod(acc, msg) do
        try do
          if msg.reftypmod == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_int32(msg.reftypmod)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:reftypmod, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_refcollid(acc, msg) do
        try do
          if msg.refcollid == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_uint32(msg.refcollid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:refcollid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_refupperindexpr(acc, msg) do
        try do
          case msg.refupperindexpr do
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
            reraise Protox.EncodingError.new(:refupperindexpr, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_reflowerindexpr(acc, msg) do
        try do
          case msg.reflowerindexpr do
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
            reraise Protox.EncodingError.new(:reflowerindexpr, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_refexpr(acc, msg) do
        try do
          if msg.refexpr == nil do
            acc
          else
            [acc, "J", Protox.Encode.encode_message(msg.refexpr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:refexpr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_refassgnexpr(acc, msg) do
        try do
          if msg.refassgnexpr == nil do
            acc
          else
            [acc, "R", Protox.Encode.encode_message(msg.refassgnexpr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:refassgnexpr, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.SubscriptingRef))
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
              {[refcontainertype: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[refelemtype: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[refrestype: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[reftypmod: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[refcollid: value], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[refupperindexpr: msg.refupperindexpr ++ [PgQuery.Node.decode!(delimited)]], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[reflowerindexpr: msg.reflowerindexpr ++ [PgQuery.Node.decode!(delimited)]], rest}

            {9, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[refexpr: Protox.MergeMessage.merge(msg.refexpr, PgQuery.Node.decode!(delimited))],
               rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 refassgnexpr:
                   Protox.MergeMessage.merge(msg.refassgnexpr, PgQuery.Node.decode!(delimited))
               ], rest}

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
        PgQuery.SubscriptingRef,
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
        2 => {:refcontainertype, {:scalar, 0}, :uint32},
        3 => {:refelemtype, {:scalar, 0}, :uint32},
        4 => {:refrestype, {:scalar, 0}, :uint32},
        5 => {:reftypmod, {:scalar, 0}, :int32},
        6 => {:refcollid, {:scalar, 0}, :uint32},
        7 => {:refupperindexpr, :unpacked, {:message, PgQuery.Node}},
        8 => {:reflowerindexpr, :unpacked, {:message, PgQuery.Node}},
        9 => {:refexpr, {:scalar, nil}, {:message, PgQuery.Node}},
        10 => {:refassgnexpr, {:scalar, nil}, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        refassgnexpr: {10, {:scalar, nil}, {:message, PgQuery.Node}},
        refcollid: {6, {:scalar, 0}, :uint32},
        refcontainertype: {2, {:scalar, 0}, :uint32},
        refelemtype: {3, {:scalar, 0}, :uint32},
        refexpr: {9, {:scalar, nil}, {:message, PgQuery.Node}},
        reflowerindexpr: {8, :unpacked, {:message, PgQuery.Node}},
        refrestype: {4, {:scalar, 0}, :uint32},
        reftypmod: {5, {:scalar, 0}, :int32},
        refupperindexpr: {7, :unpacked, {:message, PgQuery.Node}},
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
          json_name: "refcontainertype",
          kind: {:scalar, 0},
          label: :optional,
          name: :refcontainertype,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "refelemtype",
          kind: {:scalar, 0},
          label: :optional,
          name: :refelemtype,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "refrestype",
          kind: {:scalar, 0},
          label: :optional,
          name: :refrestype,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "reftypmod",
          kind: {:scalar, 0},
          label: :optional,
          name: :reftypmod,
          tag: 5,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "refcollid",
          kind: {:scalar, 0},
          label: :optional,
          name: :refcollid,
          tag: 6,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "refupperindexpr",
          kind: :unpacked,
          label: :repeated,
          name: :refupperindexpr,
          tag: 7,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "reflowerindexpr",
          kind: :unpacked,
          label: :repeated,
          name: :reflowerindexpr,
          tag: 8,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "refexpr",
          kind: {:scalar, nil},
          label: :optional,
          name: :refexpr,
          tag: 9,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "refassgnexpr",
          kind: {:scalar, nil},
          label: :optional,
          name: :refassgnexpr,
          tag: 10,
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
        def field_def(:refcontainertype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "refcontainertype",
             kind: {:scalar, 0},
             label: :optional,
             name: :refcontainertype,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("refcontainertype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "refcontainertype",
             kind: {:scalar, 0},
             label: :optional,
             name: :refcontainertype,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:refelemtype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "refelemtype",
             kind: {:scalar, 0},
             label: :optional,
             name: :refelemtype,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("refelemtype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "refelemtype",
             kind: {:scalar, 0},
             label: :optional,
             name: :refelemtype,
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:refrestype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "refrestype",
             kind: {:scalar, 0},
             label: :optional,
             name: :refrestype,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("refrestype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "refrestype",
             kind: {:scalar, 0},
             label: :optional,
             name: :refrestype,
             tag: 4,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:reftypmod) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reftypmod",
             kind: {:scalar, 0},
             label: :optional,
             name: :reftypmod,
             tag: 5,
             type: :int32
           }}
        end

        def field_def("reftypmod") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reftypmod",
             kind: {:scalar, 0},
             label: :optional,
             name: :reftypmod,
             tag: 5,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:refcollid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "refcollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :refcollid,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("refcollid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "refcollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :refcollid,
             tag: 6,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:refupperindexpr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "refupperindexpr",
             kind: :unpacked,
             label: :repeated,
             name: :refupperindexpr,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("refupperindexpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "refupperindexpr",
             kind: :unpacked,
             label: :repeated,
             name: :refupperindexpr,
             tag: 7,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:reflowerindexpr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reflowerindexpr",
             kind: :unpacked,
             label: :repeated,
             name: :reflowerindexpr,
             tag: 8,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("reflowerindexpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reflowerindexpr",
             kind: :unpacked,
             label: :repeated,
             name: :reflowerindexpr,
             tag: 8,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:refexpr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "refexpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :refexpr,
             tag: 9,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("refexpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "refexpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :refexpr,
             tag: 9,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:refassgnexpr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "refassgnexpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :refassgnexpr,
             tag: 10,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("refassgnexpr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "refassgnexpr",
             kind: {:scalar, nil},
             label: :optional,
             name: :refassgnexpr,
             tag: 10,
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
    def default(:refcontainertype) do
      {:ok, 0}
    end,
    def default(:refelemtype) do
      {:ok, 0}
    end,
    def default(:refrestype) do
      {:ok, 0}
    end,
    def default(:reftypmod) do
      {:ok, 0}
    end,
    def default(:refcollid) do
      {:ok, 0}
    end,
    def default(:refupperindexpr) do
      {:error, :no_default_value}
    end,
    def default(:reflowerindexpr) do
      {:error, :no_default_value}
    end,
    def default(:refexpr) do
      {:ok, nil}
    end,
    def default(:refassgnexpr) do
      {:ok, nil}
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
