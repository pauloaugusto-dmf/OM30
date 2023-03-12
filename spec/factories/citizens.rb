# == Schema Information
#
# Table name: citizens
#
#  id            :bigint           not null, primary key
#  cns           :string
#  cpf           :string
#  date_of_birth :date
#  email         :string
#  first_name    :string
#  last_name     :string
#  status        :boolean
#  telephone     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :citizen do
    cns { Faker::Number.leading_zero_number(digits: 15).to_s }
    cpf { CPF.generate }
    date_of_birth { Faker::Date.between(from: 90.years.ago, to: 1.year.ago).to_s }
    email { Faker::Internet.unique.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    status { true }
    telephone { Faker::Number.number(digits: 13).to_s }

    after(:build) do |citizen|
      citizen.photo { Rack::Test::UploadedFile.new('path', 'image/png') }
    end
  end
end
