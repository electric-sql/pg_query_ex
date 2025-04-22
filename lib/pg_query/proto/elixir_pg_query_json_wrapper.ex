# credo:disable-for-this-file
defmodule PgQuery.JsonWrapper do
  @moduledoc false
  (
    defstruct []

    (
      @spec default() :: :JSON_WRAPPER_UNDEFINED
      def default() do
        :JSON_WRAPPER_UNDEFINED
      end
    )

    @spec encode(atom() | String.t()) :: integer() | atom()
    [
      (
        def encode(:JSON_WRAPPER_UNDEFINED) do
          0
        end

        def encode("JSON_WRAPPER_UNDEFINED") do
          0
        end
      ),
      (
        def encode(:JSW_UNSPEC) do
          1
        end

        def encode("JSW_UNSPEC") do
          1
        end
      ),
      (
        def encode(:JSW_NONE) do
          2
        end

        def encode("JSW_NONE") do
          2
        end
      ),
      (
        def encode(:JSW_CONDITIONAL) do
          3
        end

        def encode("JSW_CONDITIONAL") do
          3
        end
      ),
      (
        def encode(:JSW_UNCONDITIONAL) do
          4
        end

        def encode("JSW_UNCONDITIONAL") do
          4
        end
      )
    ]

    def encode(x) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def decode(0) do
        :JSON_WRAPPER_UNDEFINED
      end,
      def decode(1) do
        :JSW_UNSPEC
      end,
      def decode(2) do
        :JSW_NONE
      end,
      def decode(3) do
        :JSW_CONDITIONAL
      end,
      def decode(4) do
        :JSW_UNCONDITIONAL
      end
    ]

    def decode(x) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def constants() do
      [
        {0, :JSON_WRAPPER_UNDEFINED},
        {1, :JSW_UNSPEC},
        {2, :JSW_NONE},
        {3, :JSW_CONDITIONAL},
        {4, :JSW_UNCONDITIONAL}
      ]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def has_constant?(:JSON_WRAPPER_UNDEFINED) do
          true
        end,
        def has_constant?(:JSW_UNSPEC) do
          true
        end,
        def has_constant?(:JSW_NONE) do
          true
        end,
        def has_constant?(:JSW_CONDITIONAL) do
          true
        end,
        def has_constant?(:JSW_UNCONDITIONAL) do
          true
        end
      ]

      def has_constant?(_) do
        false
      end
    )
  )
end
