class Garden < ActiveRecord::Base
  belongs_to :user
  has_many :personal_plants
  
  attr_accessible :name,
                  :city,
                  :state,
                  :latitude,
                  :longitude,
                  :picture_path,
                  :theme,
                  :user_id

  accepts_nested_attributes_for :personal_plants

	def location
		return self[:city] + ", " + self[:state]
	end

end
