Rails.application.routes.draw do
  get 'passwords/:id/edit', to: 'passwords#edit', as: :edit_password
  patch 'passwords/update', to: 'passwords#update', as: :update_password
  resources :bugs, only: [:new, :create]

  get 'users/new'
  post 'users/create'
  get 'users/:id', to: 'users#show', as: :profile
  get 'users/:id/edit', to: 'users#edit', as: :edit_profile
  put 'users/:id', to: 'users#update', as: :update_profile
  resources :exercises do
    collection do
      get :quick_stats
    end
  end
  # get 'exercises/quick_stats'
  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'
  get 'homes/index'
  get 'homes/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"
end
