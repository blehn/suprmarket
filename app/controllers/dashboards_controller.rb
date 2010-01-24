class DashboardsController < ApplicationController

  before_filter :authenticate

  def show
    redirect_to(current_user.listings.count > 0 ? dashboard_selling_path : dashboard_buying_path)    
  end

end
