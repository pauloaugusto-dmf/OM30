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
class Citizen < ApplicationRecord
  has_one :address, dependent: :destroy
  has_one_attached :photo

  accepts_nested_attributes_for :address

  delegate :city, :complement, :fu, :ibge_code, :neighborhood, :public_place, :zipcode, to: :address, prefix: true

  with_options presence: true do
    validates :cns, numericality: { only_integer: true }, length: { is: 15 }
    validates :cpf, cpf: true, numericality: { only_integer: true }
    validates :email, email: true
    validates :date_of_birth, datetime: true
    validates :first_name
    validates :last_name
    validates :telephone, length: { minimum: 10, maximum: 15 }
  end

  validates_with CitizenDateValidator

  self.per_page = 10

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[cns cpf date_of_birth email first_name id last_name status telephone address_city address_complement address_fu
       address_ibge_code address_neighborhood address_public_place address_zipcode]
  end
end
