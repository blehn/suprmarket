class Offer < ActiveRecord::Base
  
  belongs_to :listing, :counter_cache => true
  belongs_to :user
  
  def after_create
    unless Offer.count(:conditions => {:listing_id => listing_id, :user_id => user_id}) > 1
      User.update_counters user_id, :buying_count => 1
    end
    unless state == 'counter'
      OfferNotification.create(
        :offer_id => self.id, 
        :listing_id => listing_id, 
        :buyer_id => user_id, 
        :seller_id => listing.user_id,
        :data => {
          :amount => amount,
          :sender_name => User.find(user_id).username,
          :sender_id => user_id
        }
      )
    end
  end
  
  def after_destroy
    if Offer.count(:conditions => {:listing_id => listing_id, :user_id => user_id}) == 0
      User.update_counters user_id, :buying_count => -1
    end
  end
  
  def accept_counter!
    update_attribute(:state, 'accepted')
    listing.counter_accept_notifications.create(
      :seller_id => listing.user_id,
      :buyer_id => user_id, 
      :data => {
        :amount => amount
      }
    )
    listing.sold!
  end
  
  def decline_counter!
    update_attribute(:state, 'declined')
    listing.counter_decline_notifications.create(
      :seller_id => listing.user_id,
      :buyer_id => user_id, 
      :data => {:amount => amount}
    )
  end
  
  def counter_counter!(counter_amount, counter_message = nil)
    update_attribute(:state, 'countered')
    new_offer = listing.offers.create(self.attributes.merge(:created_at => nil, :updated_at => nil, :amount => counter_amount, :state => 'counter'))
    listing.counter_counter_notifications.create(
      :seller_id => listing.user_id,
      :buyer_id => user_id, 
      :offer_id => new_offer.id,
      :listing_id => listing_id,
      :data => {
        :amount => amount, 
        :counter_amount => counter_amount, 
        :message => counter_message      
      }
    )
  end
  
  def accept!
    update_attribute(:state, 'accepted')
    listing.accept_notifications.create(
      :seller_id => listing.user_id,
      :buyer_id => user_id, 
      :data => {
        :amount => amount
      }
    )
    listing.sold!
  end
  
  def decline!
    update_attribute(:state, 'declined')
    listing.decline_notifications.create(
      :seller_id => listing.user_id,
      :buyer_id => user_id, 
      :data => {:amount => amount}
    )
  end
  
  def counter!(counter_amount, counter_message = nil)
    update_attribute(:state, 'countered')
    new_offer = listing.offers.create(self.attributes.merge(:created_at => nil, :updated_at => nil, :amount => counter_amount, :state => 'counter'))
    listing.counter_notifications.create(
      :seller_id => listing.user_id,
      :buyer_id => user_id, 
      :offer_id => new_offer.id,
      :listing_id => listing_id,
      :data => {
        :amount => amount, 
        :counter_amount => counter_amount, 
        :message => counter_message      
      }
    )
  end
  
end
