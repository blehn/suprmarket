class SearchesController < ApplicationController
  def show
    
    params[:sort].match(/^(.+?)_([^_]+)$/) if params[:sort]
    @order = params[:sort] ? $1.to_sym : :date
    @sort_mode = params[:sort] ? $2.to_sym : :desc
    options = {
      :include => [:user, :city], 
      :order => @order == :distance ? "@geodist #{@sort_mode}" : @order, 
      :sort_mode => @order == :distance ? nil : @sort_mode,
      :with => {:sold => false}
    }

    
    if signed_in? || params[:zip_code]
      zip_code = params[:zip_code] ? params[:zip_code] : current_user.zip_code
      @city = City.find_by_zip_code(zip_code)
      radius = params[:radius] ? 
        (params[:radius] == 'Anywhere' ? 2000 : params[:radius].match(/(\d+)/)[1]) : 
        5
      options[:geo] = [@city.lat * 0.0174532925, @city.lon * 0.0174532925]
      options[:with]['@geodist'] = 0.0..(radius.to_f * 1609.344)
    end
    
    #options[:with][:sold] = false unless params[]
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
