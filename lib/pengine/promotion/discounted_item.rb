# frozen_string_literal: true

module Pengine
  class Promotion
    # Represents a discounted cart item
    class DiscountedItem < Cart::Item
      def initialize(sku, count, price, promotion)
        @sku, @count, @price, @promotion = sku, count, price, promotion
      end

      attr_accessor :sku, :count, :price, :promotion
    end
  end
end
