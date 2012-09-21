class CalendarController < ApplicationController
  def index
  	@personal_plants = PersonalPlant.all
  	#debugger
  	#@personal_plants_by_date = @personal_plants.group_by(&:watering_next)

  	@personal_plants_by_date = {}

  	@personal_plants.each do |personal_plant|
  		#debugger
  		waterings_for_date = PersonalPlantWatering.where("personal_plant_id = '" \
  								+ personal_plant[:id].to_s + "'")
  		
  		waterings_for_date.each do |watering|
  			date = Time.at(watering[:watering_time]).to_date

  			if @personal_plants_by_date[date] then
  				@personal_plants_by_date[date] << personal_plant
  			else
  				@personal_plants_by_date[date] = [personal_plant]
  			end
  		end
  	end
  end
end
