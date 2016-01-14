Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'master#index'

  resources :users, only: [:new, :create]
  resources :links, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
    end
  end
end
