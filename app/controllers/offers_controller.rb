class OffersController < ApplicationController
  before_filter :load_listing
  def create
    @listing.offer.create(params[:offer])
    flash[:notice] = 'Your offer was received'
    redirect_to @listing
  end

  protected
  def load_listing
    @listing = Listing.find(params[:listing_id]) if params[:listing_id]
  end
end
