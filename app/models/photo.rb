class Photo < ActiveRecord::Base
  belongs_to :listing
  has_attached_file :file, :styles => {:display => '400>'}
end
