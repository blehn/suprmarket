class Notification < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user
  serialize :data
end
