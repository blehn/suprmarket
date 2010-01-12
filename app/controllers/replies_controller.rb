class RepliesController < ApplicationController
  def create
    if current_user.replies.create(params[:reply])
      flash[:notice] = "Sent reply"
    else
      flash[:notice] = "Could not submit reply"
    end
    redirect_to :back
  end
end