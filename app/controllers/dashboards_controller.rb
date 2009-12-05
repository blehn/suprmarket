class DashboardsController < ApplicationController

  before_filter :authenticate

  def show
    current_filter = params[:filter] || 'buying'
    if current_filter == 'selling'
      @listings = current_user.listings.all(:include => {:offers => [:user], :questions => [:user]})
    elsif current_filter == 'buying'
      @offers = current_user.offers.all(:include => :listing)
      @listings = @offers.map(&:listing)
    end
  end

end
