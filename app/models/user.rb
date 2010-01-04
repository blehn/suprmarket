class User < ActiveRecord::Base
  include Clearance::User
  validates_uniqueness_of :username
  attr_accessor :invitation_code
  attr_accessible :username, :zip_code, :invitation_code, :rating
  has_many :listings, :dependent => :destroy
  has_many :offers
  has_many :ratings

  # Hack clearance
  def password=(password)
    write_attribute(:password, password)
    write_attribute(:password_confirmation, password)
  end
  
  def rate(user, positive_or_negative)
    user.ratings.create({:rater_id => self.id, :value => positive_or_negative})
  end
end
