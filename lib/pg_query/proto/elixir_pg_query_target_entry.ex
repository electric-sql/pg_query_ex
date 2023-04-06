# credo:disable-for-this-file
defmodule PgQuery.TargetEntry do
  @moduledoc false
  defstruct xpr: nil,
            expr: nil,
            resno: 0,
            resname: "",
            ressortgroupref: 0,
            resorigtbl: 0,
            resorigcol: 0,
            resjunk: false

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
        |> encode_expr(msg)
        |> encode_resno(msg)
        |> encode_resname(msg)
        |> encode_ressortgroupref(msg)
        |> encode_resorigtbl(msg)
        |> encode_resorigcol(msg)
        |> encode_resjunk(msg)
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
      defp encode_expr(acc, msg) do
        try do
          if msg.expr == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.expr)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:expr, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_resno(acc, msg) do
        try do
          if msg.resno == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_int32(msg.resno)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:resno, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_resname(acc, msg) do
        try do
          if msg.resname == "" do
            acc
          else
            [acc, "\"", Protox.Encode.encode_string(msg.resname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:resname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ressortgroupref(acc, msg) do
        try do
          if msg.ressortgroupref == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_uint32(msg.ressortgroupref)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ressortgroupref, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_resorigtbl(acc, msg) do
        try do
          if msg.resorigtbl == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_uint32(msg.resorigtbl)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:resorigtbl, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_resorigcol(acc, msg) do
        try do
          if msg.resorigcol == 0 do
            acc
          else
            [acc, "8", Protox.Encode.encode_int32(msg.resorigcol)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:resorigcol, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_resjunk(acc, msg) do
        try do
          if msg.resjunk == false do
            acc
          else
            [acc, "@", Protox.Encode.encode_bool(msg.resjunk)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:resjunk, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.TargetEntry))
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
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[expr: Protox.MergeMessage.merge(msg.expr, PgQuery.Node.decode!(delimited))], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[resno: value], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[resname: delimited], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[ressortgroupref: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[resorigtbl: value], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[resorigcol: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[resjunk: value], rest}

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
        PgQuery.TargetEntry,
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
        2 => {:expr, {:scalar, nil}, {:message, PgQuery.Node}},
        3 => {:resno, {:scalar, 0}, :int32},
        4 => {:resname, {:scalar, ""}, :string},
        5 => {:ressortgroupref, {:scalar, 0}, :uint32},
        6 => {:resorigtbl, {:scalar, 0}, :uint32},
        7 => {:resorigcol, {:scalar, 0}, :int32},
        8 => {:resjunk, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        expr: {2, {:scalar, nil}, {:message, PgQuery.Node}},
        resjunk: {8, {:scalar, false}, :bool},
        resname: {4, {:scalar, ""}, :string},
        resno: {3, {:scalar, 0}, :int32},
        resorigcol: {7, {:scalar, 0}, :int32},
        resorigtbl: {6, {:scalar, 0}, :uint32},
        ressortgroupref: {5, {:scalar, 0}, :uint32},
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
          json_name: "expr",
          kind: {:scalar, nil},
          label: :optional,
          name: :expr,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "resno",
          kind: {:scalar, 0},
          label: :optional,
          name: :resno,
          tag: 3,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "resname",
          kind: {:scalar, ""},
          label: :optional,
          name: :resname,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "ressortgroupref",
          kind: {:scalar, 0},
          label: :optional,
          name: :ressortgroupref,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "resorigtbl",
          kind: {:scalar, 0},
          label: :optional,
          name: :resorigtbl,
          tag: 6,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "resorigcol",
          kind: {:scalar, 0},
          label: :optional,
          name: :resorigcol,
          tag: 7,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "resjunk",
          kind: {:scalar, false},
          label: :optional,
          name: :resjunk,
          tag: 8,
          type: :bool
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
        def field_def(:expr) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "expr",
             kind: {:scalar, nil},
             label: :optional,
             name: :expr,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("expr") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "expr",
             kind: {:scalar, nil},
             label: :optional,
             name: :expr,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:resno) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resno",
             kind: {:scalar, 0},
             label: :optional,
             name: :resno,
             tag: 3,
             type: :int32
           }}
        end

        def field_def("resno") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resno",
             kind: {:scalar, 0},
             label: :optional,
             name: :resno,
             tag: 3,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:resname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resname",
             kind: {:scalar, ""},
             label: :optional,
             name: :resname,
             tag: 4,
             type: :string
           }}
        end

        def field_def("resname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resname",
             kind: {:scalar, ""},
             label: :optional,
             name: :resname,
             tag: 4,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:ressortgroupref) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ressortgroupref",
             kind: {:scalar, 0},
             label: :optional,
             name: :ressortgroupref,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("ressortgroupref") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ressortgroupref",
             kind: {:scalar, 0},
             label: :optional,
             name: :ressortgroupref,
             tag: 5,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:resorigtbl) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resorigtbl",
             kind: {:scalar, 0},
             label: :optional,
             name: :resorigtbl,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("resorigtbl") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resorigtbl",
             kind: {:scalar, 0},
             label: :optional,
             name: :resorigtbl,
             tag: 6,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:resorigcol) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resorigcol",
             kind: {:scalar, 0},
             label: :optional,
             name: :resorigcol,
             tag: 7,
             type: :int32
           }}
        end

        def field_def("resorigcol") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resorigcol",
             kind: {:scalar, 0},
             label: :optional,
             name: :resorigcol,
             tag: 7,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:resjunk) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resjunk",
             kind: {:scalar, false},
             label: :optional,
             name: :resjunk,
             tag: 8,
             type: :bool
           }}
        end

        def field_def("resjunk") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resjunk",
             kind: {:scalar, false},
             label: :optional,
             name: :resjunk,
             tag: 8,
             type: :bool
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
    def default(:expr) do
      {:ok, nil}
    end,
    def default(:resno) do
      {:ok, 0}
    end,
    def default(:resname) do
      {:ok, ""}
    end,
    def default(:ressortgroupref) do
      {:ok, 0}
    end,
    def default(:resorigtbl) do
      {:ok, 0}
    end,
    def default(:resorigcol) do
      {:ok, 0}
    end,
    def default(:resjunk) do
      {:ok, false}
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
