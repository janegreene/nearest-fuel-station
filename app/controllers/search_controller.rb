class SearchController < ApplicationController
  def index
    conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.params['api_key'] = ENV['nrel_api_key']
      faraday.params['location'] = params[:location]
      faraday.params['fuel_type'] = 'ELEC'
    end

    response = conn.get('/api/alt-fuel-stations/v1/nearest.json')
      # conn.params['latitude'] = '39.744319'
      # conn.params['longitude'] = '-104.987926'

    # end
    json = JSON.parse(response.body, symbolize_names: true)
    address = json[:fuel_stations][0][:street_address] + " " + json[:fuel_stations][0][:city]
#     name = json[:fuel_stations][0][:station_name]
#     address = json[:fuel_stations][0][:street_address]
#     city = json[:fuel_stations][0][:city]
 #    fuel_type = json[:fuel_stations][0][:fuel_type_code]
#     access_times = json[:fuel_stations][0][:access_days_time]
# https://www.mapquestapi.com/directions/v2/route?key=KEY&from='1331+17th+St+LL100%2C+Denver%2C+CO%2C+80202'&to=%221225+17th+St.%2C+Denver%22&outFormat=json&ambiguities=ignore&routeType=shortest&doReverseGeocode=false&enhancedNarrative=false&avoidTimedConditions=false
  #skipping the conn.get to merge these steps for this api
    response = Faraday.get('https://www.mapquestapi.com/directions/v2/route') do |faraday|
        faraday.params['key'] = ENV['mapquest_api_key']
        faraday.params['from'] = params[:location]
        faraday.params['to'] = address
        faraday.params['outFormat'] = 'json'
        faraday.params['routeType'] = 'shortest'
    end
    json2 = JSON.parse(response.body, symbolize_names: true)
  # json2[:route][:distance]
  # json2[:route][:formattedTime]
  # json2[:route][:legs][0][:maneuvers][0][:narrative]
  # json2[:route][:legs][0][:maneuvers][1][:narrative]
  end
end
# GET https://developer.nrel.gov/api/alt-fuel-stations/v1.json?limit=1&api_key=YOUR_KEY_HERE
