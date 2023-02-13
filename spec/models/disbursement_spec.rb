# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Disbursement, type: :model do
  context '.for_merchant' do #handling class level sceope
    let(:disbursement) { create(:disbursement) }

    context '.When disbursed order is in given dates' do
      let!(:order) { create(:order) }

      it {
        expect(described_class.for_merchant(
          disbursement.order.merchant_id,
          Date.yesterday,
          Date.tomorrow
        ).count)
          .to eq(1)
      }
    end

    context '.When disbursed order is not in given dates' do #handling class level sceope
      let!(:order) { create(:order, completed_at: nil) }

      it {
        expect(described_class.for_merchant(
          disbursement.order.merchant_id,
          Date.tomorrow,
          Date.tomorrow
        ).count)
          .to eq(0)
      }
    end
  end

  context '.When orders are completed' do #handling class level sceope
    let!(:order) { create(:order) }

    it 'should disbursed order' do
      expect { described_class.disburse! }.to change(described_class, :count).by 1
    end
  end

  context '.When orders are in incomplete' do #handling class level sceope
    let(:order) { create(:order, completed_at: nil) }

    it 'should not disbursed order' do
      expect { described_class.disburse! }.to_not change(described_class, :count)
    end
  end
end
