Rails.application.routes.draw do
  # get 'reviews/new'
  #

  post '/uploads' => 'uploads#create', as: :uploads

  root to: 'pages#home'

  devise_for :users

  get "user/:id", to: 'profiles#show', as: 'user_profile'
  post "avatar/:id", to: 'profiles#avatar', as: 'user_profile_avatar'
  get 'profile/change_password', to: 'profiles#change_password', as: "user_change_password"
  patch "profile/change_password", to: 'profiles#update_password', as: 'user_update_password'

  resources :reviews do
    get 'my_review', on: :collection
  end

  resources :relationships, only: [:create, :destroy]

  resources :comments

  resources :replies

  get "likes/:user_id/:review_id", to: 'likes#info', as: 'like_info'
  delete "likes/:id", to: 'likes#destroy', as: 'like_destroy'
  post "likes", to: 'likes#create', as: 'like_create'

  resources :hotels



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
