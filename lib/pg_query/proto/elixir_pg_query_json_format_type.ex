# credo:disable-for-this-file
defmodule PgQuery.JsonFormatType do
  @moduledoc false
  (
    defstruct []

    (
      @spec default() :: :JSON_FORMAT_TYPE_UNDEFINED
      def default() do
        :JSON_FORMAT_TYPE_UNDEFINED
      end
    )

    @spec encode(atom() | String.t()) :: integer() | atom()
    [
      (
        def encode(:JSON_FORMAT_TYPE_UNDEFINED) do
          0
        end

        def encode("JSON_FORMAT_TYPE_UNDEFINED") do
          0
        end
      ),
      (
        def encode(:JS_FORMAT_DEFAULT) do
          1
        end

        def encode("JS_FORMAT_DEFAULT") do
          1
        end
      ),
      (
        def encode(:JS_FORMAT_JSON) do
          2
        end

        def encode("JS_FORMAT_JSON") do
          2
        end
      ),
      (
        def encode(:JS_FORMAT_JSONB) do
          3
        end

        def encode("JS_FORMAT_JSONB") do
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
        :JSON_FORMAT_TYPE_UNDEFINED
      end,
      def decode(1) do
        :JS_FORMAT_DEFAULT
      end,
      def decode(2) do
        :JS_FORMAT_JSON
      end,
      def decode(3) do
        :JS_FORMAT_JSONB
      end
    ]

    def decode(x) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def constants() do
      [
        {0, :JSON_FORMAT_TYPE_UNDEFINED},
        {1, :JS_FORMAT_DEFAULT},
        {2, :JS_FORMAT_JSON},
        {3, :JS_FORMAT_JSONB}
      ]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def has_constant?(:JSON_FORMAT_TYPE_UNDEFINED) do
          true
        end,
        def has_constant?(:JS_FORMAT_DEFAULT) do
          true
        end,
        def has_constant?(:JS_FORMAT_JSON) do
          true
        end,
        def has_constant?(:JS_FORMAT_JSONB) do
          true
        end
      ]

      def has_constant?(_) do
        false
      end
    )
  )
end
