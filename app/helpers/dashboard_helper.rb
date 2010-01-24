module DashboardHelper
  def notification_display(notification, type)
    send(notification.class.to_s.underscore+"_display", notification, type)
  end
  
  def accept_notification_display(notification, type)
    if type == 'buyer'
      "#{notification.seller.username} accepted your offer of <span class='price'>$#{'%0.2f' % notification.data[:amount]}</span>"
    else
      "you accepted #{notification.buyer.username}'s offer of <span class='price'>$#{'%0.2f' % notification.data[:amount]}</span>"
    end
  end
  
  def counter_accept_notification_display(notification, type)
    if type == 'buyer'
      "#{notification.seller.username} accepted your offer of <span class='price'>$#{'%0.2f' % notification.data[:amount]}</span>"
    else
      "you accepted #{notification.buyer.username}'s offer of <span class='price'>$#{'%0.2f' % notification.data[:amount]}</span>"
    end
  end
  
  def decline_notification_display(notification, type)
    if type == 'buyer'
      "#{notification.seller.username} declined your offer of <span class='price'>$#{'%0.2f' % notification.data[:amount]}</span>"
    else
      "you declined #{notification.buyer.username}'s offer of <span class='price'>$#{'%0.2f' % notification.data[:amount]}</span>"
    end
  end
  
  def counter_decline_notification_display(notification, type)
    if type == 'buyer'
      "you declined #{notification.seller.username}'s offer of <span class='price'>$#{'%0.2f' % notification.data[:amount]}</span>"
    else
      "#{notification.buyer.username} declined your offer of <span class='price'>$#{'%0.2f' % notification.data[:amount]}</span>"
    end
  end
  
  def counter_notification_display(notification, type)
    if type == 'buyer'
      content = "#{notification.seller.username} offered to sell for <span class='price'>$#{'%0.2f' % notification.data[:counter_amount]}</span>" + 
      "<div class='reply'><ul>" +
      content_tag(:li, link_to('accept', listing_offer_path(notification.listing_id, notification.offer_id, :status => 'counter_accepted'), :method => :put)) + 
      content_tag(:li, link_to('decline', listing_offer_path(notification.listing_id, notification.offer_id, :status => 'counter_declined'), :method => :put)) + 
      content_tag(:li, link_to('counter', '#'))+
      "</ul>" + 
      content_tag(:div, render('notifications/counter_counter_form', :notification => notification), :class => 'counter')
    else
      "you offered to sell to #{notification.buyer.username} for <span class='price'>$#{'%0.2f' % notification.data[:counter_amount]}</span>"
    end
  end
  
  def counter_counter_notification_display(notification, type)
    if type == 'buyer'
      "you offered to buy from #{notification.seller.username} for <span class='price'>$#{'%0.2f' % notification.data[:counter_amount]}</span>"
    else
      content = "#{notification.buyer.username} offered to buy for <span class='price'>$#{'%0.2f' % notification.data[:counter_amount]}</span>" + 
      "<div class='reply'><ul>" +
      content_tag(:li, link_to('accept', listing_offer_path(notification.listing_id, notification.offer_id, :status => 'counter_accepted'), :method => :put)) + 
      content_tag(:li, link_to('decline', listing_offer_path(notification.listing_id, notification.offer_id, :status => 'counter_declined'), :method => :put)) + 
      content_tag(:li, link_to('counter', '#'))+
      "</ul>" + 
      content_tag(:div, render('notifications/counter_counter_form', :notification => notification), :class => 'counter')
    end
  end
  
  def offer_notification_display(notification, type)
    if type == 'buyer'
      "you offered <span class='price'>$#{'%0.2f' % notification.data[:amount]}</span>"
    else
      "#{notification.buyer.username} offered you <span class='price'>$#{'%0.2f' % notification.data[:amount]}</span>" + 
      link_to('reply', '#')+
      "<div class='reply'><ul>"+
      content_tag(:li, link_to('accept', listing_offer_path(notification.listing.id, notification.offer_id, :status => 'accepted'), :method => :put)) + 
      content_tag(:li, link_to('decline', listing_offer_path(notification.listing.id, notification.offer_id, :status => 'declined'), :method => :put)) + 
      content_tag(:li, link_to('counter', '#'))+
      "</ul>" + 
      content_tag(:div, render('notifications/counter_form', :notification => notification), :class => 'counter')
    end
  end
  
end
