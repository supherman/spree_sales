module Spree
  Variant.class_eval do
    has_many :sales_variants
    has_many :sales, through: :sales_variants

    has_many :percentage_sales_variants
    has_many :percentage_sales, through: :percentage_sales_variants

    has_many :price_sales_variants
    has_many :price_sales, through: :price_sales_variants

    delegate :display_sale_price, :display_sale_amount, :sale_price, to: :default_sale_price, allow_nil: true

    def on_sale?
      sales.active.any?
    end

    def default_sale_price
      sales_variants.includes(:sale).merge(Sale.active).first
    end
  end
end
