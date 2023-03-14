module Citizens
  class Create < ApplicationService
    def initialize(params)
      @params = params
      @errors = []
    end

    def call
      @citizen = Citizen.new(@params)
      if @citizen.save
        send_sms
        send_email
        Rails.logger.info "Citizen ##{@citizen.id} created"
        Result.new(true, @citizen)
      else
        @errors << @citizen.errors.full_messages
        Result.new(false, nil, @errors.join(','))
      end
    end

    def send_sms
      Sms::CreateCitizenJob.perform_now(@citizen) unless Rails.env.test?
    rescue StandardError
      Rails.logger.error 'Sms not sent'
    end

    def send_email
      Mailer::CreateCitizenJob.perform_now(@citizen)
    rescue StandardError
      Rails.logger.error 'Email not sent'
    end
  end
end
