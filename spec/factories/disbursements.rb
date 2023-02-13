#factory for disbursement

FactoryBot.define do
  factory :disbursement do
    order { create(:order) }

    amount { Faker::Number.number }
  end
end
