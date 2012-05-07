Ploud::Application.routes.draw do

  root :to => 'home#index'

  resources :projects

  devise_for :users

end
