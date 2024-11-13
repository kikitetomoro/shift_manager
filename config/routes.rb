Rails.application.routes.draw do

# AdminUser 用の Devise ルーティング
devise_for :admin_users, controllers: {
  sessions: 'admin_users/sessions',
  registrations: 'admin_users/registrations',
}

# User 用の Devise ルーティング
devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations',
}


  

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  
  root "shifts#index"

  resources :shifts, only: [:index, :create, :edit]
  resources :calendar, only: [:index, :edit, :update]
  resources :shift_settings, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :employees, only: [:index, :new, :create, :edit, :update, :destroy]

  

end
