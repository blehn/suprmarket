module SearchesHelper
  def search_view_links
   return link_to(image_tag((params[:grid_view] ? 'grid_view_down.png' : 'grid_view_up.png')), params.merge(:grid_view => true), :class => 'grid_view_icon') + 
   link_to(image_tag((params[:grid_view] ? 'list_view_up.png' : 'list_view_down.png')), params.merge(:grid_view => nil), :class => 'list_view_icon')
  end
end
