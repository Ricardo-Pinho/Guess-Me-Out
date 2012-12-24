UserAuth::Application.routes.draw do

  resources :usercomponents

  resources :avatarcomponents

  resources :componenttypes

  resources :components

  resources :avatars

  resources :users
  match ':controller(/:action)(/:id)(.:format)'
  root :to => 'home#home'
  match "signup", :to => 'users#new'
  match "avatar", :to =>'avatars#new'
  match "login", :to => 'sessions#login'
  match "logout", :to => 'sessions#logout'
  match "home", :to => 'home#home'
  match "help", :to => 'home#help'
  match "statistics", :to => 'home#statistics'
  match "profile", :to => 'sessions#profile'
  match "avatar", :to => 'avatars#show'
  match "shop", :to => 'shop#shop'
  match "getavatar2", :to=>'avatars#getavatar'
  match "getavatar", :to => 'avatarcomponents#getavatar'
  match "getavatarsvg", :to => 'avatarcomponents#getavatarsvg'
  match "updatecomponent", :to => 'avatarcomponents#updatecomponent'
  match "create_avatarcomponent", :to => 'avatarcomponents#createavatarcomponent'
  match "notshow_android", :to => 'users#notshow_android'
  match "new_android", :to => 'users#new_android'
  match "create_android", :to => 'users#create_android'
  match "login_android", :to => 'sessions#login_android'
  match "login_attempt_android", :to => 'sessions#login_attempt_android'
  match "user/edit", :to=> 'users#edit1'
	match "svgs_android", :to => 'componenttypes#getsvgs_android'
	match "svgs_user_android", :to => 'usercomponents#getsvgs_android'
	match "create_avatar_android", :to => 'avatars#create_avatar_android'
  match "find_match", :to=> 'node#find_match'
	match "getUserNameById", :to => 'users#getUserNameById'
	
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
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
