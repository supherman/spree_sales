module Spree
  class PercentageSale < Sale
    def sale_price
      variant.price - (variant.price*(value/100))
    end
  end
end
