class ApplicationMailer < ActionMailer::Base
  default :from => 'noreply@staging.sellitswapitbuyit.com'

  layout 'mailer'
end
