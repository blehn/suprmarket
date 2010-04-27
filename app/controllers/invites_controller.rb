class InvitesController < ApplicationController
  def create
    current_user.use_invite(params[:email])
    flash[:notice] = "Your invite has been sent"
    redirect_to dashboard_preferences_path(:anchor => 'invite')
  end
end