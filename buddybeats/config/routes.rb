Rails.application.routes.draw do

  delete 'songs/destroy'
  get 'songs/index'
  get 'songs/new/:random_hex', to: 'songs#new'
  get 'songs/create', to: 'songs#create'
  get 'songs/mysongs', to: 'songs#mysongs'
  get 'songs/show'
  get 'songs/spotifyshow'
  get 'songs/update'
  get 'songs/search/:random_hex', to: 'songs#search'
  get 'songs/spotifysearch/:random_hex', to: 'songs#spotifysearch'
  get '/songs/spotifysearch', to: 'songs#spotifysearch'


  get '/about', to: 'playlists#about'
  get 'playlists/create', to: 'playlists#create'
  get 'playlists/mylists', to: 'playlists#mylists'
  get 'playlists/all', to: 'playlists#all'
  get '/playlists/new', to: 'playlists#new'
  get '/playlists/:random_hex', to: 'playlists#show'
  delete '/playlists/destroy/:id', to: 'playlists#destroy'


  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  # get '/logout', to: 'sessions#destroy'
  get '/sessions/destroy', to: 'sessions#destroy'

  root "accounts#new"
  get '/register', to: 'accounts#new'
  post '/users', to: 'accounts#create'

  resources :password_resets

  resources :playlists
  resources :accounts, except: :destroy
  resources :songs


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
