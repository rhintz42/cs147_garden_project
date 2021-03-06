class Plant < ActiveRecord::Base
 
  attr_accessible :authorized,
                  :created_from_garden_id,
                  :description,
                  :hardiness_zone_min,
                  :hardiness_zone_max,
                  :is_houseplant,
                  :leeway_sun_exposure,
                  :leeway_watering_weekly_amount,
                  :name_botanical,
                  :name_common,
                  :personal_plants_attributes,
                  :plant_type,
                  :rating_ease_care,
                  :rating_ease_pruning,
                  :rating_ease_watering,
                  :rating_num,
                  :sun_exposure,
                  :user_created_by,
                  :watering_frequency_old,
                  :watering_frequency_new,
                  :watering_weekly_amount
                  

  def created_from_garden_id
    @created_from_garden_id
  end

  def created_from_garden_id=(id)
    @created_from_garden_id=id
  end
  
  has_many :personal_plants, :dependent => :destroy
  has_many :plant_comments, :dependent => :destroy
  accepts_nested_attributes_for :personal_plants, :plant_comments

end
