require 'spec_helper'

describe Spree::PercentageSale do
  let(:variant) { double(Spree::Variant, price: 10.0) }

  before do
    subject.stub variant: variant
    subject.value = 10
  end

  describe '#sale_price' do
    it 'is the substraction of the percentage value to the variant price' do
      expect(subject.sale_price).to eq 9.0
    end
  end
end
