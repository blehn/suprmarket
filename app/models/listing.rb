class Listing < ActiveRecord::Base
  # associations
  belongs_to :user
  belongs_to :category
  has_many :offers, :dependent => :destroy
  has_many :questions, :dependent => :destroy
  has_many :reports
  has_many :photos, :dependent => :destroy
  # validations
  validates_presence_of :title, :description, :price, :category, :condition, :zip_code

  accepts_nested_attributes_for :photos
end
