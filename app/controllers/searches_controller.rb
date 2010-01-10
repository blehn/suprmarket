class SearchesController < ApplicationController
  def show
    params[:sort].match(/^(.+?)_([^_]+)$/) if params[:sort]
    @order = params[:sort] ? $1.to_sym : :date
    @sort_mode = params[:sort] ? $2.to_sym : :desc
    options = {
      :include => [:user, :city], 
      :order => @order, 
      :sort_mode => @sort_mode,
      :with => {:sold => false}
    }
    @results = if params[:title_only]
      Listing.search(
        options.merge(:conditions => {:title => params[:q]})
      )
    else
      Listing.search(
        params[:q], 
        options
      )
    end
      
    @favorites = signed_in? ? 
      current_user.favorites.all(:conditions => ['listing_id in (?)', @results.map(&:id)]).group_by(&:listing_id) : 
      {}
  end
end
