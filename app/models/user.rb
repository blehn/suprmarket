class User < ActiveRecord::Base
  include Clearance::User
  validates_uniqueness_of :username
  attr_accessor :invitation_code
  attr_accessible :username, :zip_code, :invitation_code, :rating
  has_many :listings, :dependent => :destroy
  has_many :offers, :dependent => :destroy
  has_many :ratings
  has_many :favorites, :dependent => :destroy
  has_many :replies
  # Hack clearance
  def before_create
    send("password_confirmation=", password) if password
  end
  
  def rate(user, positive_or_negative)
    user.ratings.create({:rater_id => self.id, :value => positive_or_negative})
  end
  
  def rating
    ratings_count > 0 ? read_attribute(:rating) : '~'
  end
end
