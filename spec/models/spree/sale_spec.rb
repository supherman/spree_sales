require 'spec_helper'

describe Spree::Sale do
  before do
    subject.stub sale_price: 10
  end

  describe '#display_sale_amount' do
  end

  describe '#display_sale_amount' do
    before do
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

  describe '#active?' do
    context 'Sale is active' do
      before do
        subject.start_at = 2.days.ago
        subject.end_at = 2.days.from_now
      end

      it 'is true when today is among start_at and end_at dates' do
        expect(subject.active?).to be_true
      end
    end

    context 'Sale is inactive' do
      before do
        subject.start_at = 2.days.ago
        subject.end_at = 1.day.ago
      end

      it 'is false when today is not among start_at and end_at dates' do
        expect(subject.active?).to be_false
      end
    end
  end

end
