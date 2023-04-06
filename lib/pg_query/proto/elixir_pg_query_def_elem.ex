# credo:disable-for-this-file
defmodule PgQuery.DefElem do
  @moduledoc false
  defstruct defnamespace: "",
            defname: "",
            arg: nil,
            defaction: :DEF_ELEM_ACTION_UNDEFINED,
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
        |> encode_defnamespace(msg)
        |> encode_defname(msg)
        |> encode_arg(msg)
        |> encode_defaction(msg)
        |> encode_location(msg)
      end
    )

    []

    [
      defp encode_defnamespace(acc, msg) do
        try do
          if msg.defnamespace == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.defnamespace)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:defnamespace, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_defname(acc, msg) do
        try do
          if msg.defname == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.defname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:defname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_arg(acc, msg) do
        try do
          if msg.arg == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.arg)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:arg, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_defaction(acc, msg) do
        try do
          if msg.defaction == :DEF_ELEM_ACTION_UNDEFINED do
            acc
          else
            [
              acc,
              " ",
              msg.defaction |> PgQuery.DefElemAction.encode() |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:defaction, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_int32(msg.location)]
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
          parse_key_value(bytes, struct(PgQuery.DefElem))
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
              {[defnamespace: delimited], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[defname: delimited], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[arg: Protox.MergeMessage.merge(msg.arg, PgQuery.Node.decode!(delimited))], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.DefElemAction)
              {[defaction: value], rest}

            {5, _, bytes} ->
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
        PgQuery.DefElem,
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
        1 => {:defnamespace, {:scalar, ""}, :string},
        2 => {:defname, {:scalar, ""}, :string},
        3 => {:arg, {:scalar, nil}, {:message, PgQuery.Node}},
        4 => {:defaction, {:scalar, :DEF_ELEM_ACTION_UNDEFINED}, {:enum, PgQuery.DefElemAction}},
        5 => {:location, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        arg: {3, {:scalar, nil}, {:message, PgQuery.Node}},
        defaction: {4, {:scalar, :DEF_ELEM_ACTION_UNDEFINED}, {:enum, PgQuery.DefElemAction}},
        defname: {2, {:scalar, ""}, :string},
        defnamespace: {1, {:scalar, ""}, :string},
        location: {5, {:scalar, 0}, :int32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "defnamespace",
          kind: {:scalar, ""},
          label: :optional,
          name: :defnamespace,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "defname",
          kind: {:scalar, ""},
          label: :optional,
          name: :defname,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "arg",
          kind: {:scalar, nil},
          label: :optional,
          name: :arg,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "defaction",
          kind: {:scalar, :DEF_ELEM_ACTION_UNDEFINED},
          label: :optional,
          name: :defaction,
          tag: 4,
          type: {:enum, PgQuery.DefElemAction}
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 5,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:defnamespace) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "defnamespace",
             kind: {:scalar, ""},
             label: :optional,
             name: :defnamespace,
             tag: 1,
             type: :string
           }}
        end

        def field_def("defnamespace") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "defnamespace",
             kind: {:scalar, ""},
             label: :optional,
             name: :defnamespace,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:defname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "defname",
             kind: {:scalar, ""},
             label: :optional,
             name: :defname,
             tag: 2,
             type: :string
           }}
        end

        def field_def("defname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "defname",
             kind: {:scalar, ""},
             label: :optional,
             name: :defname,
             tag: 2,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:arg) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arg",
             kind: {:scalar, nil},
             label: :optional,
             name: :arg,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("arg") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arg",
             kind: {:scalar, nil},
             label: :optional,
             name: :arg,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:defaction) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "defaction",
             kind: {:scalar, :DEF_ELEM_ACTION_UNDEFINED},
             label: :optional,
             name: :defaction,
             tag: 4,
             type: {:enum, PgQuery.DefElemAction}
           }}
        end

        def field_def("defaction") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "defaction",
             kind: {:scalar, :DEF_ELEM_ACTION_UNDEFINED},
             label: :optional,
             name: :defaction,
             tag: 4,
             type: {:enum, PgQuery.DefElemAction}
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
             tag: 5,
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
             tag: 5,
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
    def default(:defnamespace) do
      {:ok, ""}
    end,
    def default(:defname) do
      {:ok, ""}
    end,
    def default(:arg) do
      {:ok, nil}
    end,
    def default(:defaction) do
      {:ok, :DEF_ELEM_ACTION_UNDEFINED}
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
