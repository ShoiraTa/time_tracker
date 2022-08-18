Rails.application.routes.draw do
  resources :auditlogs
  namespace :admin do
      resources :posts
      resources :users
      resources :admin_users

      root to: "posts#index"
    end
  resources :posts
  devise_for :users, skip: [:registrations]
  root "pages#index"
end