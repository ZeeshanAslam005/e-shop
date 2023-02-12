# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::DisbursementsController, type: :controller do
  describe 'GET #index' do
    subject { get :index, params: }

    let(:disbursement) { create(:disbursement) }

    before do
      disbursement
      subject
    end

    context '#With all disbursed orders' do
      let(:params) { {} }

      it 'returns all disbursements of all merchant' do
        expect(JSON.parse(response.body).count).to eq(1)
      end
    end

    context '#When merchant is provided' do
      let(:params) { { merchant: disbursement.order.merchant_id } }

      it 'returns all disbursements of given merchant' do
        json = JSON.parse(response.body)
        merchant_ids = json.map { |disbursement| disbursement['merchant_id'] }

        expect(merchant_ids.uniq.count).to eq(1)
      end
    end

    context '#When merchnat is provided with dates' do
      context '#When there is order in given date returns []' do
        let(:params) do
          { merchant: disbursement.order.merchant_id, start_date: Date.yesterday, end_date: Date.tomorrow }
        end

        it { expect(JSON.parse(response.body)).not_to be_empty }
      end

      context '#When there is no order in given date returns empty []' do
        let(:params) do
          { merchant: disbursement.order.merchant_id, start_date: Date.tomorrow, end_date: Date.tomorrow }
        end

        it { expect(JSON.parse(response.body)).to be_empty }
      end
    end
  end
end
