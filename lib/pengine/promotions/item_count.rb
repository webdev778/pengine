# frozen_string_literal: true

module Pengine
  module Promotions
    class ItemCount < Promotion
      Rule = Struct.new(:item, :count)
      def initialize(&block)
        @rules = []
        self.instance_exec(&block)
      end

      # DSL

      def product(sku, count)
        @rules << Rule.new(sku, count)
      end

      def price(price)
        @price = price
      end
    end
  end
end
