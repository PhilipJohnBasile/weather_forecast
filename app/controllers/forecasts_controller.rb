class ForecastsController < ApplicationController
  def index
    if params[:address].present?
      @address = params[:address]
      result = Geocoder.search(@address).first

      if result.present?
        coordinates = result.coordinates
        cache_key = "forecast_#{@address}"
        Rails.logger.debug "Cache key: #{cache_key}"
        @forecast = Rails.cache.fetch(cache_key, expires_in: 30.minutes) do
          Rails.logger.debug "Cache miss for #{cache_key}"
          WeatherService.fetch_forecast(coordinates[0], coordinates[1])
        end
        @cached = Rails.cache.exist?(cache_key)

        if @forecast.present? && @forecast['data'].present?
          weather_code = @forecast['data']['timelines'][0]['intervals'][0]['values']['weatherCode']
          @weather_icon_class = weather_icon_class(weather_code)
        else
          flash.now[:error] = "Failed to fetch forecast data."
        end
      else
        flash.now[:error] = "Could not find coordinates for the given address."
      end
    end
  end

  private

  def weather_icon_class(weather_code)
    case weather_code
    when 1000 then 'wi-day-sunny'
    when 1001 then 'wi-day-cloudy'
    when 1100 then 'wi-day-cloudy-high'
    when 1101 then 'wi-day-cloudy-high'
    when 1102 then 'wi-day-cloudy-high'
    # Add more mappings for other weather codes
    else 'wi-day-sunny' # Default icon class
    end
  end
end