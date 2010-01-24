class Notification < ActiveRecord::Base
  belongs_to :listing
  belongs_to :buyer, :class_name => "User"
  belongs_to :seller, :class_name => "User"
  belongs_to :offer
  serialize :data
end
