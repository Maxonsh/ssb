# validating australian business number
class ValidateAbnJob < ApplicationJob
  queue_as :default

  def perform(company, abn)
    CompanyAbnStatusUpdateService.new.call(company, abn)
  end
end
