class SearchesController < ApplicationController
  def show
    @results = Listing.paginate(:page => params[:page], :order => "listings.created_at desc", :include => [:user, :city]).presenter
  end
end
