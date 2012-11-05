class WeatherController < ApplicationController

	def index
		
 		@gardens = Garden.where(:user_id => session[:user][:id])
		@garden = @gardens[0]
		@formattedLocation = @garden[:city] + " " + @garden[:state]

		@queryURL = getQuery(@formattedLocation.gsub(/\s/, "+"))
	end

	def getQuery(location)
		@query = "http://free.worldweatheronline.com/feed/weather.ashx?q=" + location + "&format=json&num_of_days=5&key=9ae687bfc7235922120311&callback=renderWeather"
		return @query
	end

	def show

	end
end
