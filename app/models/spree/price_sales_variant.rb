module Spree
  class PriceSalesVariant < SalesVariant
    belongs_to :price_sale, foreign_key: :sale_id

    def sale_price
      variant.price - price_sale.value
    end

  end
end
