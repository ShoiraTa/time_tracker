Rails.application.routes.draw do
  resources :auditlogs
  namespace :admin do
      resources :posts
      resources :users
      resources :admin_users

      root to: "posts#index"
    end
  resources :posts do 
    member do
      get :approve
    end
  end
  devise_for :users, skip: [:registrations]
  root "pages#index"
end