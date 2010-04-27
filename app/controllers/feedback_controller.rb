class FeedbackController < ApplicationController
  def show
    @feedback = current_user.feedback.paginate(:per_page => 25, :page => params[:page])
  end
end