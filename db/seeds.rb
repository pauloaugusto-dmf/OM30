# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do
  params = {
    cns: Faker::Number.leading_zero_number(digits: 15).to_s,
    cpf: CPF.generate,
    date_of_birth: Faker::Date.between(from: 90.years.ago, to: 1.year.ago).to_s,
    email: Faker::Internet.unique.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    status: %w[true false].sample,
    telephone: Faker::Number.number(digits: 13).to_s,
    address_attributes: {
      city: Faker::Address.city,
      complement: Faker::Address.community,
      fu: Faker::Address.country_code,
      ibge_code: Faker::Number.number(digits: 7),
      neighborhood: Faker::Address.city_prefix,
      public_place: Faker::Address.street_address,
      zipcode: Faker::Number.number(digits: 8)
    }
  }
  citizen = Citizen.new(params)
  citizen.photo.attach(
    io: File.open(Rails.root.join('app', 'assets', 'images', 'avatar.png')),
    filename: 'avatar.png',
    content_type: 'image/png'
  )
  citizen.save!
end
