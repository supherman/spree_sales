module Spree
  Variant.class_eval do
    has_one :sales_variant
    has_one :sale, through: :sales_variant

    accepts_nested_attributes_for :sale

    delegate :display_sale_price, :display_sale_amount, :sale_price, to: :sales_variant, allow_nil: true

    def on_sale?
      sale.present? && sale.active?
    end
  end
end
