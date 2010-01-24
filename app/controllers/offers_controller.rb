class OffersController < ApplicationController
  before_filter :authenticate, :load_listing
  def create
    @listing.offers.create(params[:offer].merge(:user => current_user))
    flash[:notice] = 'Your offer was received'
    redirect_to @listing
  end

  def update
    @offer = @listing.offers.find(params[:id])
    case params[:status]
      when 'accepted' then @offer.accept!
      when 'declined' then @offer.decline!
      when 'countered' then @offer.counter!(params[:counter_amount], params[:counter_message])
      when 'counter_accepted' then @offer.accept_counter!
      when 'counter_declined' then @offer.decline_counter!
      when 'counter_countered' then @offer.counter_counter!(params[:counter_amount], params[:counter_message])
    end
    redirect_to dashboard_path
  end

  protected
  def load_listing
    @listing = Listing.find(params[:listing_id]) if params[:listing_id]
  end
end
