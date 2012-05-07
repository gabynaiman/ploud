Ploud::Application.routes.draw do

  devise_for :users
  root :to => 'home#index'

  resources :projects do
    resources :contexts
  end

end
