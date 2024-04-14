class WeatherService
  include HTTParty
  base_uri 'https://api.tomorrow.io/v4'

  def self.fetch_forecast(latitude, longitude)
    response = get('/timelines', query: {
      location: "#{latitude},#{longitude}",
      fields: 'temperature,temperatureMax,temperatureMin',
      timesteps: '1h,1d',
      units: 'metric',
      apikey: TOMORROW_IO_API_KEY
    })
    response.parsed_response
  end
end