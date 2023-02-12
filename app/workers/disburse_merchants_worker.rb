# frozen_string_literal: true

class DisburseMerchantsWorker
  include Sidekiq::Worker

  def perform(*_args)
    Disbursement.disburse!
  end
end
