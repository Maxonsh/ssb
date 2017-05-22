class ContactMailer < ApplicationMailer
  def send_contact(contact, sender)
    @contact = contact
    @sender = sender

    mail :to => contact.email,
         :subject => 'Someone interested in your offer'
  end
end
