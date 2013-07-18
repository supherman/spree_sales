require 'spec_helper'

describe Spree::PercentageSale do
  let(:variant) { mock(Spree::Variant, price: 10) }
  before do
    subject.value = 10
    subject.stub variant: variant
  end

  describe '#sale_price' do
    it 'is the substraction of the percentage value to the variant price' do
      expect(subject.sale_price).to eq 9
    end
  end
end
