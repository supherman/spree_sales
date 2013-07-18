module Spree
  module Sales
    module Scopes
      extend ActiveSupport::Concern

      included do
        scope :active, -> { where('start_at <= ?', Time.zone.now).where('end_at >= ?', Time.zone.now) }
      end
    end
  end
end
