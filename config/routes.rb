Maktaba::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

     namespace :admin do
  resources :posts, :languages, :regions, :comments, :posts, :works, :users, :authors, :countries, :language_in_countries, :settings
  end
   devise_for :users, :controllers => {:registrations => "registrations"} do
      get "admin/admin_pages" => "admin/interface#index", :as => :admin_interface
     get "sign_in", :to => "devise/sessions#new", :as => :sign_in
      get "sign_out" => 'devise/sessions#destroy', :as => :sign_out
      get "sign_up", :to => "devise/sessions#new", :as => :sign_up
      get "/", :to => "public#index"
      get "instructions" => "public#instructions", :as => :instructions
      match "languages_in_country/:id"  => 'public#languages_in_country', :as => :languages_in_country
      match "/country/:name" => 'public#country', :as => :country
      match "/country/:name/posts" => 'public#country_posts', :as => :country_posts
      match "/country/:name/works" => 'public#country_works', :as => :country_works
      match "/country/:name/authors" => 'public#country_authors', :as => :country_authors
      match "/country/:name/post/:id" => 'public#country_post', :as => :country_post
      match "/country/:name/work/:id" => 'public#country_work', :as => :country_work
      match "/country/:name/author/:id" => 'public#country_author', :as => :country_author
      match "/language/:name" => 'public#language', :as => :language
      match "/language/:name/posts" => 'public#language_posts', :as => :language_posts
      match "/language/:name/works" => 'public#language_works', :as => :language_works
      match "/language/:name/authors" => 'public#language_authors', :as => :language_authors
      match "/language/:name/post/:id" => 'public#language_post', :as => :language_post
      match "/language/:name/work/:id" => 'public#language_work', :as => :language_work
      match "/language/:name/author/:id" => 'public#language_author', :as => :language_author
    end

  resources :friendships
  get "confirmation_has_been_sent" => "public#confirmation_has_been_sent", :as => :confirmation_has_been_sent
  get "public_user" => "public_user#index", :as => :public_user
  get "instructions" => "public#instructions", :as => :instructions
  get "public_user_edit" => "public_user#edit", :as => :public_user_edit
  get "search_friends" => "public_user#search_friends", :as => :search_friends
  get "public/index"
  get "/posts/:id/remove_points" => "posts#remove_points"
  get "/posts/:id/add_points" => "posts#add_points"
  get "/comments/:id/remove_points" => "comments#remove_points"
  get "/comments/:id/add_points" => "comments#add_points"


  match "languages_in_country/:id"  => 'public#languages_in_country', :as => :languages_in_country
  

  resources :PublicUser
  resources :languages
  resources :regions
  resources :comments
  resources :posts do
    resources :comments
  end
  resources :works
  resources :users
  resources :authors
  resources :countries
  
  root :to => "public#index"

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
  # match ':controller(/:action(/:id(.:format)))'
end
