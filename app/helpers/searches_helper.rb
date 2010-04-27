module SearchesHelper
  def search_view_links
   return link_to(image_tag((params[:grid_view] ? 'grid_view_down.png' : 'grid_view_up.png')), params.merge(:grid_view => true), :class => 'grid_view_icon') + 
   link_to(image_tag((params[:grid_view] ? 'list_view_up.png' : 'list_view_down.png')), params.merge(:grid_view => nil), :class => 'list_view_icon')
  end
  
  def custom_paginate results
    page = params[:page] ? params[:page].to_i : 1
    returning("<div class='pagination'>") do |output|
      if page == 1 || (page - 5) < 3
        1.upto([results.total_pages, 12].min) do |i|
          output << link_to(i.to_s, params.merge(:page => i), :class => 'link'+(i == page ? ' active' : ''))
        end
      else
        output << link_to('1', params.merge(:page => 1), :class => 'link'+(1 == page ? ' active' : ''))
        output << "<div class='link ellipses'>...</div>"
        (page - 5).upto([results.total_pages, (page + 5)].min) do |i|
          output << link_to(i.to_s, params.merge(:page => i), :class => 'link'+(i == page ? ' active' : ''))
        end
      end
      if ((page - 5) < 3 && results.total_pages > 12) || ((page - 5) >= 3 && (page + 5) < results.total_pages)
        output << "<div class='link ellipses'>...</div>"
        output << link_to(results.total_pages, params.merge(:page => results.total_pages), :class => 'link'+(results.total_pages == page ? ' active' : ''))
      end
      output << link_to(image_tag('left.png'), params.merge(:page => [1, page - 1].max), :class => 'link') if results.total_pages > 1
      output << link_to(image_tag('right.png'), params.merge(:page => [results.total_pages, page + 1].min), :class => 'link')  if results.total_pages > 1
      output << '</div>'
    end
  end
end
