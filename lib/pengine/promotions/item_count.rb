# frozen_string_literal: true

module Pengine
  module Promotions
    # A kind of promotion rule that discounts based on a number
    # of items present in a cart.
    class ItemCount < Promotion
      Rule = Struct.new(:sku, :count)
      def initialize(&block)
        super
        @rules = []
        instance_exec(&block)
      end

      attr_accessor :rules

      def update_cart(_instance, cart)
        virtual_items_to_add = 0
        while cart_has_discounted_items?(cart)
          virtual_items_to_add += 1
          remove_discounted_items_from_cart(cart)
        end
        add_virtual_item_to_cart(cart, virtual_items_to_add)

        cart
      end

      # DSL

      def given_product(sku, count = 1)
        @rules << Rule.new(sku, count)
      end

      def set_price_to(price)
        @price = price
      end

      private

      def cart_has_discounted_items?(cart)
        @rules.all? do |rule|
          item = cart.items.find { |i| i.sku == rule.sku }
          item && item.count >= rule.count
        end
      end

      def remove_discounted_items_from_cart(cart)
        @rules.each do |rule|
          item = cart.items.find { |i| i.sku == rule.sku }
          item.count -= rule.count
        end
      end

      def add_virtual_item_to_cart(cart, count)
        cart.items << Promotion::DiscountedItem.new(count, @price, self)
      end
    end
  end
end
