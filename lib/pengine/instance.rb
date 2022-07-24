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

    # Calculate cart price without applying promotions
    def calculate_raw(cart)
    end

    # Calculate cart price after applying promotions
    def calculate(cart)
    end

    # Test helpers

    def add_rule(promotion_class, ...)
      register_rule(promotion_class.new(...))
    end

    def add_product(sku, price)
      Product.new(sku, price)
    end
  end
end
