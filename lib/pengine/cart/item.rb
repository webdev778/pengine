# frozen_string_literal: true

module Pengine
  class Cart
    class Item
      def initialize(sku, count)
        @sku, @count = sku, count
      end

      attr_accessor :sku, :count
    end
  end
end
