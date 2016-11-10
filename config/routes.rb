Rails.application.routes.draw do
  
  root to: 'pages#index'
  get 'home', to: "pages#home", as: :home
  get 'addjob', to: 'pages#addjob', as: :addjob
  get 'settings', to: 'pages#settings', as: :settings
  get 'adminPanel', to: 'admins#index', as: :panel
  
    match "/posts/add_new_comment" => "posts#add_new_comment", :as => "add_new_comment_to_posts", :via => [:post]

  get 'users/edit/:id', to: 'users#edit', as: :edit_user
  
   get 'users/:id' => 'users#destroy', :via => [:user], :as => :admin_destroy_user
  devise_for :users do
      get 'index.html.erb' => 'devise/sessions#destroy'
      get 'home.html', to: 'devise/sessions#create'
  end
  resources :posts 

  post '/profiles/:profile_id/projects/new', to: 'projects#create'
  get 'profiles/:profile_id/projects', to: 'projects#index', as: :projects
  resources :profiles do
  
    resources :projects
  end


  #resources :users

  

  
  


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
