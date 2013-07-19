require 'spec_helper'

describe Spree::PriceSalesVariant do
  let(:variant) { double(Spree::Variant, price: 10) }
  let(:sale) { double(Spree::PriceSale, value: 2) }
  before do
    subject.stub variant: variant
    subject.stub price_sale: sale
  end

  describe '#sale_price' do
    it 'is the substraction of the value to the variant price' do
      expect(subject.sale_price).to eq 8
    end
  end
end

