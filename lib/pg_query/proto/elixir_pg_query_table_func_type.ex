# credo:disable-for-this-file
defmodule PgQuery.TableFuncType do
  @moduledoc false
  (
    defstruct []

    (
      @spec default() :: :TABLE_FUNC_TYPE_UNDEFINED
      def default() do
        :TABLE_FUNC_TYPE_UNDEFINED
      end
    )

    @spec encode(atom() | String.t()) :: integer() | atom()
    [
      (
        def encode(:TABLE_FUNC_TYPE_UNDEFINED) do
          0
        end

        def encode("TABLE_FUNC_TYPE_UNDEFINED") do
          0
        end
      ),
      (
        def encode(:TFT_XMLTABLE) do
          1
        end

        def encode("TFT_XMLTABLE") do
          1
        end
      ),
      (
        def encode(:TFT_JSON_TABLE) do
          2
        end

        def encode("TFT_JSON_TABLE") do
          2
        end
      )
    ]

    def encode(x) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def decode(0) do
        :TABLE_FUNC_TYPE_UNDEFINED
      end,
      def decode(1) do
        :TFT_XMLTABLE
      end,
      def decode(2) do
        :TFT_JSON_TABLE
      end
    ]

    def decode(x) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def constants() do
      [{0, :TABLE_FUNC_TYPE_UNDEFINED}, {1, :TFT_XMLTABLE}, {2, :TFT_JSON_TABLE}]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def has_constant?(:TABLE_FUNC_TYPE_UNDEFINED) do
          true
        end,
        def has_constant?(:TFT_XMLTABLE) do
          true
        end,
        def has_constant?(:TFT_JSON_TABLE) do
          true
        end
      ]

      def has_constant?(_) do
        false
      end
    )
  )
end
