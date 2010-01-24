class UsersController < ApplicationController
  def update
    if current_user.update_attributes(params[:user])
      flash[:notice] = "Updated settings"
    else
      flash[:notice] = "Could not update your settings"
    end
    redirect_to dashboard_path(:filter => 'preferences')
  end
end