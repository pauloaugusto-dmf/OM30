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
require 'rails_helper'

RSpec.describe Address, type: :model do
  subject(:address) { build :address }

  describe "belong_to associations" do
    it { should belong_to(:citizen) }
  end

  describe 'validations presence of' do
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:fu) }
    it { should validate_presence_of(:neighborhood) }
    it { should validate_presence_of(:public_place) }
    it { should validate_presence_of(:zipcode) }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(address).to be_valid
    end

    it 'it not valid with invalid fu' do
      address.fu = 'FTY'
      expect(address).to_not be_valid
    end

    it 'it not valid with invalid zipcode' do
      address.zipcode = '45'
      expect(address).to_not be_valid
    end
  end
end
