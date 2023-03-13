module Mailer
  class CreateCitizenJob < ApplicationJob
    queue_as :mailers

    def perform(citizen)
      CitizenMailer.with(citizen: citizen).create_citizen_email.deliver_now
    end
  end
end
