# == Schema Information
#
# Table name: addresses
#
#  id           :bigint           not null, primary key
#  city         :string
#  complement   :string
#  fu           :string
#  ibge_code    :string
#  neighborhood :string
#  public_place :string
#  zipcode      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  citizen_id   :bigint
#
# Indexes
#
#  index_addresses_on_citizen_id  (citizen_id)
#
# Foreign Keys
#
#  fk_rails_...  (citizen_id => citizens.id)
#
class Address < ApplicationRecord
  belongs_to :citizen

  with_options presence: true do
    validates :city
    validates :fu, length: { is: 2 }
    validates :neighborhood
    validates :public_place
    validates :zipcode, numericality: true, length: { is: 8 }
  end

  validates :ibge_code, numericality: true

  def self.ransackable_associations(_auth_object = nil)
    ["citizen"]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[ city complement fu ibge_code neighborhood public_place
        zipcode]
  end
end
