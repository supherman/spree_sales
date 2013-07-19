module Spree
  class SalesVariant < ActiveRecord::Base
    belongs_to :variant
    belongs_to :sale

    def display_sale_amount
      Spree::Money.new(sale_price || 0, { currency: Spree::Config[:currency] })
    end

    def sale_price
      raise 'Not implemented'
    end

    alias :display_sale_price :display_sale_amount

  end
end
