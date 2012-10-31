class Garden < ActiveRecord::Base
  belongs_to :user
  has_many :personal_plants
  
  attr_accessible :name,
                  :city,
                  :state,
                  :theme

end
