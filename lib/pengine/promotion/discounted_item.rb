# frozen_string_literal: true

module Pengine
  class Promotion
    # Represents a discounted cart item
    class DiscountedItem < Cart::Item
      def initialize(count, price, promotion)
        @count, @price, @promotion = count, price, promotion
      end

      attr_accessor :count, :price, :promotion
    end
  end
end
