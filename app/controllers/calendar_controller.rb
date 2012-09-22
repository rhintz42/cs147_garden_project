class CalendarController < ApplicationController
  
  include MyModule
  
  def index
    if not check_logged_in then
      return
    end

  	@personal_plants = PersonalPlant.where(:user_id => session[:user][:id]).order("id ASC")
  	@plants = Plant.all
    #debugger
  	#@personal_plants_by_date = @personal_plants.group_by(&:watering_next)
    
    @personal_plants_json = @personal_plants.to_json

    
    @plants_hash = {}
    @plants.each do |plant|
  		#debugger
  		@plants_hash[plant[:id]] = plant
  	end


  	@personal_plants_by_date = {}
  	@personal_plants.each do |personal_plant|
  		#debugger
  		waterings_for_date = PersonalPlantWatering.where(:personal_plant_id => personal_plant[:id])
  		
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
