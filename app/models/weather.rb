class Weather < ActiveRecord::Base
  # attr_accessible :title, :body
attr_reader :testData

require 'net/http'

def initialize(loc)
	coords = Geocoder.coordinates(loc)
	lat = coords[0]
	lon = coords[1]	
	url = "http://free.worldweatheronline.com/feed/weather.ashx?"
	query = "q=" + lat.to_s + "," + lon.to_s
	url += query
	url += "&format=json&num_of_days=2&key=9ae687bfc7235922120311";
	res = Net::HTTP.get(URI.parse(url))	
	@testData = res
end
=begin
require 'rexml/document'
include REXML
require 'cgi'

  def initialize(lat, lon, date)
		format = "24 hourly"
		numDays = "" 
		unit = "e"
    client = Savon.client("http://graphical.weather.gov/xml/DWMLgen/wsdl/ndfdXML.wsdl#NDFDgenByDay")
    response = client.request :ndf_dgen_by_day do 
			soap.body do |xml|
				xml.latitude(lat, "xsi:type" => "xsd:decimal")
				xml.longitude(lon, "xsi:type" => "xsd:decimal")
				xml.startDate(date, "xsi:type" => "xsd:date")
				xml.numDays(numDays, "xsi:type" => "xsd:integer")
				xml.Unit(unit, "xsi:type" => "dwml:unitType", "xmlns:dwml" => "http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd")
				xml.format(format, "xsi:type" => "dwml:formatType", "xmlns:dwml" => "http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd")
			end
    end

	  data = response.to_xml	
		data = CGI.unescapeHTML(data)
		test = Document.new(data)


		@testData = test
		#@testData = Hash.from_xml(response)

  end
=end


end
