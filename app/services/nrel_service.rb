class NrelService

  def initialize(params)
    @params = params
  end
  def nrel_station
    response = conn.get('/api/alt-fuel-stations/v1/nearest.json')
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.params['api_key'] = ENV['nrel_api_key']
      faraday.params['location'] = @params[:location]
      faraday.params['fuel_type'] = 'ELEC'
    end
  end
end
