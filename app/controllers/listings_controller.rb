class ListingsController < ApplicationController
  
  before_filter :load_listing

  def show
  end

  def new
    @listing = current_user.listings.new
    @categories = Category.all(:order => 'title asc')
  end

  def create
    @listing = current_user.listings.new(params[:listing])
    if @listing.save
      flash[:notice] = 'Your listing has been posted'
      redirect_to @listing
    else
      flash[:notice] = 'Your listing could not be saved'
      @categories = Category.all(:order => 'title asc')
      render 'new'
    end
  end

  protected
  def load_listing
    @listing = Listing.find(params[:id]) if params[:id]
  end
end
