Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :trips do
    member do
      resources :tickets, only: %i[index new create]
      resources :accomodations, only: %i[index new create]
      resources :groups, only: %i[new create]
    end
  end

  resources :tickets, except: %i[index new create]
  resources :accomodations, except: %i[index new create]
  resources :groups, only: :destroy
end
