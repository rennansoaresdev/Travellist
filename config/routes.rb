Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :trips do
    resources :tickets, only: %i[index new create]
    resources :accommodations, only: %i[index new create destroy]
    resources :members, only: %i[new create]
    resources :tasks, only: :create
  end

  resources :tickets, except: %i[index new create]
  resources :accommodations, except: %i[index new create]
  resources :tasks, only: %i[update destroy]
  resources :members, only: :destroy
end
