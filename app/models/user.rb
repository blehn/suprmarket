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
  
  # Hack clearance
  def feedback
    []
  end
  
  def before_create
    send("password_confirmation=", password) if password
  end
  
  def rate(user, positive_or_negative)
    user.ratings.create({:rater_id => self.id, :value => positive_or_negative})
  end
  
  def rating
    ratings_count > 0 ? read_attribute(:rating) : '~'
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
