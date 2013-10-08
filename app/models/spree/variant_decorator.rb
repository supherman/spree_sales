module Spree
  Variant.class_eval do
    has_one :sale

    delegate :display_sale_price, :display_sale_amount, :sale_price,
             to: :sale,
             allow_nil: true

    delegate :value, :value=, :start_at, :start_at=, :end_at, :end_at=, :type, :type=,
             to: :sale,
             prefix: true,
             allow_nil: true

    attr_accessible :sale_value, :sale_start_at, :sale_end_at, :sale_type

    after_initialize :find_or_build_sale

    after_save :save_sale

    def on_sale?
      sale && sale.active? && sale.value > 0
    end

    private

    def find_or_build_sale
      sale || build_sale
    end

    def save_sale
      sale.save if sale && (sale.changed? || sale.new_record?)
    end
  end
end
