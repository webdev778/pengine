# frozen_string_literal: true

module Pengine
  class Promotion
    # Represents a discounted cart item.
    class DiscountedItem
      def initialize(count, price, promotion)
        @count, @price, @promotion = count, price, promotion

        # This is so that we keep API with Cart::Item.
        # Should != any real sku.
        @sku = promotion
      end

      attr_accessor :sku, :count, :price, :promotion
    end
  end
end
