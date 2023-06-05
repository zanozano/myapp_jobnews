Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  resources :users do
    resource :profile
  end

  resources :jobs
  
  resources :profiles, path: 'job/profile'
  root "jobs#index"
end
