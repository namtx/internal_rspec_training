class HttpServices::BcService
  def initialize host
    @host = host
  end

  def perform!
    response = connection.get "/v1/bpi/currentprice.json"
    json_response = JSON.parse response.body
  end

  private
  def connection
    @connetion ||= Faraday.new(@host) do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end
  end
end
