Rails.application.routes.draw do
  
  
  get 'search/repository'

  get 'search/articles'

  resources :articles do
    member do
      put "like", to: "articles#upvote"
      put "dislike", to: "articles#downvote"
    end
  end  
  mount Commontator::Engine => '/commontator' 

  resources :repositories do
    collection do
      get 'purches/:id' => 'repositories#purches', as: :repositories
      post "/repositories/:id" => "repositories#show"
      post "/:id" => "repositories#show_purchase", as: :repository
      post "/repositories/hook" => "repositories#hook"
    end
  end

  
  resources :github_profiles
  

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  

  get 'welcome/index'
  get 'welcome/form'
  root 'welcome#index'
  get 'welcome/table'
  get 'welcome/profile'
  get 'welcome/login'
  get 'welcome/lock'
  get 'welcome/register'
  get 'welcome/mypocs'
  get 'welcome/buy_poc'
  

  get 'tags/:tag', to: 'repositories#index', as: :tag


end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your  routes lay out with "rake routes".

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

