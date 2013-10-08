module Spree
  class Sale < ActiveRecord::Base
    include Spree::Sales::Scopes

    belongs_to :variant

    validates :start_at, presence: true
    validates :end_at,
              presence: true
              :cannot_be_before_start_at

    attr_accessible :variant, :variant_id, :start_at, :end_at, :value, :type

    def active?
      start_at <= Time.zone.now && end_at >= Time.zone.now
    end

    def display_sale_amount
      Spree::Money.new(sale_price || 0, { currency: Spree::Config[:currency] })
    end

    def sale_price
      raise 'Not implemented'
    end

    alias :display_sale_price :display_sale_amount
  end
end
