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
  has_many_attached :photo

  accepts_nested_attributes_for :address

  delegate :city, :complement, :fu, :ibge_code, :neighborhood, :public_place, :zipcode, to: :address, prefix: true

  with_options presence: true do
    validates :cns, numericality: { only_integer: true }, length: { is: 15 }
    validates :cpf, cpf: true, numericality: { only_integer: true }
    validates :email, email: true
    validates :date_of_birth, datetime: true
    validates :first_name
    validates :last_name
    validates :status
    validates :telephone, length: { minimum: 10, maximum: 15 }
  end

  validates_with CitizenDateValidator
end
