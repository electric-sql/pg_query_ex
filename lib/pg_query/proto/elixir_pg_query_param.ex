# credo:disable-for-this-file
defmodule PgQuery.Param do
  @moduledoc false
  defstruct xpr: nil,
            paramkind: :PARAM_KIND_UNDEFINED,
            paramid: 0,
            paramtype: 0,
            paramtypmod: 0,
            paramcollid: 0,
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
        |> encode_paramkind(msg)
        |> encode_paramid(msg)
        |> encode_paramtype(msg)
        |> encode_paramtypmod(msg)
        |> encode_paramcollid(msg)
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
      defp encode_paramkind(acc, msg) do
        try do
          if msg.paramkind == :PARAM_KIND_UNDEFINED do
            acc
          else
            [
              acc,
              "\x10",
              msg.paramkind |> PgQuery.ParamKind.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:paramkind, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_paramid(acc, msg) do
        try do
          if msg.paramid == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_int32(msg.paramid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:paramid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_paramtype(acc, msg) do
        try do
          if msg.paramtype == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.paramtype)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:paramtype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_paramtypmod(acc, msg) do
        try do
          if msg.paramtypmod == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_int32(msg.paramtypmod)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:paramtypmod, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_paramcollid(acc, msg) do
        try do
          if msg.paramcollid == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_uint32(msg.paramcollid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:paramcollid, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.Param))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.ParamKind)
              {[paramkind: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[paramid: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[paramtype: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[paramtypmod: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[paramcollid: value], rest}

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
        PgQuery.Param,
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
        2 => {:paramkind, {:scalar, :PARAM_KIND_UNDEFINED}, {:enum, PgQuery.ParamKind}},
        3 => {:paramid, {:scalar, 0}, :int32},
        4 => {:paramtype, {:scalar, 0}, :uint32},
        5 => {:paramtypmod, {:scalar, 0}, :int32},
        6 => {:paramcollid, {:scalar, 0}, :uint32},
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
        paramcollid: {6, {:scalar, 0}, :uint32},
        paramid: {3, {:scalar, 0}, :int32},
        paramkind: {2, {:scalar, :PARAM_KIND_UNDEFINED}, {:enum, PgQuery.ParamKind}},
        paramtype: {4, {:scalar, 0}, :uint32},
        paramtypmod: {5, {:scalar, 0}, :int32},
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
          json_name: "paramkind",
          kind: {:scalar, :PARAM_KIND_UNDEFINED},
          label: :optional,
          name: :paramkind,
          tag: 2,
          type: {:enum, PgQuery.ParamKind}
        },
        %{
          __struct__: Protox.Field,
          json_name: "paramid",
          kind: {:scalar, 0},
          label: :optional,
          name: :paramid,
          tag: 3,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "paramtype",
          kind: {:scalar, 0},
          label: :optional,
          name: :paramtype,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "paramtypmod",
          kind: {:scalar, 0},
          label: :optional,
          name: :paramtypmod,
          tag: 5,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "paramcollid",
          kind: {:scalar, 0},
          label: :optional,
          name: :paramcollid,
          tag: 6,
          type: :uint32
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
        def field_def(:paramkind) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paramkind",
             kind: {:scalar, :PARAM_KIND_UNDEFINED},
             label: :optional,
             name: :paramkind,
             tag: 2,
             type: {:enum, PgQuery.ParamKind}
           }}
        end

        def field_def("paramkind") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paramkind",
             kind: {:scalar, :PARAM_KIND_UNDEFINED},
             label: :optional,
             name: :paramkind,
             tag: 2,
             type: {:enum, PgQuery.ParamKind}
           }}
        end

        []
      ),
      (
        def field_def(:paramid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paramid",
             kind: {:scalar, 0},
             label: :optional,
             name: :paramid,
             tag: 3,
             type: :int32
           }}
        end

        def field_def("paramid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paramid",
             kind: {:scalar, 0},
             label: :optional,
             name: :paramid,
             tag: 3,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:paramtype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paramtype",
             kind: {:scalar, 0},
             label: :optional,
             name: :paramtype,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("paramtype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paramtype",
             kind: {:scalar, 0},
             label: :optional,
             name: :paramtype,
             tag: 4,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:paramtypmod) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paramtypmod",
             kind: {:scalar, 0},
             label: :optional,
             name: :paramtypmod,
             tag: 5,
             type: :int32
           }}
        end

        def field_def("paramtypmod") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paramtypmod",
             kind: {:scalar, 0},
             label: :optional,
             name: :paramtypmod,
             tag: 5,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:paramcollid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paramcollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :paramcollid,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("paramcollid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paramcollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :paramcollid,
             tag: 6,
             type: :uint32
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
    def default(:paramkind) do
      {:ok, :PARAM_KIND_UNDEFINED}
    end,
    def default(:paramid) do
      {:ok, 0}
    end,
    def default(:paramtype) do
      {:ok, 0}
    end,
    def default(:paramtypmod) do
      {:ok, 0}
    end,
    def default(:paramcollid) do
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
