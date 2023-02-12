# frozen_string_literal: true

FactoryBot.define do
  factory :disbursement do
    order { create(:order) }

    amount { Faker::Number.number }
  end
end
