module Sms
  class CreateCitizenJob < ApplicationJob
    def perform(citizen)
      message = 'Munícipe criado'
      SendSms.new(message, citizen.telephone).call
    end
  end
end
