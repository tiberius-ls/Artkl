Rails.application.routes.draw do
  root 'pages#index'
  get '/about', to: 'pages#about'
  resources :articles

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create', as: 'log_in'
  delete '/logout', to: 'sessions#destroy'

  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
