module Spree
  class Sale < ActiveRecord::Base
    include Spree::Sales::Scopes

    has_and_belongs_to_many :variants

    attr_accessible :variant, :start_at, :end_at, :value

    def display_sale_amount
      Spree::Money.new(sale_price || 0, { currency: Spree::Config[:currency] })
    end

    def sale_price
      raise 'Not implemented'
    end

    def active?
      start_at <= Time.zone.now && end_at >= Time.zone.now
    end

    alias :display_sale_price :display_sale_amount

  end
end
