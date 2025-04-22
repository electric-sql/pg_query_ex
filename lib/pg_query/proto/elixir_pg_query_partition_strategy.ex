# credo:disable-for-this-file
defmodule PgQuery.PartitionStrategy do
  @moduledoc false
  (
    defstruct []

    (
      @spec default() :: :PARTITION_STRATEGY_UNDEFINED
      def default() do
        :PARTITION_STRATEGY_UNDEFINED
      end
    )

    @spec encode(atom() | String.t()) :: integer() | atom()
    [
      (
        def encode(:PARTITION_STRATEGY_UNDEFINED) do
          0
        end

        def encode("PARTITION_STRATEGY_UNDEFINED") do
          0
        end
      ),
      (
        def encode(:PARTITION_STRATEGY_LIST) do
          1
        end

        def encode("PARTITION_STRATEGY_LIST") do
          1
        end
      ),
      (
        def encode(:PARTITION_STRATEGY_RANGE) do
          2
        end

        def encode("PARTITION_STRATEGY_RANGE") do
          2
        end
      ),
      (
        def encode(:PARTITION_STRATEGY_HASH) do
          3
        end

        def encode("PARTITION_STRATEGY_HASH") do
          3
        end
      )
    ]

    def encode(x) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def decode(0) do
        :PARTITION_STRATEGY_UNDEFINED
      end,
      def decode(1) do
        :PARTITION_STRATEGY_LIST
      end,
      def decode(2) do
        :PARTITION_STRATEGY_RANGE
      end,
      def decode(3) do
        :PARTITION_STRATEGY_HASH
      end
    ]

    def decode(x) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def constants() do
      [
        {0, :PARTITION_STRATEGY_UNDEFINED},
        {1, :PARTITION_STRATEGY_LIST},
        {2, :PARTITION_STRATEGY_RANGE},
        {3, :PARTITION_STRATEGY_HASH}
      ]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def has_constant?(:PARTITION_STRATEGY_UNDEFINED) do
          true
        end,
        def has_constant?(:PARTITION_STRATEGY_LIST) do
          true
        end,
        def has_constant?(:PARTITION_STRATEGY_RANGE) do
          true
        end,
        def has_constant?(:PARTITION_STRATEGY_HASH) do
          true
        end
      ]

      def has_constant?(_) do
        false
      end
    )
  )
end
