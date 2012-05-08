Ploud::Application.routes.draw do

  devise_for :users
  root :to => 'home#index'

  match 'drafts',     :to => 'drafts#index',   :via => :get,    :as => :drafts
  match 'drafts',     :to => 'drafts#create',  :via => :post,   :as => :drafts
  match 'drafts/:id', :to => 'drafts#destroy', :via => :delete, :as => :draft
  match 'drafts/:id', :to => 'drafts#update',  :via => :put,    :as => :draft

  resources :projects do
    resources :contexts do
      resources :task_statuses
      resources :tasks
    end
  end

end
