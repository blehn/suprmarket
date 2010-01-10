class FavoritesController < ApplicationController
  before_filter :authenticate
  def create
    current_user.favorites.create(:listing_id => params[:listing_id])
    flash[:notice] = 'Added as favorite'
    redirect_to :back
  end
  
  def destroy
    current_user.favorites.destroy(params[:id])
    flash[:notice] = 'Favorite removed'
    redirect_to :back
  end
end