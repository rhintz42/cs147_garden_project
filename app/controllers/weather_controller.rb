class WeatherController < ApplicationController

	include MyModule

	def index
		garden = Garden.find(params[:garden])
		
		@back_url = "/gardens/"+params[:garden]
    @back_label = "Garden"

		loc = garden.location
		@weather = Weather.new(loc)
	end


	def show

	end
end
