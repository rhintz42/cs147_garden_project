class UserComment < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body,
  								:commenter_id,
  								:commenter_username,
  								:rating
end
