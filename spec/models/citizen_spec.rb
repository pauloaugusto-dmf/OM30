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
require 'rails_helper'

RSpec.describe Citizen, type: :model do
  subject(:citizen) { build :citizen }

  describe 'validations have_many_attached' do
    it { should have_one_attached(:photo) }
  end

  describe 'validations presence of' do
    it { should validate_presence_of(:cns) }
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:date_of_birth) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:telephone) }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(citizen).to be_valid
    end

    it 'it not valid with invalid cns' do
      citizen.cns = '45'
      expect(citizen).to_not be_valid
    end

    it 'it not valid with invalid cpf' do
      citizen.cpf = '45'
      expect(citizen).to_not be_valid
    end

    it 'it not valid with date entered greater than the current date' do
      citizen.date_of_birth = Time.zone.today + 1.year
      expect(citizen).to_not be_valid
    end

    it 'it not valid with non-existent date' do
      citizen.date_of_birth = "Sat, 45 Mar 2020"
      expect(citizen).to_not be_valid
    end

    it 'it not valid with invalid email' do
      citizen.email = '45'
      expect(citizen).to_not be_valid
    end

    it 'it not valid with invalid telephone' do
      citizen.telephone = '45'
      expect(citizen).to_not be_valid
    end
  end
end
