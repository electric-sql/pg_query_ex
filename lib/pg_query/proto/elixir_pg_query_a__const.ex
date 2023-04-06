# credo:disable-for-this-file
defmodule PgQuery.A_Const do
  @moduledoc false
  defstruct val: nil, isnull: false, location: 0

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
        [] |> encode_val(msg) |> encode_isnull(msg) |> encode_location(msg)
      end
    )

    [
      defp encode_val(acc, msg) do
        case msg.val do
          nil -> acc
          {:ival, _field_value} -> encode_ival(acc, msg)
          {:fval, _field_value} -> encode_fval(acc, msg)
          {:boolval, _field_value} -> encode_boolval(acc, msg)
          {:sval, _field_value} -> encode_sval(acc, msg)
          {:bsval, _field_value} -> encode_bsval(acc, msg)
        end
      end
    ]

    [
      defp encode_ival(acc, msg) do
        try do
          {_, child_field_value} = msg.val
          [acc, "\n", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ival, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_fval(acc, msg) do
        try do
          {_, child_field_value} = msg.val
          [acc, "\x12", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:fval, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_boolval(acc, msg) do
        try do
          {_, child_field_value} = msg.val
          [acc, "\x1A", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:boolval, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_sval(acc, msg) do
        try do
          {_, child_field_value} = msg.val
          [acc, "\"", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sval, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_bsval(acc, msg) do
        try do
          {_, child_field_value} = msg.val
          [acc, "*", Protox.Encode.encode_message(child_field_value)]
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:bsval, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_isnull(acc, msg) do
        try do
          if msg.isnull == false do
            acc
          else
            [acc, "P", Protox.Encode.encode_bool(msg.isnull)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:isnull, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.A_Const))
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

              {[
                 case msg.val do
                   {:ival, previous_value} ->
                     {:val,
                      {:ival,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.Integer.decode!(delimited)
                       )}}

                   _ ->
                     {:val, {:ival, PgQuery.Integer.decode!(delimited)}}
                 end
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.val do
                   {:fval, previous_value} ->
                     {:val,
                      {:fval,
                       Protox.MergeMessage.merge(previous_value, PgQuery.Float.decode!(delimited))}}

                   _ ->
                     {:val, {:fval, PgQuery.Float.decode!(delimited)}}
                 end
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.val do
                   {:boolval, previous_value} ->
                     {:val,
                      {:boolval,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.Boolean.decode!(delimited)
                       )}}

                   _ ->
                     {:val, {:boolval, PgQuery.Boolean.decode!(delimited)}}
                 end
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.val do
                   {:sval, previous_value} ->
                     {:val,
                      {:sval,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.String.decode!(delimited)
                       )}}

                   _ ->
                     {:val, {:sval, PgQuery.String.decode!(delimited)}}
                 end
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 case msg.val do
                   {:bsval, previous_value} ->
                     {:val,
                      {:bsval,
                       Protox.MergeMessage.merge(
                         previous_value,
                         PgQuery.BitString.decode!(delimited)
                       )}}

                   _ ->
                     {:val, {:bsval, PgQuery.BitString.decode!(delimited)}}
                 end
               ], rest}

            {10, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[isnull: value], rest}

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
        PgQuery.A_Const,
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
        1 => {:ival, {:oneof, :val}, {:message, PgQuery.Integer}},
        2 => {:fval, {:oneof, :val}, {:message, PgQuery.Float}},
        3 => {:boolval, {:oneof, :val}, {:message, PgQuery.Boolean}},
        4 => {:sval, {:oneof, :val}, {:message, PgQuery.String}},
        5 => {:bsval, {:oneof, :val}, {:message, PgQuery.BitString}},
        10 => {:isnull, {:scalar, false}, :bool},
        11 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        boolval: {3, {:oneof, :val}, {:message, PgQuery.Boolean}},
        bsval: {5, {:oneof, :val}, {:message, PgQuery.BitString}},
        fval: {2, {:oneof, :val}, {:message, PgQuery.Float}},
        isnull: {10, {:scalar, false}, :bool},
        ival: {1, {:oneof, :val}, {:message, PgQuery.Integer}},
        location: {11, {:scalar, 0}, :int32},
        sval: {4, {:oneof, :val}, {:message, PgQuery.String}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "ival",
          kind: {:oneof, :val},
          label: :optional,
          name: :ival,
          tag: 1,
          type: {:message, PgQuery.Integer}
        },
        %{
          __struct__: Protox.Field,
          json_name: "fval",
          kind: {:oneof, :val},
          label: :optional,
          name: :fval,
          tag: 2,
          type: {:message, PgQuery.Float}
        },
        %{
          __struct__: Protox.Field,
          json_name: "boolval",
          kind: {:oneof, :val},
          label: :optional,
          name: :boolval,
          tag: 3,
          type: {:message, PgQuery.Boolean}
        },
        %{
          __struct__: Protox.Field,
          json_name: "sval",
          kind: {:oneof, :val},
          label: :optional,
          name: :sval,
          tag: 4,
          type: {:message, PgQuery.String}
        },
        %{
          __struct__: Protox.Field,
          json_name: "bsval",
          kind: {:oneof, :val},
          label: :optional,
          name: :bsval,
          tag: 5,
          type: {:message, PgQuery.BitString}
        },
        %{
          __struct__: Protox.Field,
          json_name: "isnull",
          kind: {:scalar, false},
          label: :optional,
          name: :isnull,
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
        def field_def(:ival) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ival",
             kind: {:oneof, :val},
             label: :optional,
             name: :ival,
             tag: 1,
             type: {:message, PgQuery.Integer}
           }}
        end

        def field_def("ival") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ival",
             kind: {:oneof, :val},
             label: :optional,
             name: :ival,
             tag: 1,
             type: {:message, PgQuery.Integer}
           }}
        end

        []
      ),
      (
        def field_def(:fval) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fval",
             kind: {:oneof, :val},
             label: :optional,
             name: :fval,
             tag: 2,
             type: {:message, PgQuery.Float}
           }}
        end

        def field_def("fval") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fval",
             kind: {:oneof, :val},
             label: :optional,
             name: :fval,
             tag: 2,
             type: {:message, PgQuery.Float}
           }}
        end

        []
      ),
      (
        def field_def(:boolval) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "boolval",
             kind: {:oneof, :val},
             label: :optional,
             name: :boolval,
             tag: 3,
             type: {:message, PgQuery.Boolean}
           }}
        end

        def field_def("boolval") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "boolval",
             kind: {:oneof, :val},
             label: :optional,
             name: :boolval,
             tag: 3,
             type: {:message, PgQuery.Boolean}
           }}
        end

        []
      ),
      (
        def field_def(:sval) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sval",
             kind: {:oneof, :val},
             label: :optional,
             name: :sval,
             tag: 4,
             type: {:message, PgQuery.String}
           }}
        end

        def field_def("sval") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sval",
             kind: {:oneof, :val},
             label: :optional,
             name: :sval,
             tag: 4,
             type: {:message, PgQuery.String}
           }}
        end

        []
      ),
      (
        def field_def(:bsval) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bsval",
             kind: {:oneof, :val},
             label: :optional,
             name: :bsval,
             tag: 5,
             type: {:message, PgQuery.BitString}
           }}
        end

        def field_def("bsval") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bsval",
             kind: {:oneof, :val},
             label: :optional,
             name: :bsval,
             tag: 5,
             type: {:message, PgQuery.BitString}
           }}
        end

        []
      ),
      (
        def field_def(:isnull) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isnull",
             kind: {:scalar, false},
             label: :optional,
             name: :isnull,
             tag: 10,
             type: :bool
           }}
        end

        def field_def("isnull") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isnull",
             kind: {:scalar, false},
             label: :optional,
             name: :isnull,
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
    def default(:ival) do
      {:error, :no_default_value}
    end,
    def default(:fval) do
      {:error, :no_default_value}
    end,
    def default(:boolval) do
      {:error, :no_default_value}
    end,
    def default(:sval) do
      {:error, :no_default_value}
    end,
    def default(:bsval) do
      {:error, :no_default_value}
    end,
    def default(:isnull) do
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
