# sending contacts to offer owner email
class SendContactMessageJob < ApplicationJob
  queue_as :default

  def perform(contact, sender)
    ContactMailer.send_contact(contact, sender).deliver_now
  end
end
