# frozen_string_literal: true

module Pengine
  class Cart
    # Item is a class used for tests, a real application would use
    # any class, that is duck-typing compatible with Item.
    class Item
      def initialize(sku, count = 1)
        @sku, @count = sku, count
      end

      attr_accessor :sku, :count
    end
  end
end
