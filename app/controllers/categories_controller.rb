class CategoriesController < ApplicationController
  def show
    params[:sort].match(/^(.+?)_([^_]+)$/) if params[:sort]
    @order = params[:sort] ? $1.to_sym : :date
    @sort_mode = params[:sort] ? $2.to_sym : :desc
    @city = nil
    if signed_in? || params[:zip_code]
      zip_code = params[:zip_code] ? params[:zip_code] : current_user.zip_code
      @city = City.find_by_zip_code(zip_code)
    end
    favorites_for_search = @order == :favorites && signed_in? ? current_user.favorites : []
    @results = Listing.find_for_search(@order, @sort_mode, @city, params, favorites_for_search)
      
    @favorites = signed_in? ? 
      current_user.favorites.all(:conditions => ['listing_id in (?)', @results.map(&:id)]).group_by(&:listing_id) : 
      {}
    @category = Category.find_by_url(params[:id])
    @results = Listing.find_for_search(@order, @sort_mode, @city, params.merge(:with => {:category_id => @category.id}), favorites_for_search)
  end
end