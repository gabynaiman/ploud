Ploud::Application.routes.draw do

  devise_for :users
  root :to => 'home#index'

  resources :projects do
    resources :contexts do
      resources :task_statuses
      resources :tasks
    end
  end

end
