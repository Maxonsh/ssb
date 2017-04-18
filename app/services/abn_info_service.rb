# class for get info about australian business number
class AbnInfoService
  def call(abn) # rubocop:disable MethodLength
<<<<<<< 86fc2694fd6d9d928bce45ac501a8b169e9723cf
    soap_client = Savon.client(:wsdl => Rails.application.secrets[:abn]['wsdl'],
                               :open_timeout => 5,
                               :read_timeout => 5)
    options = { :searchString => abn.to_s,
                :includeHistoricalDetails => 'n',
                :authenticationGuid => Rails.application.secrets[:abn]['guid'] }

    soap_client.call(:abr_search_by_abn, :message => options).body
  rescue => e
    e.to_s
=======
    retries = 3
    begin
      soap_client = Savon.client(:wsdl => Rails.application.secrets[:abn]['wsdl'],
                                 :open_timeout => 300,
                                 :read_timeout => 300)
      options = { :searchString => abn.to_s,
                  :includeHistoricalDetails => 'n',
                  :authenticationGuid => Rails.application.secrets[:abn]['guid'] }
      soap_client.call(:abr_search_by_abn, :message => options).body
    rescue => e
      retries -= 1

      retries.positive? ? retry : e.to_s
    end
>>>>>>> добавил остальные типы объявлений, возможность выбрать период и тип в них
  end
end
