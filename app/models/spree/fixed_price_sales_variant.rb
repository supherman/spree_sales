module Spree
  class FixedPriceSalesVariant < SalesVariant
    belongs_to :fixed_price_sale, foreign_key: :sale_id

    def sale_price
      fixed_price_sale.value
    end
  end
end
