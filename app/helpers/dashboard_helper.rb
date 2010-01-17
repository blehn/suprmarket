module DashboardHelper
  def notification_display(notification)
    send(notification.class.to_s.underscore+"_display", notification)
  end
  
  def accepted_notification_display(notification)
    "#{notification.listing.user.username} accepted your offer of <span class='price'>$#{'%0.2f' % notification.data[:amount]}</span>"
  end
  
  def declined_notification_display(notification)
      "#{notification.listing.user.username} declined your offer of <span class='price'>$#{'%0.2f' % notification.data[:amount]}</span>"
  end
  
  def countered_notification_display(notification)
      "#{notification.listing.user.username} countered your offer of <span class='price'>$#{'%0.2f' % notification.data[:amount]}</span>"
  end
end
