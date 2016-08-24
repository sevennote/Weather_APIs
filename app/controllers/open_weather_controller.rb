class OpenWeatherController < ApplicationController


Open_weather_api_key = "395842e2648e8191dff574a44dd7c8ee"


	def index

		url = 'http://api.openweathermap.org/data/2.5/forecast/weather?lat=0&lon=0&APPID=395842e2648e8191dff574a44dd7c8ee'

		buffer = open(url).read

		response = JSON.parse(buffer)

		info = response["list"]

		info.each do |item|


		end

		byebug

		# response.keys = ["city","cod","message","cnt","list"] List shows information
		# response["list"] This will show an array.
	end

end
