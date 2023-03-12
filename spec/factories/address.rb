FactoryBot.define do
  factory :address do
    city { Faker::Address.city }
    complement { Faker::Address.community }
    fu { Faker::Address.country_code }
    ibge_code { Faker::Number.number(digits: 7) }
    neighborhood { Faker::Address.city_prefix }
    public_place { Faker::Address.street_address }
    zipcode { Faker::Number.number(digits: 8) }
    citizen
  end
end
