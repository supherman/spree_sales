Spree::Variant.class_eval do
  has_and_belongs_to_many :sales
  has_many :percentage_sales
  has_many :price_sales

  has_one :default_sale_price,
          class_name: 'Spree::Sale',
          conditions: proc { ["#{Spree::Sale.quoted_table_name}.start_at <= ? AND #{Spree::Sale.quoted_table_name}.end_at >= ?", Time.zone.now, Time.zone.now] }

  delegate :display_sale_price, :display_sale_amount, :sale_price, to: :default_sale_price, allow_nil: true

  def on_sale?
    sales.active.any?
  end
end
