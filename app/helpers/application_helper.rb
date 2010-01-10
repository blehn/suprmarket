# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def sort_link_to(field, name = nil)
    name = field if name.nil?
    link_to("#{name} &bull", params.merge(:sort => (params[:sort] == "#{field}_asc" ?  "#{field}_desc" : "#{field}_asc")))
  end
end
