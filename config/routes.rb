Social::Application.routes.draw do ||

    #map.resources :posts, :has_many => :comments
  #
  #  map.connect ':controller/:action/:id'
  #  map.connect ':controller/:action/:id.:format'
  #  map.root :controller => "post"




  get "home/index"

  match "/users/edit_profile/:id" => "users#edit_profile", :as => "edit_profile"
  match "/friendships/common_with/:id" => "friendships#common_with", :as => "common_with"
  match "/friendships/all_friends/" => "friendships#all_friends", :as => "all_friends"
  match "/posts/show/:post_id" => "posts#show", :as => "show"
  match "/likes/create" => "likes#create", :as => "likes_create"
  match "/likes/destroy/:id" => "likes#destroy", :as => "likes_destroy"
  match "/likes/like_people" => "likes#like_people", :as => "likes_people"
  match "/event/create_event" => "events#create_event", :as =>"create_event"
  match "/event/select_friends" => "events#select_friends", :as =>"select_friends"
  devise_for :users





  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'posts#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id(.:format)))'
end
