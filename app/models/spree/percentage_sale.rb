module Spree
  class PercentageSale < Sale
    validates :value, :numericality => { :less_than_or_equal_to => 100.0 }

    def sale_price
      variant.price - (variant.price*(value/100))
    end
  end
end
