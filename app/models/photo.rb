class Photo < ActiveRecord::Base
  belongs_to :listing, :counter_cache => true
  has_attached_file :file, :styles => {:display => '560>', :thumb => '160x100>#', :large => '320x200># => '}
end
