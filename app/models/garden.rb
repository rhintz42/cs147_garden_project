class Garden < ActiveRecord::Base
  belongs_to :user
  has_many :personal_plants
  has_many :garden_waterings, :dependent => :destroy
  
  attr_accessible :name,
                  :city,
                  :state,
                  :is_outside,
                  :latitude,
                  :longitude,
                  :picture_path,
                  :theme,
                  :user_id,
                  :garden_waterings_attributes
  
  accepts_nested_attributes_for :personal_plants, :garden_waterings

	def location
		return self[:city] + ", " + self[:state]
	end

end
