# class for get info about australian business number
class AbnInfoService
  def call(abn)
    soap_client = Savon.client(:wsdl => Rails.application.secrets[:abn]['wsdl'],
                               :open_timeout => 5,
                               :read_timeout => 5)
    options = { :searchString => abn.to_s,
                :includeHistoricalDetails => 'n',
                :authenticationGuid => Rails.application.secrets[:abn]['guid'] }

    soap_client.call(:abr_search_by_abn, :message => options).body
  rescue => e
    e.to_s
  end
end
