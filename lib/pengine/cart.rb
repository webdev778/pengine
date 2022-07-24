# frozen_string_literal: true

module Pengine
  # Cart is a class used for tests, a real application would use
  # any class, that is duck-typing compatible with Cart.
  #
  # We assume, that cart items are deduplicated before adding.
  class Cart
    def initialize
      @items = []
    end

    attr_accessor :items

    def deep_dup
      dup.tap do |cart|
        cart.items = items.map(&:dup)
      end
    end
  end
end
