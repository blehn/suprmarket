class BuyingController < ApplicationController
  before_filter :authenticate
  
  def show
    notifications = current_user.buyer_notifications.all(:include => :seller)
    listing_ids = notifications.map(&:listing)
    @listings = Listing.all(:conditions => {:id => listing_ids})
    @notifications = notifications.group_by(&:listing_id)
    
  end
end