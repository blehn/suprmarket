class HomeController < ApplicationController
  before_filter :check_user
  def show
    render params[:id]
  end
  protected
  def check_user
    redirect_to dashboard_path if current_user
  end
end
