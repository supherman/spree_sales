module Spree
  class PriceSale < Sale
    def sale_price
      variant.price - value
    end
  end
end
