# credo:disable-for-this-file
defmodule PgQuery.RTEPermissionInfo do
  @moduledoc false
  defstruct relid: 0,
            inh: false,
            required_perms: 0,
            check_as_user: 0,
            selected_cols: [],
            inserted_cols: [],
            updated_cols: []

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
        |> encode_relid(msg)
        |> encode_inh(msg)
        |> encode_required_perms(msg)
        |> encode_check_as_user(msg)
        |> encode_selected_cols(msg)
        |> encode_inserted_cols(msg)
        |> encode_updated_cols(msg)
      end
    )

    []

    [
      defp encode_relid(acc, msg) do
        try do
          if msg.relid == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.relid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:relid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_inh(acc, msg) do
        try do
          if msg.inh == false do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_bool(msg.inh)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:inh, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_required_perms(acc, msg) do
        try do
          if msg.required_perms == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint64(msg.required_perms)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:required_perms, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_check_as_user(acc, msg) do
        try do
          if msg.check_as_user == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.check_as_user)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:check_as_user, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_selected_cols(acc, msg) do
        try do
          case msg.selected_cols do
            [] ->
              acc

            values ->
              [
                acc,
                "*",
                (
                  {bytes, len} =
                    Enum.reduce(values, {[], 0}, fn value, {acc, len} ->
                      value_bytes = :binary.list_to_bin([Protox.Encode.encode_uint64(value)])
                      {[acc, value_bytes], len + byte_size(value_bytes)}
                    end)

                  [Protox.Varint.encode(len), bytes]
                )
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:selected_cols, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_inserted_cols(acc, msg) do
        try do
          case msg.inserted_cols do
            [] ->
              acc

            values ->
              [
                acc,
                "2",
                (
                  {bytes, len} =
                    Enum.reduce(values, {[], 0}, fn value, {acc, len} ->
                      value_bytes = :binary.list_to_bin([Protox.Encode.encode_uint64(value)])
                      {[acc, value_bytes], len + byte_size(value_bytes)}
                    end)

                  [Protox.Varint.encode(len), bytes]
                )
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:inserted_cols, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_updated_cols(acc, msg) do
        try do
          case msg.updated_cols do
            [] ->
              acc

            values ->
              [
                acc,
                ":",
                (
                  {bytes, len} =
                    Enum.reduce(values, {[], 0}, fn value, {acc, len} ->
                      value_bytes = :binary.list_to_bin([Protox.Encode.encode_uint64(value)])
                      {[acc, value_bytes], len + byte_size(value_bytes)}
                    end)

                  [Protox.Varint.encode(len), bytes]
                )
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:updated_cols, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.RTEPermissionInfo))
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
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[relid: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[inh: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint64(bytes)
              {[required_perms: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[check_as_user: value], rest}

            {5, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 selected_cols:
                   msg.selected_cols ++ Protox.Decode.parse_repeated_uint64([], delimited)
               ], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint64(bytes)
              {[selected_cols: msg.selected_cols ++ [value]], rest}

            {6, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 inserted_cols:
                   msg.inserted_cols ++ Protox.Decode.parse_repeated_uint64([], delimited)
               ], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint64(bytes)
              {[inserted_cols: msg.inserted_cols ++ [value]], rest}

            {7, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 updated_cols:
                   msg.updated_cols ++ Protox.Decode.parse_repeated_uint64([], delimited)
               ], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint64(bytes)
              {[updated_cols: msg.updated_cols ++ [value]], rest}

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
        PgQuery.RTEPermissionInfo,
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
        1 => {:relid, {:scalar, 0}, :uint32},
        2 => {:inh, {:scalar, false}, :bool},
        3 => {:required_perms, {:scalar, 0}, :uint64},
        4 => {:check_as_user, {:scalar, 0}, :uint32},
        5 => {:selected_cols, :packed, :uint64},
        6 => {:inserted_cols, :packed, :uint64},
        7 => {:updated_cols, :packed, :uint64}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        check_as_user: {4, {:scalar, 0}, :uint32},
        inh: {2, {:scalar, false}, :bool},
        inserted_cols: {6, :packed, :uint64},
        relid: {1, {:scalar, 0}, :uint32},
        required_perms: {3, {:scalar, 0}, :uint64},
        selected_cols: {5, :packed, :uint64},
        updated_cols: {7, :packed, :uint64}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "relid",
          kind: {:scalar, 0},
          label: :optional,
          name: :relid,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "inh",
          kind: {:scalar, false},
          label: :optional,
          name: :inh,
          tag: 2,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "requiredPerms",
          kind: {:scalar, 0},
          label: :optional,
          name: :required_perms,
          tag: 3,
          type: :uint64
        },
        %{
          __struct__: Protox.Field,
          json_name: "checkAsUser",
          kind: {:scalar, 0},
          label: :optional,
          name: :check_as_user,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "selectedCols",
          kind: :packed,
          label: :repeated,
          name: :selected_cols,
          tag: 5,
          type: :uint64
        },
        %{
          __struct__: Protox.Field,
          json_name: "insertedCols",
          kind: :packed,
          label: :repeated,
          name: :inserted_cols,
          tag: 6,
          type: :uint64
        },
        %{
          __struct__: Protox.Field,
          json_name: "updatedCols",
          kind: :packed,
          label: :repeated,
          name: :updated_cols,
          tag: 7,
          type: :uint64
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:relid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relid",
             kind: {:scalar, 0},
             label: :optional,
             name: :relid,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("relid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "relid",
             kind: {:scalar, 0},
             label: :optional,
             name: :relid,
             tag: 1,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:inh) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inh",
             kind: {:scalar, false},
             label: :optional,
             name: :inh,
             tag: 2,
             type: :bool
           }}
        end

        def field_def("inh") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inh",
             kind: {:scalar, false},
             label: :optional,
             name: :inh,
             tag: 2,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:required_perms) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "requiredPerms",
             kind: {:scalar, 0},
             label: :optional,
             name: :required_perms,
             tag: 3,
             type: :uint64
           }}
        end

        def field_def("requiredPerms") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "requiredPerms",
             kind: {:scalar, 0},
             label: :optional,
             name: :required_perms,
             tag: 3,
             type: :uint64
           }}
        end

        def field_def("required_perms") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "requiredPerms",
             kind: {:scalar, 0},
             label: :optional,
             name: :required_perms,
             tag: 3,
             type: :uint64
           }}
        end
      ),
      (
        def field_def(:check_as_user) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "checkAsUser",
             kind: {:scalar, 0},
             label: :optional,
             name: :check_as_user,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("checkAsUser") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "checkAsUser",
             kind: {:scalar, 0},
             label: :optional,
             name: :check_as_user,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("check_as_user") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "checkAsUser",
             kind: {:scalar, 0},
             label: :optional,
             name: :check_as_user,
             tag: 4,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:selected_cols) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "selectedCols",
             kind: :packed,
             label: :repeated,
             name: :selected_cols,
             tag: 5,
             type: :uint64
           }}
        end

        def field_def("selectedCols") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "selectedCols",
             kind: :packed,
             label: :repeated,
             name: :selected_cols,
             tag: 5,
             type: :uint64
           }}
        end

        def field_def("selected_cols") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "selectedCols",
             kind: :packed,
             label: :repeated,
             name: :selected_cols,
             tag: 5,
             type: :uint64
           }}
        end
      ),
      (
        def field_def(:inserted_cols) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "insertedCols",
             kind: :packed,
             label: :repeated,
             name: :inserted_cols,
             tag: 6,
             type: :uint64
           }}
        end

        def field_def("insertedCols") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "insertedCols",
             kind: :packed,
             label: :repeated,
             name: :inserted_cols,
             tag: 6,
             type: :uint64
           }}
        end

        def field_def("inserted_cols") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "insertedCols",
             kind: :packed,
             label: :repeated,
             name: :inserted_cols,
             tag: 6,
             type: :uint64
           }}
        end
      ),
      (
        def field_def(:updated_cols) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "updatedCols",
             kind: :packed,
             label: :repeated,
             name: :updated_cols,
             tag: 7,
             type: :uint64
           }}
        end

        def field_def("updatedCols") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "updatedCols",
             kind: :packed,
             label: :repeated,
             name: :updated_cols,
             tag: 7,
             type: :uint64
           }}
        end

        def field_def("updated_cols") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "updatedCols",
             kind: :packed,
             label: :repeated,
             name: :updated_cols,
             tag: 7,
             type: :uint64
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
    def default(:relid) do
      {:ok, 0}
    end,
    def default(:inh) do
      {:ok, false}
    end,
    def default(:required_perms) do
      {:ok, 0}
    end,
    def default(:check_as_user) do
      {:ok, 0}
    end,
    def default(:selected_cols) do
      {:error, :no_default_value}
    end,
    def default(:inserted_cols) do
      {:error, :no_default_value}
    end,
    def default(:updated_cols) do
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
