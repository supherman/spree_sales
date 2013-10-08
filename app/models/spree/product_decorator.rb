module Spree
  Product.class_eval do
    delegate_belongs_to :master, :sale_value, :sale_start_at, :sale_end_at, :sale_type

    attr_accessible :sale_value, :sale_start_at, :sale_end_at, :sale_type

    delegate :display_sale_price, :display_sale_amount, :sale_price, :sale,
             to: :master,
             allow_nil: true

    def on_sale?
      variants_including_master.any? { |variant| variant.on_sale? }
    end
  end
end
