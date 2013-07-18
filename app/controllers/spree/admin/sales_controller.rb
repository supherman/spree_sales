module Spree
  module Admin
    class SalesController < ResourceController
      def index
        @sales = Sale.all
      end
    end
  end
end
