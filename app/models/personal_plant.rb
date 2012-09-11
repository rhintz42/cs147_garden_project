class PersonalPlant < ActiveRecord::Base
  belongs_to :user
  belongs_to :plant

  attr_accessible :last_watering,
                  :name_personalized,
                  :next_watering,
                  :watering_frequency,
                  :plant_id,
                  :user_id
end
