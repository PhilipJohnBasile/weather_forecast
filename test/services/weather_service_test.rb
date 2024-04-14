require 'test_helper'

class WeatherServiceTest < ActiveSupport::TestCase
  test 'fetch_forecast returns weather data' do
    VCR.use_cassette('weather_service_fetch_forecast') do
      latitude = 40.7128
      longitude = -74.0060
      forecast = WeatherService.fetch_forecast(latitude, longitude)
      assert_not_nil forecast['data']['timelines'][0]['intervals'][0]['values']['temperature']
      assert_not_nil forecast['data']['timelines'][1]['intervals'][0]['values']['temperatureMax']
      assert_not_nil forecast['data']['timelines'][1]['intervals'][0]['values']['temperatureMin']
    end
  end
end