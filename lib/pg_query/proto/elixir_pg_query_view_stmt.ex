# credo:disable-for-this-file
defmodule PgQuery.ViewStmt do
  @moduledoc false
  defstruct view: nil,
            aliases: [],
            query: nil,
            replace: false,
            options: [],
            with_check_option: :VIEW_CHECK_OPTION_UNDEFINED

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
        |> encode_view(msg)
        |> encode_aliases(msg)
        |> encode_query(msg)
        |> encode_replace(msg)
        |> encode_options(msg)
        |> encode_with_check_option(msg)
      end
    )

    []

    [
      defp encode_view(acc, msg) do
        try do
          if msg.view == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.view)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:view, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_aliases(acc, msg) do
        try do
          case msg.aliases do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x12", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:aliases, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_query(acc, msg) do
        try do
          if msg.query == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.query)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:query, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_replace(acc, msg) do
        try do
          if msg.replace == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.replace)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:replace, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_options(acc, msg) do
        try do
          case msg.options do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "*", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:options, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_with_check_option(acc, msg) do
        try do
          if msg.with_check_option == :VIEW_CHECK_OPTION_UNDEFINED do
            acc
          else
            [
              acc,
              "0",
              msg.with_check_option
              |> PgQuery.ViewCheckOption.encode()
              |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:with_check_option, "invalid field value"),
                    __STACKTRACE__
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
          parse_key_value(bytes, struct(PgQuery.ViewStmt))
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

              {[view: Protox.MergeMessage.merge(msg.view, PgQuery.RangeVar.decode!(delimited))],
               rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[aliases: msg.aliases ++ [PgQuery.Node.decode!(delimited)]], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[query: Protox.MergeMessage.merge(msg.query, PgQuery.Node.decode!(delimited))],
               rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[replace: value], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[options: msg.options ++ [PgQuery.Node.decode!(delimited)]], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.ViewCheckOption)
              {[with_check_option: value], rest}

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
        PgQuery.ViewStmt,
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
        1 => {:view, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        2 => {:aliases, :unpacked, {:message, PgQuery.Node}},
        3 => {:query, {:scalar, nil}, {:message, PgQuery.Node}},
        4 => {:replace, {:scalar, false}, :bool},
        5 => {:options, :unpacked, {:message, PgQuery.Node}},
        6 =>
          {:with_check_option, {:scalar, :VIEW_CHECK_OPTION_UNDEFINED},
           {:enum, PgQuery.ViewCheckOption}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        aliases: {2, :unpacked, {:message, PgQuery.Node}},
        options: {5, :unpacked, {:message, PgQuery.Node}},
        query: {3, {:scalar, nil}, {:message, PgQuery.Node}},
        replace: {4, {:scalar, false}, :bool},
        view: {1, {:scalar, nil}, {:message, PgQuery.RangeVar}},
        with_check_option:
          {6, {:scalar, :VIEW_CHECK_OPTION_UNDEFINED}, {:enum, PgQuery.ViewCheckOption}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "view",
          kind: {:scalar, nil},
          label: :optional,
          name: :view,
          tag: 1,
          type: {:message, PgQuery.RangeVar}
        },
        %{
          __struct__: Protox.Field,
          json_name: "aliases",
          kind: :unpacked,
          label: :repeated,
          name: :aliases,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "query",
          kind: {:scalar, nil},
          label: :optional,
          name: :query,
          tag: 3,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "replace",
          kind: {:scalar, false},
          label: :optional,
          name: :replace,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "options",
          kind: :unpacked,
          label: :repeated,
          name: :options,
          tag: 5,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "withCheckOption",
          kind: {:scalar, :VIEW_CHECK_OPTION_UNDEFINED},
          label: :optional,
          name: :with_check_option,
          tag: 6,
          type: {:enum, PgQuery.ViewCheckOption}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:view) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "view",
             kind: {:scalar, nil},
             label: :optional,
             name: :view,
             tag: 1,
             type: {:message, PgQuery.RangeVar}
           }}
        end

        def field_def("view") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "view",
             kind: {:scalar, nil},
             label: :optional,
             name: :view,
             tag: 1,
             type: {:message, PgQuery.RangeVar}
           }}
        end

        []
      ),
      (
        def field_def(:aliases) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aliases",
             kind: :unpacked,
             label: :repeated,
             name: :aliases,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("aliases") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aliases",
             kind: :unpacked,
             label: :repeated,
             name: :aliases,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:query) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "query",
             kind: {:scalar, nil},
             label: :optional,
             name: :query,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("query") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "query",
             kind: {:scalar, nil},
             label: :optional,
             name: :query,
             tag: 3,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:replace) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "replace",
             kind: {:scalar, false},
             label: :optional,
             name: :replace,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("replace") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "replace",
             kind: {:scalar, false},
             label: :optional,
             name: :replace,
             tag: 4,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:options) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "options",
             kind: :unpacked,
             label: :repeated,
             name: :options,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("options") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "options",
             kind: :unpacked,
             label: :repeated,
             name: :options,
             tag: 5,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:with_check_option) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "withCheckOption",
             kind: {:scalar, :VIEW_CHECK_OPTION_UNDEFINED},
             label: :optional,
             name: :with_check_option,
             tag: 6,
             type: {:enum, PgQuery.ViewCheckOption}
           }}
        end

        def field_def("withCheckOption") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "withCheckOption",
             kind: {:scalar, :VIEW_CHECK_OPTION_UNDEFINED},
             label: :optional,
             name: :with_check_option,
             tag: 6,
             type: {:enum, PgQuery.ViewCheckOption}
           }}
        end

        def field_def("with_check_option") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "withCheckOption",
             kind: {:scalar, :VIEW_CHECK_OPTION_UNDEFINED},
             label: :optional,
             name: :with_check_option,
             tag: 6,
             type: {:enum, PgQuery.ViewCheckOption}
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
    def default(:view) do
      {:ok, nil}
    end,
    def default(:aliases) do
      {:error, :no_default_value}
    end,
    def default(:query) do
      {:ok, nil}
    end,
    def default(:replace) do
      {:ok, false}
    end,
    def default(:options) do
      {:error, :no_default_value}
    end,
    def default(:with_check_option) do
      {:ok, :VIEW_CHECK_OPTION_UNDEFINED}
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
