class RegistrationMailer < ApplicationMailer
  def registration_email(user, password)
    @password = password

    mail :to => user.email,
         :subject => 'Welcome!'
  end
end
