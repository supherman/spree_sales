module Spree
  class PercentageSale < Sale
    has_many :percentage_sales_variants, foreign_key: :sale_id
    has_many :variants, through: :percentage_sales_variants

    validates :value, :numericality => { :less_than_or_equal_to => 100.0 }

  end
end
