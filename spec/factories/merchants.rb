##factory for merchant

FactoryBot.define do
  factory :merchant do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    cif { Faker::IDNumber.spanish_citizen_number } #create a string with some identification
  end
end
