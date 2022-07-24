# frozen_string_literal: true

module Pengine
  # The main class of the Pengine, it runs calculations, registers
  # promotion rules.
  class Instance
    def initialize
      @rules = []
      @products = {}
    end

    def register_rule(promotion_rule)
      @rules << promotion_rule
    end

    def register_product(product)
      @products[product.sku] = product
    end

    # Calculate cart price without applying promotions (unless they have been applied)
    def calculate_raw(cart)
      cart.items.sum do |item|
        if item.is_a? Promotion::DiscountedItem
          item.count * item.price
        else
          item.count * @products[item.sku].price
        end
      end
    end

    # Calculate cart price after applying promotions
    def calculate(cart)
      cart = cart.deep_dup

      @rules.each do |rule|
        cart = rule.update_cart(self, cart)
      end

      calculate_raw(cart)
    end

    # Test helpers

    def add_rule(promotion_class, ...)
      register_rule(promotion_class.new(...))
    end

    def add_product(sku, price)
      register_product(Product.new(sku, price))
    end
  end
end
