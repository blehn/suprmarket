class OffersController < ApplicationController
  before_filter :load_listing
  def create
    @listing.offers.create(params[:offer].merge(:user => current_user))
    flash[:notice] = 'Your offer was received'
    redirect_to @listing
  end

  def update
    @offer = @listing.offers.find(params[:id])
    @offer.update_attributes(params[:offer])
    redirect_to dashboard_path
  end

  protected
  def load_listing
    @listing = Listing.find(params[:listing_id]) if params[:listing_id]
  end
end
