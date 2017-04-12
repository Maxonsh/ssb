# sending password on email
class SendPasswordJob < ApplicationJob
  queue_as :default

  def perform(user, password)
    RegistrationMailer.registration_email(user, password).deliver_now
  end
end
