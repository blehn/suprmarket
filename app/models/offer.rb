class Offer < ActiveRecord::Base
  belongs_to :listing, :counter_cache => true
  belongs_to :user

  
  def after_update
    if state == 'accepted'
      listing.sold!
    end
  end
end
