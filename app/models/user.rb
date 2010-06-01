class User < ActiveRecord::Base
  include Clearance::User
  validates_uniqueness_of :username
  attr_accessor :invitation_code
  attr_accessible :username, :email, :password, :password_confirmation, :zip_code, :invitation_code, :rating
  attr_accessible :address_1, :address_2, :city, :state, :lat, :lng
  has_many :listings, :dependent => :destroy
  has_many :offers, :dependent => :destroy
  has_many :ratings
  has_many :favorites, :dependent => :destroy
  has_many :replies
  has_many :seller_notifications, :foreign_key => 'seller_id', :class_name => "Notification"
  has_many :buyer_notifications, :foreign_key => 'buyer_id', :class_name => "Notification"
  validate_on_create :check_invitation_code
  after_create :use_invitation_code
  
  def check_invitation_code
    unless Invite.exists?(:code => self.invitation_code, :used => false)
      if Invite.exists?(:code => self.invitation_code)
        errors.add_to_base('Invitation code has already been used.')
      else
        errors.add_to_base('Invitation code is invalid.')
      end
    end
  end

  def use_invitation_code
    Invite.update_all("used = true, user_id = #{self.id}", "code = '#{self.invitation_code}'", :limit => 1)
  end


  def feedback
    []
  end
  
  def use_invite(email)
    # do stuff
  end
  
  def before_create
    send("password_confirmation=", password) if password
  end
  
  def rate(user, positive_or_negative)
    user.ratings.create({:rater_id => self.id, :value => positive_or_negative})
  end
  
  def rating
    ratings_count > 0 ? read_attribute(:rating) : '0'
  end
  
  # Update lat and lng if address changed
  def before_save
    if (changes.keys & ["city", "zip_code", "address_1", "address_2", "state"]).length > 0
      res = Geokit::Geocoders::MultiGeocoder.geocode("#{address_1} #{address_2}, #{city}, #{state}, #{zip_code}")      
      self.lat = res.lat
      self.lng = res.lng
    end
  end
end
