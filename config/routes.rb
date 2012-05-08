Ploud::Application.routes.draw do

  devise_for :users
  root :to => 'home#index'

  match 'drafts',     :to => 'drafts#index',   :via => :get,    :as => :drafts
  match 'drafts',     :to => 'drafts#create',  :via => :post,   :as => :drafts
  match 'drafts/:id', :to => 'drafts#destroy', :via => :delete, :as => :draft
  match 'drafts/:id', :to => 'drafts#update',  :via => :put,    :as => :draft

  match 'todos',                   :to => 'todos#index',         :via => :get,    :as => :todos
  match 'todos/update_status/:id', :to => 'todos#update_status', :via => :put,    :as => :update_status_todo

  resources :projects do
    resources :contexts do
      resources :task_statuses
      resources :tasks do
        put 'update_status', :on => :member
      end
    end
  end

end
