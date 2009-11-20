class Listing < ActiveRecord::Base
  # associations
  belongs_to :user
  belongs_to :category
  has_many :offers
  has_many :questions
  has_many :reports
  # validations
  validates_presence_of :title, :description, :price, :category, :condition, :zip_code
end
