class DashboardsController < ApplicationController

  before_filter :authenticate

  def show
    unless params[:filter]
      params[:filter] = 'selling' if current_user.listings.count > 0
    end
    @current_filter = params[:filter] || 'buying'
    if @current_filter == 'selling'
      @listings = current_user.listings.all(:include => {:offers => [:user], :questions => [:user, :reply]}, :order => 'listings.created_at desc').presenter
    elsif @current_filter == 'buying'
      @offers = current_user.offers.all(:include => {:listing => {:questions => :reply}}, :order => 'listings.created_at desc')
      @listings = @offers.map(&:listing).uniq
      @listing_offers = @offers.group_by(&:listing_id)
      @notifications = current_user.notifications.all.group_by(&:listing_id)
    end
  end

end
