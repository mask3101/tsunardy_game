Rails.application.routes.draw do
  #resources :players
  resources :questions
  resources :images
  resources :users
  resources :games do
    member do
      get 'test/:question_id', :action => 'test', :as => 'test'
      get 'questions/:question_id', :action => 'questions', :as => 'questions'
      post 'make_questions'
      get 'desempate/:question_id', :action => 'desempate', :as => 'desempate'
      get 'make_desempate'
    end
    resources :players do
      member do
        put 'the_points'
      end
    end
  end
  resources :categories
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get '/games/rules/:id', to: 'games#rules'
  #get '/games/:id/players' => 'games#categories', as: :new_game_player
  root to: 'games#index'
  get '/games/:id/game', to: 'games#game', as: :games_game
  get 'questions/:id/:filename' => "questions#show_image"
  #get '/games/:game_id/players/:id/the_points', to: 'player#points', as: :points_player

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
