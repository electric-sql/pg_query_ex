# credo:disable-for-this-file
defmodule PgQuery.CommonTableExpr do
  @moduledoc false
  defstruct ctename: "",
            aliascolnames: [],
            ctematerialized: :CTEMATERIALIZE_UNDEFINED,
            ctequery: nil,
            search_clause: nil,
            cycle_clause: nil,
            location: 0,
            cterecursive: false,
            cterefcount: 0,
            ctecolnames: [],
            ctecoltypes: [],
            ctecoltypmods: [],
            ctecolcollations: []

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
        |> encode_ctename(msg)
        |> encode_aliascolnames(msg)
        |> encode_ctematerialized(msg)
        |> encode_ctequery(msg)
        |> encode_search_clause(msg)
        |> encode_cycle_clause(msg)
        |> encode_location(msg)
        |> encode_cterecursive(msg)
        |> encode_cterefcount(msg)
        |> encode_ctecolnames(msg)
        |> encode_ctecoltypes(msg)
        |> encode_ctecoltypmods(msg)
        |> encode_ctecolcollations(msg)
      end
    )

    []

    [
      defp encode_ctename(acc, msg) do
        try do
          if msg.ctename == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.ctename)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ctename, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_aliascolnames(acc, msg) do
        try do
          case msg.aliascolnames do
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
            reraise Protox.EncodingError.new(:aliascolnames, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_ctematerialized(acc, msg) do
        try do
          if msg.ctematerialized == :CTEMATERIALIZE_UNDEFINED do
            acc
          else
            [
              acc,
              "\x18",
              msg.ctematerialized
              |> PgQuery.CTEMaterialize.encode()
              |> Protox.Encode.encode_enum()
            ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ctematerialized, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_ctequery(acc, msg) do
        try do
          if msg.ctequery == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.ctequery)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ctequery, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_search_clause(acc, msg) do
        try do
          if msg.search_clause == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.search_clause)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:search_clause, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_cycle_clause(acc, msg) do
        try do
          if msg.cycle_clause == nil do
            acc
          else
            [acc, "2", Protox.Encode.encode_message(msg.cycle_clause)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:cycle_clause, "invalid field value"), __STACKTRACE__
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
      end,
      defp encode_cterecursive(acc, msg) do
        try do
          if msg.cterecursive == false do
            acc
          else
            [acc, "@", Protox.Encode.encode_bool(msg.cterecursive)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:cterecursive, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_cterefcount(acc, msg) do
        try do
          if msg.cterefcount == 0 do
            acc
          else
            [acc, "H", Protox.Encode.encode_int32(msg.cterefcount)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:cterefcount, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ctecolnames(acc, msg) do
        try do
          case msg.ctecolnames do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "R", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ctecolnames, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ctecoltypes(acc, msg) do
        try do
          case msg.ctecoltypes do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "Z", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ctecoltypes, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ctecoltypmods(acc, msg) do
        try do
          case msg.ctecoltypmods do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "b", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ctecoltypmods, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_ctecolcollations(acc, msg) do
        try do
          case msg.ctecolcollations do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "j", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ctecolcollations, "invalid field value"),
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
          parse_key_value(bytes, struct(PgQuery.CommonTableExpr))
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
              {[ctename: delimited], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[aliascolnames: msg.aliascolnames ++ [PgQuery.Node.decode!(delimited)]], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, PgQuery.CTEMaterialize)
              {[ctematerialized: value], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 ctequery:
                   Protox.MergeMessage.merge(msg.ctequery, PgQuery.Node.decode!(delimited))
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 search_clause:
                   Protox.MergeMessage.merge(
                     msg.search_clause,
                     PgQuery.CTESearchClause.decode!(delimited)
                   )
               ], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 cycle_clause:
                   Protox.MergeMessage.merge(
                     msg.cycle_clause,
                     PgQuery.CTECycleClause.decode!(delimited)
                   )
               ], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[location: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[cterecursive: value], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[cterefcount: value], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[ctecolnames: msg.ctecolnames ++ [PgQuery.Node.decode!(delimited)]], rest}

            {11, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[ctecoltypes: msg.ctecoltypes ++ [PgQuery.Node.decode!(delimited)]], rest}

            {12, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[ctecoltypmods: msg.ctecoltypmods ++ [PgQuery.Node.decode!(delimited)]], rest}

            {13, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[ctecolcollations: msg.ctecolcollations ++ [PgQuery.Node.decode!(delimited)]],
               rest}

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
        PgQuery.CommonTableExpr,
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
        1 => {:ctename, {:scalar, ""}, :string},
        2 => {:aliascolnames, :unpacked, {:message, PgQuery.Node}},
        3 =>
          {:ctematerialized, {:scalar, :CTEMATERIALIZE_UNDEFINED},
           {:enum, PgQuery.CTEMaterialize}},
        4 => {:ctequery, {:scalar, nil}, {:message, PgQuery.Node}},
        5 => {:search_clause, {:scalar, nil}, {:message, PgQuery.CTESearchClause}},
        6 => {:cycle_clause, {:scalar, nil}, {:message, PgQuery.CTECycleClause}},
        7 => {:location, {:scalar, 0}, :int32},
        8 => {:cterecursive, {:scalar, false}, :bool},
        9 => {:cterefcount, {:scalar, 0}, :int32},
        10 => {:ctecolnames, :unpacked, {:message, PgQuery.Node}},
        11 => {:ctecoltypes, :unpacked, {:message, PgQuery.Node}},
        12 => {:ctecoltypmods, :unpacked, {:message, PgQuery.Node}},
        13 => {:ctecolcollations, :unpacked, {:message, PgQuery.Node}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        aliascolnames: {2, :unpacked, {:message, PgQuery.Node}},
        ctecolcollations: {13, :unpacked, {:message, PgQuery.Node}},
        ctecolnames: {10, :unpacked, {:message, PgQuery.Node}},
        ctecoltypes: {11, :unpacked, {:message, PgQuery.Node}},
        ctecoltypmods: {12, :unpacked, {:message, PgQuery.Node}},
        ctematerialized:
          {3, {:scalar, :CTEMATERIALIZE_UNDEFINED}, {:enum, PgQuery.CTEMaterialize}},
        ctename: {1, {:scalar, ""}, :string},
        ctequery: {4, {:scalar, nil}, {:message, PgQuery.Node}},
        cterecursive: {8, {:scalar, false}, :bool},
        cterefcount: {9, {:scalar, 0}, :int32},
        cycle_clause: {6, {:scalar, nil}, {:message, PgQuery.CTECycleClause}},
        location: {7, {:scalar, 0}, :int32},
        search_clause: {5, {:scalar, nil}, {:message, PgQuery.CTESearchClause}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "ctename",
          kind: {:scalar, ""},
          label: :optional,
          name: :ctename,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "aliascolnames",
          kind: :unpacked,
          label: :repeated,
          name: :aliascolnames,
          tag: 2,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "ctematerialized",
          kind: {:scalar, :CTEMATERIALIZE_UNDEFINED},
          label: :optional,
          name: :ctematerialized,
          tag: 3,
          type: {:enum, PgQuery.CTEMaterialize}
        },
        %{
          __struct__: Protox.Field,
          json_name: "ctequery",
          kind: {:scalar, nil},
          label: :optional,
          name: :ctequery,
          tag: 4,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "searchClause",
          kind: {:scalar, nil},
          label: :optional,
          name: :search_clause,
          tag: 5,
          type: {:message, PgQuery.CTESearchClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "cycleClause",
          kind: {:scalar, nil},
          label: :optional,
          name: :cycle_clause,
          tag: 6,
          type: {:message, PgQuery.CTECycleClause}
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 7,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "cterecursive",
          kind: {:scalar, false},
          label: :optional,
          name: :cterecursive,
          tag: 8,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "cterefcount",
          kind: {:scalar, 0},
          label: :optional,
          name: :cterefcount,
          tag: 9,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "ctecolnames",
          kind: :unpacked,
          label: :repeated,
          name: :ctecolnames,
          tag: 10,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "ctecoltypes",
          kind: :unpacked,
          label: :repeated,
          name: :ctecoltypes,
          tag: 11,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "ctecoltypmods",
          kind: :unpacked,
          label: :repeated,
          name: :ctecoltypmods,
          tag: 12,
          type: {:message, PgQuery.Node}
        },
        %{
          __struct__: Protox.Field,
          json_name: "ctecolcollations",
          kind: :unpacked,
          label: :repeated,
          name: :ctecolcollations,
          tag: 13,
          type: {:message, PgQuery.Node}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:ctename) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctename",
             kind: {:scalar, ""},
             label: :optional,
             name: :ctename,
             tag: 1,
             type: :string
           }}
        end

        def field_def("ctename") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctename",
             kind: {:scalar, ""},
             label: :optional,
             name: :ctename,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:aliascolnames) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aliascolnames",
             kind: :unpacked,
             label: :repeated,
             name: :aliascolnames,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("aliascolnames") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aliascolnames",
             kind: :unpacked,
             label: :repeated,
             name: :aliascolnames,
             tag: 2,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:ctematerialized) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctematerialized",
             kind: {:scalar, :CTEMATERIALIZE_UNDEFINED},
             label: :optional,
             name: :ctematerialized,
             tag: 3,
             type: {:enum, PgQuery.CTEMaterialize}
           }}
        end

        def field_def("ctematerialized") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctematerialized",
             kind: {:scalar, :CTEMATERIALIZE_UNDEFINED},
             label: :optional,
             name: :ctematerialized,
             tag: 3,
             type: {:enum, PgQuery.CTEMaterialize}
           }}
        end

        []
      ),
      (
        def field_def(:ctequery) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctequery",
             kind: {:scalar, nil},
             label: :optional,
             name: :ctequery,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("ctequery") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctequery",
             kind: {:scalar, nil},
             label: :optional,
             name: :ctequery,
             tag: 4,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:search_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "searchClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :search_clause,
             tag: 5,
             type: {:message, PgQuery.CTESearchClause}
           }}
        end

        def field_def("searchClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "searchClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :search_clause,
             tag: 5,
             type: {:message, PgQuery.CTESearchClause}
           }}
        end

        def field_def("search_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "searchClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :search_clause,
             tag: 5,
             type: {:message, PgQuery.CTESearchClause}
           }}
        end
      ),
      (
        def field_def(:cycle_clause) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :cycle_clause,
             tag: 6,
             type: {:message, PgQuery.CTECycleClause}
           }}
        end

        def field_def("cycleClause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :cycle_clause,
             tag: 6,
             type: {:message, PgQuery.CTECycleClause}
           }}
        end

        def field_def("cycle_clause") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cycleClause",
             kind: {:scalar, nil},
             label: :optional,
             name: :cycle_clause,
             tag: 6,
             type: {:message, PgQuery.CTECycleClause}
           }}
        end
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
      (
        def field_def(:cterecursive) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cterecursive",
             kind: {:scalar, false},
             label: :optional,
             name: :cterecursive,
             tag: 8,
             type: :bool
           }}
        end

        def field_def("cterecursive") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cterecursive",
             kind: {:scalar, false},
             label: :optional,
             name: :cterecursive,
             tag: 8,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:cterefcount) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cterefcount",
             kind: {:scalar, 0},
             label: :optional,
             name: :cterefcount,
             tag: 9,
             type: :int32
           }}
        end

        def field_def("cterefcount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cterefcount",
             kind: {:scalar, 0},
             label: :optional,
             name: :cterefcount,
             tag: 9,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:ctecolnames) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctecolnames",
             kind: :unpacked,
             label: :repeated,
             name: :ctecolnames,
             tag: 10,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("ctecolnames") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctecolnames",
             kind: :unpacked,
             label: :repeated,
             name: :ctecolnames,
             tag: 10,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:ctecoltypes) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctecoltypes",
             kind: :unpacked,
             label: :repeated,
             name: :ctecoltypes,
             tag: 11,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("ctecoltypes") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctecoltypes",
             kind: :unpacked,
             label: :repeated,
             name: :ctecoltypes,
             tag: 11,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:ctecoltypmods) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctecoltypmods",
             kind: :unpacked,
             label: :repeated,
             name: :ctecoltypmods,
             tag: 12,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("ctecoltypmods") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctecoltypmods",
             kind: :unpacked,
             label: :repeated,
             name: :ctecoltypmods,
             tag: 12,
             type: {:message, PgQuery.Node}
           }}
        end

        []
      ),
      (
        def field_def(:ctecolcollations) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctecolcollations",
             kind: :unpacked,
             label: :repeated,
             name: :ctecolcollations,
             tag: 13,
             type: {:message, PgQuery.Node}
           }}
        end

        def field_def("ctecolcollations") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ctecolcollations",
             kind: :unpacked,
             label: :repeated,
             name: :ctecolcollations,
             tag: 13,
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
    def default(:ctename) do
      {:ok, ""}
    end,
    def default(:aliascolnames) do
      {:error, :no_default_value}
    end,
    def default(:ctematerialized) do
      {:ok, :CTEMATERIALIZE_UNDEFINED}
    end,
    def default(:ctequery) do
      {:ok, nil}
    end,
    def default(:search_clause) do
      {:ok, nil}
    end,
    def default(:cycle_clause) do
      {:ok, nil}
    end,
    def default(:location) do
      {:ok, 0}
    end,
    def default(:cterecursive) do
      {:ok, false}
    end,
    def default(:cterefcount) do
      {:ok, 0}
    end,
    def default(:ctecolnames) do
      {:error, :no_default_value}
    end,
    def default(:ctecoltypes) do
      {:error, :no_default_value}
    end,
    def default(:ctecoltypmods) do
      {:error, :no_default_value}
    end,
    def default(:ctecolcollations) do
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
