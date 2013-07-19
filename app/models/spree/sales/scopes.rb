module Spree
  module Sales
    module Scopes
      extend ActiveSupport::Concern

      included do
        scope :active, -> { where("#{Spree::Sale.quoted_table_name}.start_at <= ?", Time.zone.now).where("#{Spree::Sale.quoted_table_name}.end_at >= ?", Time.zone.now) }
      end
    end
  end
end
