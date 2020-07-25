class MapquestService
  def self.directions(params, address)
    response = Faraday.get('https://www.mapquestapi.com/directions/v2/route') do |faraday|
        faraday.params['key'] = ENV['mapquest_api_key']
        faraday.params['from'] = params[:location]
        faraday.params['to'] = address
        faraday.params['outFormat'] = 'json'
        faraday.params['routeType'] = 'shortest'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
