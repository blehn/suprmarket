class QuestionsController < ApplicationController
  def create
    @listing = Listing.find(params[:listing_id]).presenter
    if @listing.questions.create(params[:question].merge(:user => current_user))
      flash[:notice] = 'Question saved'
      redirect_to @listing
    else
      @offer = @listing.offers.new
      @question = @listing.questions.new
      @report = @listing.reports.new
      flash[:notice] = 'Could not save question'
      render 'listings/show'
    end
  end
end