module Spree
  class PercentageSalesVariant < SalesVariant
    belongs_to :percentage_sale, foreign_key: :sale_id

    def sale_price
      variant.price - (variant.price*(percentage_sale.value/100))
    end
  end
end
