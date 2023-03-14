module Citizens
  class Update < ApplicationService
    def initialize(citizen, params)
      @citizen = citizen
      @params = params
      @errors = []
    end

    def call
      if @citizen.update(@params)
        send_sms
        send_email
        Rails.logger.info "Citizen ##{@citizen.id} updated"
        Result.new(true, @citizen)
      else
        @errors << @citizen.errors.full_messages
        Result.new(false, nil, @errors.join(','))
      end
    end

    def send_sms
      Sms::UpdateCitizenJob.perform_now(@citizen)
    rescue StandardError
      Rails.logger.error 'Sms not sent'
    end

    def send_email
      Mailer::UpdateCitizenJob.perform_now(@citizen)
    rescue StandardError
      Rails.logger.error 'Email not sent'
    end
  end
end
