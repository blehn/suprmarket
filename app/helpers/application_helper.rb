# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def sort_link_to(field, name = nil)
    name = field if name.nil?
    marker = @order == field ? (@sort_mode == :asc ? '&uarr;' : '&darr;'): '&bull;'
    link_to("#{name} #{marker}", 
      params.merge(:sort => (params[:sort] == "#{field}_asc" ?  "#{field}_desc" : "#{field}_asc")), 
      :class => @order == field ? 'active' : nil
    )
  end
  
  def display_distance(distance)
    '(' + (distance < 5.0 ? '< 5 miles' : '~ %0.1f miles' % distance) + ')'
  end
end
