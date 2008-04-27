ActionController::Routing::Routes.draw do |map|
  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "wizard", :action => "index"
  
  map.connect 'wizard/:context_id', :controller => "wizard", :action => "wizard"
  map.connect 'guess/:context_id', :controller => "guess", :action => "guess"
  
  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
