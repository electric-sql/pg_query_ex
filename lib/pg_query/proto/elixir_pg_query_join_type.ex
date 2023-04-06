# credo:disable-for-this-file
defmodule PgQuery.JoinType do
  @moduledoc false
  (
    defstruct []

    (
      @spec default() :: :JOIN_TYPE_UNDEFINED
      def default() do
        :JOIN_TYPE_UNDEFINED
      end
    )

    @spec encode(atom() | String.t()) :: integer() | atom()
    [
      (
        def encode(:JOIN_TYPE_UNDEFINED) do
          0
        end

        def encode("JOIN_TYPE_UNDEFINED") do
          0
        end
      ),
      (
        def encode(:JOIN_INNER) do
          1
        end

        def encode("JOIN_INNER") do
          1
        end
      ),
      (
        def encode(:JOIN_LEFT) do
          2
        end

        def encode("JOIN_LEFT") do
          2
        end
      ),
      (
        def encode(:JOIN_FULL) do
          3
        end

        def encode("JOIN_FULL") do
          3
        end
      ),
      (
        def encode(:JOIN_RIGHT) do
          4
        end

        def encode("JOIN_RIGHT") do
          4
        end
      ),
      (
        def encode(:JOIN_SEMI) do
          5
        end

        def encode("JOIN_SEMI") do
          5
        end
      ),
      (
        def encode(:JOIN_ANTI) do
          6
        end

        def encode("JOIN_ANTI") do
          6
        end
      ),
      (
        def encode(:JOIN_UNIQUE_OUTER) do
          7
        end

        def encode("JOIN_UNIQUE_OUTER") do
          7
        end
      ),
      (
        def encode(:JOIN_UNIQUE_INNER) do
          8
        end

        def encode("JOIN_UNIQUE_INNER") do
          8
        end
      )
    ]

    def encode(x) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def decode(0) do
        :JOIN_TYPE_UNDEFINED
      end,
      def decode(1) do
        :JOIN_INNER
      end,
      def decode(2) do
        :JOIN_LEFT
      end,
      def decode(3) do
        :JOIN_FULL
      end,
      def decode(4) do
        :JOIN_RIGHT
      end,
      def decode(5) do
        :JOIN_SEMI
      end,
      def decode(6) do
        :JOIN_ANTI
      end,
      def decode(7) do
        :JOIN_UNIQUE_OUTER
      end,
      def decode(8) do
        :JOIN_UNIQUE_INNER
      end
    ]

    def decode(x) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def constants() do
      [
        {0, :JOIN_TYPE_UNDEFINED},
        {1, :JOIN_INNER},
        {2, :JOIN_LEFT},
        {3, :JOIN_FULL},
        {4, :JOIN_RIGHT},
        {5, :JOIN_SEMI},
        {6, :JOIN_ANTI},
        {7, :JOIN_UNIQUE_OUTER},
        {8, :JOIN_UNIQUE_INNER}
      ]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def has_constant?(:JOIN_TYPE_UNDEFINED) do
          true
        end,
        def has_constant?(:JOIN_INNER) do
          true
        end,
        def has_constant?(:JOIN_LEFT) do
          true
        end,
        def has_constant?(:JOIN_FULL) do
          true
        end,
        def has_constant?(:JOIN_RIGHT) do
          true
        end,
        def has_constant?(:JOIN_SEMI) do
          true
        end,
        def has_constant?(:JOIN_ANTI) do
          true
        end,
        def has_constant?(:JOIN_UNIQUE_OUTER) do
          true
        end,
        def has_constant?(:JOIN_UNIQUE_INNER) do
          true
        end
      ]

      def has_constant?(_) do
        false
      end
    )
  )
end
