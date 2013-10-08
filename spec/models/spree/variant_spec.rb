require 'spec_helper'

describe Spree::Variant do
  describe '#on_sale?' do
    subject { create(:variant, price: 10) }

    context 'When the variant has an active sale' do
      before do
        Spree::Sale.create variant: subject, start_at: 2.days.ago, end_at: 2.days.from_now
      end

      it 'returns true' do
        expect(subject.on_sale?).to be_true
      end
    end

    context 'When the variant does not have an active sale' do
      it 'returns false' do
        expect(subject.on_sale?).to be_false
      end
    end

    context 'When a percentage sale' do
      before do
        Spree::PercentageSale.create variant: subject,
                                     start_at: 2.days.ago,
                                     end_at: 2.days.from_now,
                                     value: 10.0
      end

      it 'the sale price should be a 10% of discount' do
        expect(subject.sale_price).to eq 9
      end
    end

    context 'When a price sale' do
      before do
        Spree::PriceSale.create variant: subject,
                                     start_at: 2.days.ago,
                                     end_at: 2.days.from_now,
                                     value: 2.0
      end

      it 'the sale price should be a 10% of discount' do
        expect(subject.sale_price).to eq 8
      end
    end

    context 'When a fixed price sale' do
      before do
        Spree::FixedPriceSale.create variant: subject,
                                     start_at: 2.days.ago,
                                     end_at: 2.days.from_now,
                                     value: 7.0
      end

      it 'the sale price should be a 10% of discount' do
        expect(subject.sale_price).to eq 7
      end
    end
  end
end
