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
  has_many_attached :photo
end
