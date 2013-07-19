module Spree
  class PercentageSale < Sale
    has_many :percentage_sales_variants, foreign_key: :sale_id
    has_many :variants, through: :percentage_sales_variants
  end
end
