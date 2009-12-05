class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing, :counter_cache => true

  def readable_format
    "Text goes here"
  end

end
