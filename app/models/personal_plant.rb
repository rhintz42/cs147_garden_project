class PersonalPlant < ActiveRecord::Base
  belongs_to :user
  belongs_to :plant
  has_many :personal_plant_comments
  has_many :persaonl_plant_waterings

  attr_accessible :hardiness_zone,
                  :name_personalized,
                  :plant_id,
                  :rating_ease_care,
                  :rating_ease_pruning,
                  :rating_ease_watering,
                  :rating_num,
                  :sun_exposure,
                  :user_id,
                  :watering_frequency,
                  :watering_last,
                  :watering_next,
                  :personal_plant_waterings_attributes

  has_many :personal_plant_comments, :dependent => :destroy
  has_many :personal_plant_waterings, :dependent => :destroy
  accepts_nested_attributes_for :personal_plant_comments, :personal_plant_waterings
end
