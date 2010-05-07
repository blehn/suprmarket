module UsersHelper
  def activity_link_to
    link_to image_tag('message.png'), (current_user.listings.count > 0 ? dashboard_selling_path : dashboard_buying_path)
  end
  
  def favorites_link_to
    link_to image_tag(current_user.favorites.count > 0 ? 'favorite-active.png' : 'favorite.png'), favorites_path
  end
end