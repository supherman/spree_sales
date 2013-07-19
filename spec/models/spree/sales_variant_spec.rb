require 'spec_helper'

describe Spree::SalesVariant do

  describe '#display_sale_amount' do
    before do
      subject.stub sale_price: 10
      Spree::Config[:currency] = 'USD'
    end

    it 'is a money representation' do
      expect(subject.display_sale_amount).to be_a_kind_of Spree::Money
      expect(subject.display_sale_amount.to_s).to eq '$10.00'
    end

    it 'is based on the current currency' do
      expect(subject.display_sale_amount.money.currency.to_s).to eq 'USD'
    end
  end

  context 'Default sale price delegations' do
    it 'delegates display_sale_price to the default_sale_price' do
      expect(subject).to respond_to(:display_sale_price)
    end

    it 'delegates display_sale_amount to the default_sale_price' do
      expect(subject).to respond_to(:display_sale_amount)
    end

    it 'delegates sale_price to the default_sale_price' do
      expect(subject).to respond_to(:sale_price)
    end
  end
end
