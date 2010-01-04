class ListingPresenter < Presenter
  def date
    created_at.strftime("%b %d").upcase
  end
  
  def price
    "<span class='price'>$#{original_price}</span>"
  end
  
  def location
    "#{city.name}, #{city.state}"
  end
  
  def distance_from(user)
    distance = city.distance_from(user.zip_code)
    case distance
    when 0..5 then '< 5 miles'
    else
      "~ #{distance.ceil} miles"
    end
  end
end