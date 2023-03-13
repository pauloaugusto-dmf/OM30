class SendSms
  attr_reader :message, :number

  def initialize(message, number)
    @message = message
    @number = Rails.env.development? ? ENV.fetch('MY_PHONE_NUMBER', nil) : number
  end

  def call
    account_sid = ENV.fetch('TWILIO_ACCOUNT_SID', nil)
    auth_token = ENV.fetch('TWILIO_AUTH_TOKEN', nil)
    twilio_phone_number = ENV.fetch('TWILIO_PHONE_NUMBER', nil)
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(
      body: @message,
      from: twilio_phone_number,
      to: '+5521978986987'
    )
  end
end
