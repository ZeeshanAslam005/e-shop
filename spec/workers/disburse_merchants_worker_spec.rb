# Test suite for DisburseMerchant backgound job that calculate disbursed orders

require 'rails_helper'
RSpec.describe DisburseMerchantsWorker, type: :worker do
  ActiveJob::Base.queue_adapter = :test

  it 'calls DisburseMerchantsWorker' do
    subject.perform
  end
end
