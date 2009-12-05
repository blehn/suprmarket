class User < ActiveRecord::Base
  include Clearance::User
  validates_uniqueness_of :username
  attr_accessible :username, :zip_code
  has_many :listings, :dependent => :destroy
  has_many :offers

  def rating
    100
  end
end
