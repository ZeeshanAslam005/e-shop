#factory for shopper

FactoryBot.define do
  factory :shopper do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    nif { Faker::IDNumber.spanish_citizen_number } #create a string with some identification
  end
end
