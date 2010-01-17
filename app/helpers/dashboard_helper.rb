module DashboardHelper
  def notification_display(notification)
    send(notification.class.to_s.underscore+"_display", notification)
  end
  
  def accepted_notification_display(notification)
    "#{notification.listing.user.username} accepted your offer of <span class='price'>$#{notification.data[:amount]}</span>"
  end
end
