# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper

  validates :amount, presence: true, numericality: true

  scope :completed, -> { where('completed_at is not null') }

  def disburse_amount
    amount - (amount * percentage)
  end

  private

  def percentage
    if amount.between?(FIRST_LIMIT, SECOND_LIMIT)
      SECOND_LIMIT_FEE
    elsif amount > SECOND_LIMIT
      THIRD_LIMIT_FEE
    else
      FIRST_LIMIT_FEE
    end
  end
end
