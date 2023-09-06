Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :trips do
    resources :tickets, only: %i[index new create]
    resources :accommodations, only: %i[index new create]
    resources :groups, only: %i[new create]
  end

  resources :tickets, except: %i[index new create]
  resources :accommodations, except: %i[index new create]
  resources :groups, only: :destroy
end
