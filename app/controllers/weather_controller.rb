class WeatherController < ApplicationController

	include MyModule

	def index
		garden = Garden.find(params[:garden])
		loc = garden.location
		@weather = Weather.new(loc)
	end


	def show

	end
end
