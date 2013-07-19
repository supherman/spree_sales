require 'spec_helper'

describe Spree::Variant do
  describe '#on_sale?' do
    subject { create(:variant) }

    context 'When the variant has an active sale' do
      before do
        Spree::Sale.create variants: [subject], start_at: 2.days.ago, end_at: 2.days.from_now
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
end
