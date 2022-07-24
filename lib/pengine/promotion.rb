# frozen_string_literal: true

module Pengine
  # A superclass for promotions.
  class Promotion
    def update_cart(_instance, _cart)
      raise NotImplementedError
    end
  end
end
