class Photo < ActiveRecord::Base
  belongs_to :listing
  has_attached_file :file, :styles => {:display => '560>', :thumb => '160>'}
end
