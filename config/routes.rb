Rails.application.routes.draw do
  get 'tasks/create'
  devise_for :users
  root to: "pages#home"

  resources :trips do
    resources :tickets, only: %i[index new create]
    resources :accommodations, only: %i[index new create]
    resources :groups, only: %i[new create]
    resources :tasks, only: :create
  end

  resources :tickets, except: %i[index new create]
  resources :accommodations, except: %i[index new create]
  resources :groups, only: :destroy
  resources :tasks, only: :destroy
end
