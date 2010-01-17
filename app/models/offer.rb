class Offer < ActiveRecord::Base
  
  belongs_to :listing, :counter_cache => true
  belongs_to :user
  
  def after_create
    unless Offer.count(:conditions => {:listing_id => listing_id, :user_id => user_id}) > 1
      User.update_counters user_id, :buying_count => 1
    end
  end
  
  def after_destroy
    if Offer.count(:conditions => {:listing_id => listing_id, :user_id => user_id}) == 0
      User.update_counters user_id, :buying_count => -1
    end
  end
  
  def accept!
    update_attribute(:state, 'accepted')
    listing.accepted_notifications.create(:user_id => user_id, :data => {:amount => amount})
    listing.sold!
  end
  
  def decline!
    update_attribute(:state, 'declined')
    listing.declined_notifications.create(:user_id => user_id, :data => {:amount => amount})
  end
  
  def counter!(counter_amount)
    update_attribute(:counter, 'countered')
    listing.countered_notifications.create(:user_id => user_id, , :data => {:amount => amount, :counter_amount => counter_amount})
  end
  
end
