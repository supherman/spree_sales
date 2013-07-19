module Spree
  class PriceSale < Sale
    has_many :price_sales_variants, foreign_key: :sale_id
    has_many :variants, through: :price_sales_variants
  end
end
