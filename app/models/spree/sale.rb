module Spree
  class Sale < ActiveRecord::Base
    include Spree::Sales::Scopes

    has_many :sales_variants
    has_many :variants, through: :sales_variants

    validates :start_at, presence: true
    validates :end_at,
              presence: true
              :cannot_be_before_start_at

    attr_accessible :variants, :start_at, :end_at, :value, :type

    def active?
      start_at <= Time.zone.now && end_at >= Time.zone.now
    end
  end
end
