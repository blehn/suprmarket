ActionController::Routing::Routes.draw do |map|
  map.root :controller => :home
  map.resources :searches, :only => [:index]
  
  map.with_options :controller => :home do |home|
    home.privacy_policy '/privacy_policy', :action => :privacy_policy
    home.terms_of_service '/terms_of_service', :action => :terms_of_service
    home.about '/about', :action => :about
    home.support '/support', :action => :support
    home.contact '/contact', :action => :contact
  end
end
