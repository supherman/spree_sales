require 'spec_helper'

describe Spree::FixedPriceSalesVariant do
  let(:variant) { double(Spree::Variant, price: 10) }
  let(:sale) { double(Spree::FixedPriceSale, value: 9) }

  before do
    subject.stub variant: variant
    subject.stub fixed_price_sale: sale
  end

  describe '#sale_price' do
    it 'is the new fixed price' do
      expect(subject.sale_price).to eq 9
    end
  end
end
