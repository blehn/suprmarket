class HomeController < ApplicationController
  def index
    redirect_to dashboard_path if signed_in?
    @categories = Category.all
  end
  def show
    render params[:id]
  end
end
