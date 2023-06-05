Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' } 
  
  post 'users/new_registration', to: 'users/registrations#create', as: 'create_registration'
  get 'users/new_registration', to: 'users#new_registration', as: 'new_registration'

  resources :users do
    get 'jobs', to: 'users#jobs'
  end

  resources :jobs do
    member do
      post 'apply'
      delete 'cancel_apply', to: 'jobs#cancel_application', as: 'cancel_apply'
    end
  end
  
  # Redirige a la acción de perfil del controlador de perfiles
  get 'profile', to: 'profiles#index', as: 'profiles'

  resources :profiles
  #resources :profiles, path: 'job/profile'
  root "jobs#index"
end
