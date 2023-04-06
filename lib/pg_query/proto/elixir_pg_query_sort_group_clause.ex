# credo:disable-for-this-file
defmodule PgQuery.SortGroupClause do
  @moduledoc false
  defstruct tle_sort_group_ref: 0, eqop: 0, sortop: 0, nulls_first: false, hashable: false

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
        |> encode_tle_sort_group_ref(msg)
        |> encode_eqop(msg)
        |> encode_sortop(msg)
        |> encode_nulls_first(msg)
        |> encode_hashable(msg)
      end
    )

    []

    [
      defp encode_tle_sort_group_ref(acc, msg) do
        try do
          if msg.tle_sort_group_ref == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.tle_sort_group_ref)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:tle_sort_group_ref, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_eqop(acc, msg) do
        try do
          if msg.eqop == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.eqop)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:eqop, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_sortop(acc, msg) do
        try do
          if msg.sortop == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.sortop)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sortop, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_nulls_first(acc, msg) do
        try do
          if msg.nulls_first == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.nulls_first)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:nulls_first, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_hashable(acc, msg) do
        try do
          if msg.hashable == false do
            acc
          else
            [acc, "(", Protox.Encode.encode_bool(msg.hashable)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:hashable, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.SortGroupClause))
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
              {[tle_sort_group_ref: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[eqop: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[sortop: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[nulls_first: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[hashable: value], rest}

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
        PgQuery.SortGroupClause,
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
        1 => {:tle_sort_group_ref, {:scalar, 0}, :uint32},
        2 => {:eqop, {:scalar, 0}, :uint32},
        3 => {:sortop, {:scalar, 0}, :uint32},
        4 => {:nulls_first, {:scalar, false}, :bool},
        5 => {:hashable, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        eqop: {2, {:scalar, 0}, :uint32},
        hashable: {5, {:scalar, false}, :bool},
        nulls_first: {4, {:scalar, false}, :bool},
        sortop: {3, {:scalar, 0}, :uint32},
        tle_sort_group_ref: {1, {:scalar, 0}, :uint32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "tleSortGroupRef",
          kind: {:scalar, 0},
          label: :optional,
          name: :tle_sort_group_ref,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "eqop",
          kind: {:scalar, 0},
          label: :optional,
          name: :eqop,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "sortop",
          kind: {:scalar, 0},
          label: :optional,
          name: :sortop,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "nullsFirst",
          kind: {:scalar, false},
          label: :optional,
          name: :nulls_first,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "hashable",
          kind: {:scalar, false},
          label: :optional,
          name: :hashable,
          tag: 5,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:tle_sort_group_ref) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tleSortGroupRef",
             kind: {:scalar, 0},
             label: :optional,
             name: :tle_sort_group_ref,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("tleSortGroupRef") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tleSortGroupRef",
             kind: {:scalar, 0},
             label: :optional,
             name: :tle_sort_group_ref,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("tle_sort_group_ref") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tleSortGroupRef",
             kind: {:scalar, 0},
             label: :optional,
             name: :tle_sort_group_ref,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:eqop) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "eqop",
             kind: {:scalar, 0},
             label: :optional,
             name: :eqop,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("eqop") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "eqop",
             kind: {:scalar, 0},
             label: :optional,
             name: :eqop,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:sortop) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sortop",
             kind: {:scalar, 0},
             label: :optional,
             name: :sortop,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("sortop") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sortop",
             kind: {:scalar, 0},
             label: :optional,
             name: :sortop,
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:nulls_first) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nullsFirst",
             kind: {:scalar, false},
             label: :optional,
             name: :nulls_first,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("nullsFirst") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nullsFirst",
             kind: {:scalar, false},
             label: :optional,
             name: :nulls_first,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("nulls_first") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nullsFirst",
             kind: {:scalar, false},
             label: :optional,
             name: :nulls_first,
             tag: 4,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:hashable) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hashable",
             kind: {:scalar, false},
             label: :optional,
             name: :hashable,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("hashable") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hashable",
             kind: {:scalar, false},
             label: :optional,
             name: :hashable,
             tag: 5,
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
    def default(:tle_sort_group_ref) do
      {:ok, 0}
    end,
    def default(:eqop) do
      {:ok, 0}
    end,
    def default(:sortop) do
      {:ok, 0}
    end,
    def default(:nulls_first) do
      {:ok, false}
    end,
    def default(:hashable) do
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
