#factory for order

FactoryBot.define do
  factory :order do
    merchant { create(:merchant) }
    shopper { create(:shopper) }

    amount { Faker::Number.number }
    completed_at { Date.today }
  end
end
