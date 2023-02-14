# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { should belong_to(:merchant) }
    it { should belong_to(:shopper) }
  end

  describe 'validations' do
    it { should validate_numericality_of(:amount) }
    it { should validate_presence_of(:amount) }
  end

  context '.With completed order' do #handling class level sceope
    let!(:order) { create(:order) }

    it { expect(described_class.completed.count).to eq(1) }
  end

  context '.Without incompleted order' do #handling class level sceope
    let!(:order) { create(:order, completed_at: nil) }

    it { expect(described_class.completed.count).to eq(0) }
  end

  context '#disburse_amount' do #handling instance level methods
    it 'applies 1% disccount in first section' do
      order = create(:order, amount: 49)
      expect(Float(order.disburse_amount)).to eq(48.51)
    end

    it 'applies 0.95% disccount in second section' do
      order = create(:order, amount: 76)
      expect(Float(order.disburse_amount)).to eq(75.278)
    end

    it 'applies 0.85% disccount in third section' do
      order = create(:order, amount: 300)
      expect(Float(order.disburse_amount)).to eq(297.15)
    end
  end
end
