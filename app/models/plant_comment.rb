class PlantComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :plant
  attr_accessible :body,
  				  :commenter,
  				  :rating,
  				  :user,
  				  :plant,
  				  :user_id,
  				  :plant_id
end
