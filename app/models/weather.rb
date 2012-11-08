class Weather < ActiveRecord::Base
	attr_reader :location, :imgURL, :windSpeed, :temp, :description, :precipMM

require 'net/http'

	def initialize(loc)
		url = buildURL(loc)
		res = Net::HTTP.get(URI.parse(url))	
		
		#currently only interested in current weather, tomorrow's forecast also available
		data = JSON.parse(res)["data"]["current_condition"][0]

		@location = loc
		@imgURL = data["weatherIconUrl"][0]["value"] 	
		@windSpeed = data["windspeedMiles"]
		@temp = data["temp_F"]
		@description = data["weatherDesc"][0]["value"]
		@precipMM = data["precipMM"]

	end
	
	def buildURL(loc)
		coords = Geocoder.coordinates(loc)
		lat = coords[0]
		lon = coords[1]	
		url = "http://free.worldweatheronline.com/feed/weather.ashx?"
		query = "q=" + lat.to_s + "," + lon.to_s
		url += query
		url += "&format=json&num_of_days=2&key=9ae687bfc7235922120311";
		return url
	end

end
