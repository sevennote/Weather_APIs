class WelcomeController < ApplicationController



	def index

  
		url = 'http://api.aerisapi.com/observations/seattle,wa?client_id=whQGXL4jjGa2R7sApM6c2&client_secret=zLBJ4hSSKdhrIlNX0SvUabouUA1strIFgC8Z2dDS'
		buffer = open(url).read

		response = JSON.parse(buffer)

		info = response['response']['ob']

		@data = Hash.new

		wind_speed = info["windSpeedMPH"].to_s + " mph"

		@data["Humidity"] = info["humidity"].to_s + "%" 
		# This is for relative humidity. Relative Humidity percentage value for the actual amount of water vapor in the air divided by the maximum amount of water vapor the air can hold. 
		@data["Temperature"]= info["tempF"].to_s + "°F"
		@data["Pollen"] = "N/A"
		@data["Pollution Index"] = "N/A"
        @data["Wind"] = cardinal_wind_direction(info["windDirDEG"].to_f) + " " + wind_speed

     


		#@data["Pressure(MB)"] = info["pressureMB"]

	end



	# reference http://climate.umn.edu/snow_fence/components/winddirectionanddegreeswithouttable3.htm

   private

    def cardinal_wind_direction(deg)

		val = (deg / 22.5 + 0.5)

		cardinal_directions = ["N","NNE","NE","ENE","E","ESE", "SE", "SSE","S","SSW","SW","WSW","W","WNW","NW","NNW"]

		return cardinal_directions[(val % 16)]

		#outputs a string
		
	end



end



