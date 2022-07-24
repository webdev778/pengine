# frozen_string_literal: true

module Pengine
  # A superclass for promotions.
  class Promotion
    def update_cart(instance, cart)
      raise NotImplementedError
    end
  end
end
