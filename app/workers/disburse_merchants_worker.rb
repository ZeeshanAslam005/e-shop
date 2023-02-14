# frozen_string_literal: true

class DisburseMerchantsWorker
  include Sidekiq::Worker

  def perform(*_args) #call method to calculate disburse orders
    Disbursement.disburse!
  end
end
