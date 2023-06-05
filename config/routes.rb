Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :users do
    resource :profile
    get 'jobs', to: 'users#jobs'
  end

  resources :jobs do
    member do
      post 'apply', as: 'job_apply'
    end
  end

  post '/jobs/:id/apply', to: 'jobs#apply'

  resources :profiles, path: 'job/profile'

  root "jobs#index"
end
