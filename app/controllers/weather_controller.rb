class WeatherController < ApplicationController

	include MyModule

	def index
		lat = 39.0000
		lon = -77.0000
		date = ""
		@weatherData = Weather.new(lat, lon, date).testData
  end


	def show

	end
end
