ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => :home
  
  map.resource :dashboard, :only => [:show] do |dashboard|
    dashboard.resource :buying, :only => [:show], :as => 'buying', :controller => 'buying'
    dashboard.resource :selling, :only => [:show], :as => 'selling', :controller => 'selling'
    dashboard.resource :feedback, :only => [:show], :as => 'feedback', :controller => 'feedback'
    dashboard.resource :preferences, :only => [:show], :as => 'preferences', :controller => 'preferences'
  end
    
  map.resources :invites, :only => [:create]
  map.resource :search, :only => [:show]
  map.resources :categories, :only => [:show]
  map.resources :replies, :only => [:create]
  map.resources :listings, :has_many => [:offers, :questions, :reports] do |listing|
    listing.resource :favorite, :only => [:create, :destroy]
  end
  
  map.favorites '/favorites', :controller => :favorites
  
  map.with_options :controller => :home do |home|
    home.rules '/rules', :action => :show, :id => :rules
    home.feedback '/feedback', :action => :show, :id => :feedback
    home.about '/about', :action => :show, :id => :about
    home.support '/support', :action => :show, :id => :support
    home.contact '/contact', :action => :show, :id => :contact
  end
  
  #override clearance
  map.resource  :session, :controller => :sessions, :only => [:new, :create, :destroy]
  map.sign_out 'sign_out', :controller => :sessions, :action => :destroy, :method => :delete
  map.resources :users, :only => [:update]
  
  Clearance::Routes.draw(map)
end
