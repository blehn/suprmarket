class SearchesController < ApplicationController
  def show
    params[:sort].match(/^(.+?)_([^_]+)$/) if params[:sort]
    order = params[:sort] ? $1.to_sym : :date
    sort_mode = params[:sort] ? $2.to_sym : :desc
    
    @results = Listing.search(
      params[:q], 
      :include => [:user, :city], 
      :order => order, 
      :sort_mode => sort_mode
      )
    
      
    @favorites = signed_in? ? current_user.favorites.all(:conditions => ['listing_id in (?)', @results.map(&:id)]).group_by(&:listing_id) : {}
    #, :order => "listings.created_at desc", :include => [:user, :city]
  end
end
