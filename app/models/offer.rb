class Offer < ActiveRecord::Base
  belongs_to :listing, :counter_cache => true
  belongs_to :user

  def readable_format
    "Text goes here"
  end
end
