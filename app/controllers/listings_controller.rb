class ListingsController < ApplicationController
  
  before_filter :load_listing

  def index
    @listings = Listing.paginate(:per_page => 50, :page => params[:page])
  end

  def show
    @listing = @listing.presenter
    @offer = @listing.offers.new
    @question = @listing.questions.new
    @report = @listing.reports.new
  end

  def new
    @listing = current_user.listings.new
    @categories = Category.all(:order => 'title asc')
    5.times { @listing.photos.build }
  end

  def create
    @listing = current_user.listings.new(params[:listing])
    if @listing.save
      flash[:notice] = 'Your listing has been posted'
      request.xhr? ? render(:json => "{status:'success'}") : redirect_to(@listing)
    else
      flash[:notice] = 'Your listing could not be saved'
      @categories = Category.all(:order => 'title asc')
      request.xhr? ? render(:json => "{status:'failure', errors:#{@listing.errors.to_json}}") : render('new')
    end
  end

  protected
  def load_listing
    @listing = Listing.find(params[:id]) if params[:id]
  end
end
