module Spree
  class FixedPriceSale < Sale
    has_many :fixed_price_sales_variants, foreign_key: :sale_id
    has_many :variants, through: :fixed_price_sales_variants
  end
end
