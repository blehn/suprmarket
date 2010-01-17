class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing, :counter_cache => true
  has_one :reply, :as => :source, :dependent => :destroy
end
