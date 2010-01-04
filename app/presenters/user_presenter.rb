class UserPresenter < Presenter
  def rating
    return '-' if ratings_count == 0
    return original_rating
  end
end