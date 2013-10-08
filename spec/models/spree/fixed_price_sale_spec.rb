require 'spec_helper'

describe Spree::FixedPriceSale do
  before do
    subject.value = 9
  end

  describe '#sale_price' do
    it 'is the new fixed price' do
      expect(subject.sale_price).to eq 9
    end
  end
end
