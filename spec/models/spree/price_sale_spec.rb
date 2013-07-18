require 'spec_helper'

describe Spree::PriceSale do
  let(:variant) { mock(Spree::Variant, price: 10) }
  before do
    subject.value = 2
    subject.stub variant: variant
  end

  describe '#sale_price' do
    it 'is the substraction of the value to the variant price' do
      expect(subject.sale_price).to eq 8
    end
  end
end
