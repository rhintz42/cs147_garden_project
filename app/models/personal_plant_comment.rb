class PersonalPlantComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :personal_plant
  attr_accessible :body,
                  :commenter,
                  :days_had_plant,
                  :num_thumbs_down,
                  :num_thumbs_up,
                  :rating_ease_care,
                  :rating_ease_pruning,
                  :rating_ease_watering

end
