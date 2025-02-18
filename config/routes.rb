Rails.application.routes.draw do
  get "movies/index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  #devise_for :customers
  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  devise_scope :customer do
    post "sign_up", to: "registrations#create"
    post "sign_in", to: "sessions#create"
    post "update/:id", to: "users#update"
  end

  devise_for :customers, controllers: {
        sessions: 'customers/sessions',
        registrations: 'customers/registrations'
      }

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
   # root "home#index"

   resources :movies
   root "movies#index"
end
