class Rating < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  belongs_to :rater, :class_name => 'User'
  def before_create
    user.update_attribute(:rating, (((user.rating * user.ratings_count) + (self.value * 100)) / (user.ratings_count + 1)))
  end
end
