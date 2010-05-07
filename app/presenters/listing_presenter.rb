class ListingPresenter < Presenter
  def date
    created_at.strftime("%b %d").upcase
  end
  
  def price
    "<span class='price'><sup>$</sup>#{original_price}</span>"
  end
  
  def location
    "#{city.name}, #{city.state}" if city
  end
  
  def distance_from(user)
    distance = city.distance_from(user.zip_code)
    case distance
    when 0..5 then '(within 5 mi)'
    else
      "(within #{distance.ceil} mi)"
    end
  end
end