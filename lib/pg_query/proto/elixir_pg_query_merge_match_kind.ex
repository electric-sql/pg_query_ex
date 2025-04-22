# credo:disable-for-this-file
defmodule PgQuery.MergeMatchKind do
  @moduledoc false
  (
    defstruct []

    (
      @spec default() :: :MERGE_MATCH_KIND_UNDEFINED
      def default() do
        :MERGE_MATCH_KIND_UNDEFINED
      end
    )

    @spec encode(atom() | String.t()) :: integer() | atom()
    [
      (
        def encode(:MERGE_MATCH_KIND_UNDEFINED) do
          0
        end

        def encode("MERGE_MATCH_KIND_UNDEFINED") do
          0
        end
      ),
      (
        def encode(:MERGE_WHEN_MATCHED) do
          1
        end

        def encode("MERGE_WHEN_MATCHED") do
          1
        end
      ),
      (
        def encode(:MERGE_WHEN_NOT_MATCHED_BY_SOURCE) do
          2
        end

        def encode("MERGE_WHEN_NOT_MATCHED_BY_SOURCE") do
          2
        end
      ),
      (
        def encode(:MERGE_WHEN_NOT_MATCHED_BY_TARGET) do
          3
        end

        def encode("MERGE_WHEN_NOT_MATCHED_BY_TARGET") do
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
        :MERGE_MATCH_KIND_UNDEFINED
      end,
      def decode(1) do
        :MERGE_WHEN_MATCHED
      end,
      def decode(2) do
        :MERGE_WHEN_NOT_MATCHED_BY_SOURCE
      end,
      def decode(3) do
        :MERGE_WHEN_NOT_MATCHED_BY_TARGET
      end
    ]

    def decode(x) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def constants() do
      [
        {0, :MERGE_MATCH_KIND_UNDEFINED},
        {1, :MERGE_WHEN_MATCHED},
        {2, :MERGE_WHEN_NOT_MATCHED_BY_SOURCE},
        {3, :MERGE_WHEN_NOT_MATCHED_BY_TARGET}
      ]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def has_constant?(:MERGE_MATCH_KIND_UNDEFINED) do
          true
        end,
        def has_constant?(:MERGE_WHEN_MATCHED) do
          true
        end,
        def has_constant?(:MERGE_WHEN_NOT_MATCHED_BY_SOURCE) do
          true
        end,
        def has_constant?(:MERGE_WHEN_NOT_MATCHED_BY_TARGET) do
          true
        end
      ]

      def has_constant?(_) do
        false
      end
    )
  )
end
