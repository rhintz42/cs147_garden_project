class WeatherController < ApplicationController

	include MyModule

	def index
		garden = Garden.find(params[:garden])
		loc = garden.location
		@weatherData = Weather.new(loc).testData
	end

	def show

	end
end
