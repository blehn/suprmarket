class Listing < ActiveRecord::Base
  # associations
  belongs_to :user
  belongs_to :category

  # validations
  validates_presence_of :title, :description, :price, :category, :condition, :zip_code
end
