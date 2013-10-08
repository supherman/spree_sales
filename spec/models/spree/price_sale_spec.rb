require 'spec_helper'

describe Spree::PriceSale do
  let(:variant) { double(Spree::Variant, price: 10) }
  before do
    subject.stub variant: variant
    subject.value = 2
  end

  describe '#sale_price' do
    it 'is the substraction of the value to the variant price' do
      expect(subject.sale_price).to eq 8
    end
  end
end
