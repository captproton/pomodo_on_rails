ActionController::Routing::Routes.draw do |map|

  map.connect '/stats/summary', :controller => 'stats', :action => 'summary'

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  
  map.login '/login', :controller => 'sessions', :action => 'new'
  
  map.register '/register', :controller => 'accounts', :action => 'create'
  
  map.signup '/signup', :controller => 'accounts', :action => 'new'

  map.activate '/activate/:activation_code', :controller => 'accounts', :action => 'activate', :activation_code => nil 
  
  map.resources :accounts, :member => { :suspend   => :put,
                                        :unsuspend => :put,
                                        :purge     => :delete }

  map.resources :assignments

  map.resource :session

  map.resources :workunits

  map.resources :addresses

  map.resources :sprints

  map.resources :tasks

  map.resources :projects

  map.resources :project_categories

  map.resources :users

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
