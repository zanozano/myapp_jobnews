Rails.application.routes.draw do
  resources :jobs
  resources :profiles, only: [:show]
  devise_for :users
  root "jobs#index"
end
