require 'spec_helper'

describe Spree::Variant do
  describe '#on_sale?' do
    subject { create(:variant) }

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
