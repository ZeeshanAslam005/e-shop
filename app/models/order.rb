# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper

  validates :amount, presence: true, numericality: true

  scope :completed, -> { where('completed_at is not null') }

  #formula for calculating disbursed amount for each order
  def disburse_amount
    amount - (amount * percentage)
  end

  private

  def percentage
    if amount.between?(FIRST_LIMIT, SECOND_LIMIT) #if amount is in between first and second limit
      SECOND_LIMIT_FEE
    elsif amount > SECOND_LIMIT #if amount is greate then second limit
      THIRD_LIMIT_FEE
    else
      FIRST_LIMIT_FEE #if less than second limit
    end
  end
end
