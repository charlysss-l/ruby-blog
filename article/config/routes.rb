Rails.application.routes.draw do
  # Devise routes
  devise_for :users

  # Home page route (only for guests)
  get "home/index"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Articles CRUD
  resources :my_articles

  # Different roots for authenticated vs unauthenticated users
  authenticated :user do
    root "my_articles#index", as: :authenticated_root
  end

  unauthenticated do
    root "home#index", as: :unauthenticated_root
  end
end
