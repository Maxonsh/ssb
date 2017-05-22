class ContactMessagesController < ApplicationController
  def create
    @contact_message = ContactMessage.new(contact_message_params)

    if @contact_message.save!
      SendContactMessageJob.perform_later(@contact_message, current_user)

      flash.now[:notice] = 'Contact message was successfully sended.'
    else
      flash.now[:error] = 'Contact message message not sended.'
    end

    head :ok
  end

  private

  def contact_message_params
    params.require(:contact_message).permit(:approved_financing, :message, :email, :sender_id)
  end
end
