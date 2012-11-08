class WeatherController < ApplicationController

	include MyModule

	def index

#		gardens = Garden.where(:id => params[:garden])
		garden = Garden.find(params[:garden])
		loc = garden.location
		@weatherData = Weather.new(loc).testData
	end

	def show

	end
end
