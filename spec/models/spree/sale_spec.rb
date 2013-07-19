require 'spec_helper'

describe Spree::Sale do
  before do
    subject.stub sale_price: 10
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
