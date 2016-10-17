Rails.application.routes.draw do
  #get 'trees/index'

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  root 'home#home'
  get 'help'    => 'home#help'
  get 'about'   => 'home#about'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users, except: [:index]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :trees, only: [:index]
  resources :microposts
end
