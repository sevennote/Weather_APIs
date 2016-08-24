class DarkSkyController < ApplicationController


	Faraday.default_adapter = :typhoeus

	ForecastIO.api_key = '1c1ba75b116a958b1851d2c392d7aa4a'

	def index

		current = @forecast['currently']

		wind_bearing = current['windBearing']

		@forecast = ForecastIO.forecast(37.8267, -122.423)

		@relative_humidity = current['humidity']

		@pressure = current['pressure']

   		@temperature = current['temperature']

        @evaporation = ( ( 6.28 * 10 ** 3 ) - ( @relative_humidity * ( @pressure / 10 ) * @temperature ) )/1000

        byebug

	end 

end
