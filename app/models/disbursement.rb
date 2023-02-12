# frozen_string_literal: true

class Disbursement < ApplicationRecord
  belongs_to :order

  scope :for_merchant, lambda { |merchant_id, start_date, end_date|
    joins(:order).where(
      'orders.merchant_id = :merchant_id AND cast(disbursements.created_at as date) BETWEEN :start_date AND :end_date',
      { merchant_id:,
        start_date: start_date.to_date,
        end_date: end_date.to_date }
    )
  }

  def self.disburse!
    scope = Order.completed
    scope.each do |order|
      create!(
        order_id: order.id,
        amount: order.disburse_amount
      )
    end
  end
end
