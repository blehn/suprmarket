class User < ActiveRecord::Base
  include Clearance::User
  validates_uniqueness_of :username
  attr_accessible :username, :zip_code
end
