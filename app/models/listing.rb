class Listing < ActiveRecord::Base
  # associations
  belongs_to :user, :counter_cache => true
  belongs_to :category
  has_many :offers, :dependent => :destroy
  has_many :questions, :dependent => :destroy
  has_many :reports
  has_many :photos, :dependent => :destroy
  has_many :favorites
  has_one :city, :foreign_key => :zip_code, :primary_key => :zip_code
  
  # validations
  validates_presence_of :title, :description, :price, :category, :condition, :zip_code
  
  accepts_nested_attributes_for :photos

  define_index do
    indexes title, :sortable => true
    indexes description
    has category_id, condition, photos_count
    has city.lat, :as => 'lat'
    has city.lon, :as => 'lon'
    has created_at, :as => 'date'
    has price
    has user.rating, :as => 'rating'
  end
end