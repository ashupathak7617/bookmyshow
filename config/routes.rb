Rails.application.routes.draw do
  get '/health', to: proc { [200, {}, ['OK']] }
  root "movies#index"

  require "sidekiq/web"
  require "sidekiq/cron/web"
  mount Sidekiq::Web => "/sidekiq"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_scope :customer do
    post "sign_up", to: "registrations#create"
    post "sign_in", to: "sessions#create"
    post "update/:id", to: "users#update"
    delete "sign_out", to: "sessions#destroy"
  end

  devise_for :customers, controllers: {
        sessions: "customers/sessions",
        registrations: "customers/registrations"
      }

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :movies do
    resources :shows do
    member do
      get :seats
    end
  end
  end

  resources :bookings
  get "/current_customer", to: "customers#current"
  # resources :seats
  get  "/payment/success", to: "bookings#success", as: :payment_success
  get  "/payment/cancel",  to: "bookings#cancel",  as: :payment_cancel
  post "/webhooks/stripe", to: "webhooks#stripe"
end
