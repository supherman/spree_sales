module Spree
  class FixedPriceSale < Sale
    def sale_price
      value
    end
  end
end
