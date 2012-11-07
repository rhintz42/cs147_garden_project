class Weather < ActiveRecord::Base
  # attr_accessible :title, :body
attr_reader :testData

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
		
		@testData = response.to_hash

  end
end
