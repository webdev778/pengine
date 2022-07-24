# frozen_string_literal: true

RSpec.describe Pengine do
  let :engine do
    engine = Pengine::Instance.new
    engine.add_product "A", 50
    engine.add_product "B", 30
    engine.add_product "C", 20
    engine.add_product "D", 15

    engine.add_rule Pengine::Promotions::ItemCount do
      given_product "A", 3
      set_price_to 130
    end

    engine.add_rule Pengine::Promotions::ItemCount do
      given_product "B", 2
      set_price_to 45
    end

    engine.add_rule Pengine::Promotions::ItemCount do
      given_product "C"
      given_product "D"
      set_price_to 30
    end

    engine
  end

  scenarios =
    {
      :A => Pengine::Cart.new <<
            Pengine::Cart::Item.new("A") <<
            Pengine::Cart::Item.new("B") <<
            Pengine::Cart::Item.new("C"),
      :B => Pengine::Cart.new <<
            Pengine::Cart::Item.new("A", 5) <<
            Pengine::Cart::Item.new("B", 5) <<
            Pengine::Cart::Item.new("C"),
      :C => Pengine::Cart.new <<
            Pengine::Cart::Item.new("A", 3) <<
            Pengine::Cart::Item.new("B", 5) <<
            Pengine::Cart::Item.new("C") <<
            Pengine::Cart::Item.new("D"),
    }

  let :regular_prices do
    {
      :A => 100,
      :B => 420,
      :C => 335,
    }
  end

  let :discounted_prices do
    {
      :A => 100,
      :B => 370,
      :C => 280,
    }
  end

  scenarios.each do |scenario_id, cart|
    describe "scenario #{scenario_id}" do
      it "computes a correct regular price" do
        engine.calculate_raw(cart).should be == regular_prices[scenario_id]
      end

      it "computes a correct discounted price" do
        engine.calculate(cart).should be == discounted_prices[scenario_id]
      end
    end
  end
end
