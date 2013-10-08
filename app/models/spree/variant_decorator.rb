module Spree
  Variant.class_eval do
    has_one :sale

    delegate :display_sale_price, :display_sale_amount, :sale_price, to: :sale, allow_nil: true

    def on_sale?
      sale.present? && sale.active?
    end
  end
end
