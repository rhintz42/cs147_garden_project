class User < ActiveRecord::Base
  has_many :personal_plants
  has_many :user_comments, :dependent => :destroy
  has_many :user_messages, :dependent => :destroy
  accepts_nested_attributes_for :user_comments, :user_messages

  attr_accessible :email,
                  :email_confirmation,
                  :name_first,
                  :name_last,
                  :name_middle,
                  :password,
                  :password_confirmation,
                  :password_digest,
                  :points,
                  :username,

  def full_name
    return self[:name_first] + " " + self[:name_last]
  end

#--------------------------------------------------------------
#--------------------------------------------------------------
  def password
    @password
  end
  
  def password=(pass)
    
    @password = pass

    self[:salt] = rand(100)
    pass = pass.to_s + self[:salt].to_s
    self[:password_digest] = Digest::SHA1.hexdigest pass
  end
#--------------------------------------------------------------
#--------------------------------------------------------------
  def password_confirmation
    @password_confirmation
  end

  def password_confirmation=(pass)
    @password_confirmation = pass
  end
#--------------------------------------------------------------
#--------------------------------------------------------------
  def email
    return self[:email]
  end

  def email=(e)
    self[:email] = e
  end
#--------------------------------------------------------------
#--------------------------------------------------------------
  def email_confirmation
    @email_confirmation
  end

  def email_confirmation=(e)
    @email_confirmation = e
  end
#--------------------------------------------------------------
#--------------------------------------------------------------
  def password_valid?(pass)
    pass = pass.to_s + self[:salt].to_s
    pass = Digest::SHA1.hexdigest pass
    if pass.to_s == self[:password_digest].to_s then
      return true
    end

    return false
  end
#--------------------------------------------------------------
#--------------------------------------------------------------  
  validates :username, :presence => true
  
  validates :password, :presence => true, :confirmation => true
  validates :password_confirmation, :presence => true
  
  validates :email, :presence => true, :confirmation => true
  validates :email_confirmation, :presence => true
end
