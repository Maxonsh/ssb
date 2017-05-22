class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      SendFeedbackJob.perform_later(@feedback)

      redirect_to contacts_url, :notice => 'Feedback message was successfully sended.'
    else
      flash.now[:error] = 'Feedback message not sended.'
      render 'pages/contacts'
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :phone_number, :message)
  end
end
