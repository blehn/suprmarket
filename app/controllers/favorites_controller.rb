class FavoritesController < ApplicationController
  before_filter :authenticate
  
  def index
    favorites = current_user.favorites.paginate(:per_page => 20, :page => params[:page], :include => {:listing => [:city, :user]})
    @results = favorites.map(&:listing).paginate
    @favorites = favorites.group_by(&:listing_id)
  end
  
  def create
    current_user.favorites.create(:listing_id => params[:listing_id])
    respond_to do |format|
      format.html do
        flash[:notice] = 'Added as favorite'
        redirect_to :back
      end
      format.json { render :json => {:message => 'Added as favorite'}}
    end
  end
  
  def destroy
    current_user.favorites.destroy(params[:id])
    flash[:notice] = 'Favorite removed'
    redirect_to :back
  end
end