# credo:disable-for-this-file
defmodule PgQuery.Var do
  @moduledoc false
  defstruct xpr: nil,
            varno: 0,
            varattno: 0,
            vartype: 0,
            vartypmod: 0,
            varcollid: 0,
            varlevelsup: 0,
            varnosyn: 0,
            varattnosyn: 0,
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
        |> encode_varno(msg)
        |> encode_varattno(msg)
        |> encode_vartype(msg)
        |> encode_vartypmod(msg)
        |> encode_varcollid(msg)
        |> encode_varlevelsup(msg)
        |> encode_varnosyn(msg)
        |> encode_varattnosyn(msg)
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
      defp encode_varno(acc, msg) do
        try do
          if msg.varno == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_int32(msg.varno)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:varno, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_varattno(acc, msg) do
        try do
          if msg.varattno == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_int32(msg.varattno)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:varattno, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_vartype(acc, msg) do
        try do
          if msg.vartype == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.vartype)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:vartype, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_vartypmod(acc, msg) do
        try do
          if msg.vartypmod == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_int32(msg.vartypmod)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:vartypmod, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_varcollid(acc, msg) do
        try do
          if msg.varcollid == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_uint32(msg.varcollid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:varcollid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_varlevelsup(acc, msg) do
        try do
          if msg.varlevelsup == 0 do
            acc
          else
            [acc, "8", Protox.Encode.encode_uint32(msg.varlevelsup)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:varlevelsup, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_varnosyn(acc, msg) do
        try do
          if msg.varnosyn == 0 do
            acc
          else
            [acc, "@", Protox.Encode.encode_uint32(msg.varnosyn)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:varnosyn, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_varattnosyn(acc, msg) do
        try do
          if msg.varattnosyn == 0 do
            acc
          else
            [acc, "H", Protox.Encode.encode_int32(msg.varattnosyn)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:varattnosyn, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "P", Protox.Encode.encode_int32(msg.location)]
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
          parse_key_value(bytes, struct(PgQuery.Var))
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
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[varno: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[varattno: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[vartype: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[vartypmod: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[varcollid: value], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[varlevelsup: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[varnosyn: value], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[varattnosyn: value], rest}

            {10, _, bytes} ->
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
        PgQuery.Var,
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
        2 => {:varno, {:scalar, 0}, :int32},
        3 => {:varattno, {:scalar, 0}, :int32},
        4 => {:vartype, {:scalar, 0}, :uint32},
        5 => {:vartypmod, {:scalar, 0}, :int32},
        6 => {:varcollid, {:scalar, 0}, :uint32},
        7 => {:varlevelsup, {:scalar, 0}, :uint32},
        8 => {:varnosyn, {:scalar, 0}, :uint32},
        9 => {:varattnosyn, {:scalar, 0}, :int32},
        10 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        location: {10, {:scalar, 0}, :int32},
        varattno: {3, {:scalar, 0}, :int32},
        varattnosyn: {9, {:scalar, 0}, :int32},
        varcollid: {6, {:scalar, 0}, :uint32},
        varlevelsup: {7, {:scalar, 0}, :uint32},
        varno: {2, {:scalar, 0}, :int32},
        varnosyn: {8, {:scalar, 0}, :uint32},
        vartype: {4, {:scalar, 0}, :uint32},
        vartypmod: {5, {:scalar, 0}, :int32},
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
          json_name: "varno",
          kind: {:scalar, 0},
          label: :optional,
          name: :varno,
          tag: 2,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "varattno",
          kind: {:scalar, 0},
          label: :optional,
          name: :varattno,
          tag: 3,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "vartype",
          kind: {:scalar, 0},
          label: :optional,
          name: :vartype,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "vartypmod",
          kind: {:scalar, 0},
          label: :optional,
          name: :vartypmod,
          tag: 5,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "varcollid",
          kind: {:scalar, 0},
          label: :optional,
          name: :varcollid,
          tag: 6,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "varlevelsup",
          kind: {:scalar, 0},
          label: :optional,
          name: :varlevelsup,
          tag: 7,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "varnosyn",
          kind: {:scalar, 0},
          label: :optional,
          name: :varnosyn,
          tag: 8,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "varattnosyn",
          kind: {:scalar, 0},
          label: :optional,
          name: :varattnosyn,
          tag: 9,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 10,
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
        def field_def(:varno) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "varno",
             kind: {:scalar, 0},
             label: :optional,
             name: :varno,
             tag: 2,
             type: :int32
           }}
        end

        def field_def("varno") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "varno",
             kind: {:scalar, 0},
             label: :optional,
             name: :varno,
             tag: 2,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:varattno) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "varattno",
             kind: {:scalar, 0},
             label: :optional,
             name: :varattno,
             tag: 3,
             type: :int32
           }}
        end

        def field_def("varattno") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "varattno",
             kind: {:scalar, 0},
             label: :optional,
             name: :varattno,
             tag: 3,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:vartype) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "vartype",
             kind: {:scalar, 0},
             label: :optional,
             name: :vartype,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("vartype") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "vartype",
             kind: {:scalar, 0},
             label: :optional,
             name: :vartype,
             tag: 4,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:vartypmod) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "vartypmod",
             kind: {:scalar, 0},
             label: :optional,
             name: :vartypmod,
             tag: 5,
             type: :int32
           }}
        end

        def field_def("vartypmod") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "vartypmod",
             kind: {:scalar, 0},
             label: :optional,
             name: :vartypmod,
             tag: 5,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:varcollid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "varcollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :varcollid,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("varcollid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "varcollid",
             kind: {:scalar, 0},
             label: :optional,
             name: :varcollid,
             tag: 6,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:varlevelsup) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "varlevelsup",
             kind: {:scalar, 0},
             label: :optional,
             name: :varlevelsup,
             tag: 7,
             type: :uint32
           }}
        end

        def field_def("varlevelsup") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "varlevelsup",
             kind: {:scalar, 0},
             label: :optional,
             name: :varlevelsup,
             tag: 7,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:varnosyn) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "varnosyn",
             kind: {:scalar, 0},
             label: :optional,
             name: :varnosyn,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("varnosyn") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "varnosyn",
             kind: {:scalar, 0},
             label: :optional,
             name: :varnosyn,
             tag: 8,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:varattnosyn) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "varattnosyn",
             kind: {:scalar, 0},
             label: :optional,
             name: :varattnosyn,
             tag: 9,
             type: :int32
           }}
        end

        def field_def("varattnosyn") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "varattnosyn",
             kind: {:scalar, 0},
             label: :optional,
             name: :varattnosyn,
             tag: 9,
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
             tag: 10,
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
             tag: 10,
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
    def default(:varno) do
      {:ok, 0}
    end,
    def default(:varattno) do
      {:ok, 0}
    end,
    def default(:vartype) do
      {:ok, 0}
    end,
    def default(:vartypmod) do
      {:ok, 0}
    end,
    def default(:varcollid) do
      {:ok, 0}
    end,
    def default(:varlevelsup) do
      {:ok, 0}
    end,
    def default(:varnosyn) do
      {:ok, 0}
    end,
    def default(:varattnosyn) do
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
