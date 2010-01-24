class SellingController < ApplicationController
  before_filter :authenticate
  
  def show
    @listings = current_user.listings.paginate(
      :page => params[:page], 
      :include => {:questions => [:user, :reply]}, 
      :order => 'listings.created_at desc'
    ).presenter
    
    
    @notifications = current_user.seller_notifications.all(
      :conditions => {
        :listing_id => @listings.map(&:id),
      }, 
      :include => [:buyer, :offer],
      :order => 'created_at desc'
    ).group_by(&:listing_id)
    
  end
end