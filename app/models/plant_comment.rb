class PlantComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :plant
  attr_accessible :body,
  								:commenter,
  								:rate_ease_care,
  								:rate_ease_pruning,
  								:rate_ease_watering
end
