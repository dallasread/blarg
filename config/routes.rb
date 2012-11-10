Blarg::Application.routes.draw do
  
  resources :media

  devise_for :users
  
  resources :designs
  resources :siteships
  resources :sites
  resources :pages
  resources :widgets
  resources :sections
  resources :patterns
  
  post "/sort/pages/:id" => "pages#sort", as: :pages_sort
  post "/sort/sections/:id" => "sections#sort", as: :sections_sort
  post "/widgets/:style" => "widgets#create", as: :create_widget
  
  constraints lambda { |r| r.subdomain.present? && r.subdomain != 'www' } do
    get "/:id" => "pages#show", as: :quick_page
    get "/:id/style" => "designs#show", as: :css, format: :css
    get "/:id/javascript" => "designs#show", as: :js, format: :js
    root to: "sites#show"
  end
  
  root to: "sites#index"

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