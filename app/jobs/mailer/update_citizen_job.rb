module Mailer
  class UpdateCitizenJob < ApplicationJob
    def perform(citizen)
      CitizenMailer.with(citizen: citizen).update_citizen_email.deliver_now
    end
  end
end
