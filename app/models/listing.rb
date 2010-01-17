class Listing < ActiveRecord::Base
  # associations
  belongs_to :user, :counter_cache => true
  belongs_to :category
  has_many :offers, :dependent => :destroy, :order => 'created_at desc'
  has_many :questions, :dependent => :destroy
  has_many :reports
  has_many :photos, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
  has_one :city, :foreign_key => :zip_code, :primary_key => :zip_code
  has_many :accepted_notifications
  has_many :declined_notifications
  has_many :counter_notifications
  
  # validations
  validates_presence_of :title, :description, :price, :category, :condition, :zip_code
  
  accepts_nested_attributes_for :photos

  def new?
    condition == 'new'
  end

  def sold!
    update_attribute(:sold, true)
  end

  
  def self.find_for_search(order_by, sort_mode, city, params, favorites)
    
    options = { :include => [:user, :city], :with => {}, :conditions => {}, :star => true }
    
    unless params[:include_completed]
      options[:with][:sold] = false
    end
    
    if params[:has_image]
      options[:with][:has_photos] = true
    end
    
    if params[:min] || params[:max]
      min = params[:min].present? ? params[:min].to_f : 0.0
      max = params[:max].present? ? params[:max].to_f : 999999999.0
      options[:with][:price] = min..max
    end
    
    unless order_by == :favorites
      options[:order] = (order_by == :distance ? "@geodist #{sort_mode}" : order_by)
      options[:sort_mode] = (order_by == :distance ? nil : sort_mode)
    else
      # id_matches = favorites.map do |favorite| 
      #         l = Listing.new
      #         l.id = favorite.listing_id
      #         l.sphinx_document_id
      #       end
      #       options[:order] = "IN(@id, #{id_matches.join(',')}) #{sort_mode}"
    end
    
    if city
      radius = params[:radius] ? 
        (params[:radius] == 'Anywhere' ? 2000 : params[:radius].match(/(\d+)/)[1]) : 
        5
      options[:geo] = [city.lat * 0.0174532925, city.lon * 0.0174532925]
      options[:with]['@geodist'] = (0.0..(radius.to_f * 1609.344))
    end
    
    if params[:only_new]
      options[:with][:is_new] = true
    end
    
    if params[:title_only]
      Listing.search(options.merge(:conditions => {:title => params[:q]}))
    else
      Listing.search(params[:q], options)
    end
  end

  define_index do
    indexes title, :sortable => true
    indexes description
    has category_id, condition, photos_count
    has city(:zip_code), :as => :zip_code
    has "`condition` = 'new'", :as => :is_new, :type => :boolean
    has "`photos_count` > 0", :as => :has_photos, :type => :boolean
    has "RADIANS(cities.lat)", :as => :latitude, :type => :float
    has "RADIANS(cities.lon)", :as => :longitude, :type => :float
    has created_at, :as => 'date'
    has price, :type => :float
    has user.rating, :as => 'rating'
    has sold
  end
end
