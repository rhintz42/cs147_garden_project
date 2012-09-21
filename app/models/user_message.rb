class UserMessage < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body,
  								:message_type,
  								:sender_id,
  								:sender_username,
  								:subject
end
