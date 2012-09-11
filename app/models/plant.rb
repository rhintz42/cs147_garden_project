class Plant < ActiveRecord::Base
  has_many :personal_plants

  attr_accessible :actual_sun_exposure,
                  :description,
                  :is_houseplant,
                  :last_watering, 
                  :name_botanical,
                  :name_common,
                  :name_personalized,
                  :next_watering,
                  :plant_type,
                  :recommended_sun_exposure,
                  :water_frequency,
                  :water_weekly,
                  :created_from_user
  
  def validate_last_watering
    watering = self
    return true
  end

  validate :validate_last_watering

end
