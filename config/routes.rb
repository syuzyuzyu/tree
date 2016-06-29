Rails.application.routes.draw do
  root 'home#home'
  get 'help'    => 'home#help'
  get 'about'   => 'home#about'
  get 'signup'  => 'users#new'
  resources :users
end
