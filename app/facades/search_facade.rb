class SearchFacade
  def self.nearest_station(params)
    nrel = NrelService.new(params)
    json = nrel.nrel_station
    address = json[:fuel_stations][0][:street_address] + " " + json[:fuel_stations][0][:city]
    json2 = MapquestService.directions(params, address)
    Station.new(json, json2)
  end
end
