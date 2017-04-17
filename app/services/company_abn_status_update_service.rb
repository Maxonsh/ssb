# class for validating australian business number
class CompanyAbnStatusUpdateService
  def call(company, abn)
    abn_info = AbnInfoService.new.call(abn)

    company.update! :abn_info => abn_info.to_json, :abn_valid => abn_valid?(abn_info)
  end

  private

  def abn_valid?(abn_info)
    return unless abn_info.is_a? Hash

    status = abn_info&.dig(:abr_search_by_abn_response, :abr_payload_search_results, :response,
                           :business_entity, :entity_status, :entity_status_code)
    status == 'Active'
  end
end
