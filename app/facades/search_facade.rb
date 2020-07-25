class SearchFacade
  def self.nearest_station(params)
    # conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
    #   faraday.params['api_key'] = ENV['nrel_api_key']
    #   faraday.params['location'] = params[:location]
    #   faraday.params['fuel_type'] = 'ELEC'
    # end
    # response = conn.get('/api/alt-fuel-stations/v1/nearest.json')
    # json = JSON.parse(response.body, symbolize_names: true)
    # address = json[:fuel_stations][0][:street_address] + " " + json[:fuel_stations][0][:city]
    json = NrelService.nrel_station(params)
    address = json[:fuel_stations][0][:street_address] + " " + json[:fuel_stations][0][:city]
    # response = Faraday.get('https://www.mapquestapi.com/directions/v2/route') do |faraday|
    #     faraday.params['key'] = ENV['mapquest_api_key']
    #     faraday.params['from'] = params[:location]
    #     faraday.params['to'] = address
    #     faraday.params['outFormat'] = 'json'
    #     faraday.params['routeType'] = 'shortest'
    # end
    json2 = MapquestService.directions(params, address)
    Station.new(json, json2)
  end
end
