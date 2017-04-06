# sending feetback email
class SendFeedbackJob < ApplicationJob
  queue_as :default

  def perform(feedback)
    FeedbackMailer.feedback_email(feedback).deliver_now
  end
end
