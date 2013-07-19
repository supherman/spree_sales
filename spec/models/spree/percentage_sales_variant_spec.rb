require 'spec_helper'

describe Spree::PercentageSalesVariant do
  let(:variant) { double(Spree::Variant, price: 10.0) }
  let(:sale) { double(Spree::PercentageSale, value: 10.0) }

  before do
    subject.stub variant: variant
    subject.stub percentage_sale: sale
  end

  describe '#sale_price' do
    it 'is the substraction of the percentage value to the variant price' do
      expect(subject.sale_price).to eq 9.0
    end
  end
end
