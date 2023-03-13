class CitizenMailer < ApplicationMailer
  default from: 'contato@om30.com'

  def create_citizen_email
    @citizen = params[:citizen]
    mail(to: @citizen.email, subject: t('citizen_created'))
  end

  def update_citizen_email
    @citizen = params[:citizen]
    mail(to: @citizen.email, subject: t('citizen_update'))
  end
end
