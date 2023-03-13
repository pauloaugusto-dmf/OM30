module Sms
  class UpdateCitizenJob < ApplicationJob
    def perform(citizen)
      message = 'Munícipe atualizado'
      SendSms.new(message, citizen.telephone).call
    end
  end
end
