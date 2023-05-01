Rails.application.routes.draw do
  get 'exercises/index'
  get 'exercises/new'
  get 'exercises/create'
  get 'exercises/show'
  get 'exercises/edit'
  get 'exercises/update'
  get 'exercises/destroy'
  get 'exercise/index'
  get 'exercise/new'
  get 'exercise/create'
  get 'exercise/show'
  get 'exercise/edit'
  get 'exercise/update'
  get 'exercise/destroy'
  #get 'login', to: 'sessions#new'
  #post 'login', to: 'sessions#create'
  #delete 'logout', to: 'sessions#destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'homes/index'
  get 'homes/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"
end
