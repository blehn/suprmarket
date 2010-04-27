class Category < ActiveRecord::Base
  has_many :listings, :dependent => :destroy
  acts_as_url :title, :sync_url => true
  
  
  def to_param
    url
  end
end
