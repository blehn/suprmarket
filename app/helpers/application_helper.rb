# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def sort_link_to(field, name = nil)
    name = field if name.nil?
    marker = @order == field ? (@sort_mode == :asc ? '&uarr;' : '&darr;'): '&bull;'
    link_to("#{name} #{marker}", 
      params.merge(:page => nil, :sort => (params[:sort] == "#{field}_asc" ?  "#{field}_desc" : "#{field}_asc")), 
      :class => @order == field ? 'active' : nil
    )
  end
  
  def display_distance(distance)
    '(' + (distance < 5.0 ? '< 5 miles' : '~ %0.1f miles' % distance) + ')'
  end
  
  def value_for_radius(radius)
    case radius
    when nil then 0
    when 'Anywhere' then 4
    when '<5 miles' then 0
    when '<20 miles' then 1
    when '<50 miles' then 2
    when '<200 miles' then 3
    end
  end
end
