# frozen_string_literal: true

module Pengine
  # Product is a class used for tests, a real application would use
  # any class, that is duck-typing compatible with Product.
  class Product
    def initialize(sku, price)
      @sku, @price = sku, price
    end

    attr_accessor :sku, :price
  end
end
