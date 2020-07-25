class Station
  attr_reader :name, :address, :fuel_type, :access_times, :time, :distance, :narrative, :narrative1
  def initialize(station, directions)
    @name = station[:fuel_stations][0][:station_name]
    @address = station[:fuel_stations][0][:street_address]+ " " + station[:fuel_stations][0][:city]
    @fuel_type = station[:fuel_stations][0][:fuel_type_code]
    @access_times = station[:fuel_stations][0][:access_days_time]

    @distance = directions[:route][:distance]
    @time = directions[:route][:formattedTime]
    @narrative = directions[:route][:legs][0][:maneuvers][0][:narrative]
    @narrative1 = directions[:route][:legs][0][:maneuvers][1][:narrative]
  end
end
