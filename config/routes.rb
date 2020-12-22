Rails.application.routes.draw do
  root 'boards#index'
  get 'pricing', to: 'pages#pricing'

  resources :orders, only: [:index, :show, :create, :destroy]

  resource :cart, only: [:show, :destroy] do
    post 'add_item/:id', action: 'add_item', as: 'add_item'
    get :checkout
  end

  resource :users, controller: 'registrations', only: [:create, :edit, :update] do
    get '/sign_up', action: 'new'
  end

  resource :users, controller: 'sessions', only: [] do
    get '/sign_in', action: 'new'
    post '/sign_in', action: 'create'
    delete '/sign_out', action: 'destroy'
  end

  resources :boards do
    member do
      patch :hide
      patch :open
      patch :lock
    end
    resources :posts, shallow: true
  end

  resources :posts, only:[] do
    resources :comments, shallow: true, only: [:create, :destroy]
    member do
      post :favorite  # POST /posts/:id/favorite
    end
  end
end
