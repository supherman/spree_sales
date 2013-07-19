module Spree
  module Admin
    class SalesController < ResourceController
      def index
        @sales = Sale.all
      end

      def new
        @sale = Sale.new
      end
    end
  end
end
