Ploud::Application.routes.draw do

  devise_for :users
  root :to => 'home#index'

  resources :projects do
    resources :contexts do
      resources :task_statuses
    end
  end

end
