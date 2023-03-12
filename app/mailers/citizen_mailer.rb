class CitizenMailer < ApplicationMailer
  default from: 'contato@om30.com'

  def welcome_email
    @citizen = params[:citizen]
    mail(to: @citizen.email, subject: t('citizen_created_successfully'))
  end
end
