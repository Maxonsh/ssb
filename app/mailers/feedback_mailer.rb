class FeedbackMailer < ApplicationMailer
  def feedback_email(feedback)
    @feedback = feedback

    mail :to => ['maxim@cifronomika.ru',
                 'peter@growinginnovations.com.au',
                 'ab@cifronomika.ru',
                 'alexey@cifronomika.ru'],
         :subject => 'New Contact Email'
  end
end
