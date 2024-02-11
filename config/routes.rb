Rails.application.routes.draw do
  resources :movies, only: [:index]
  get "up" => "rails/health#show", as: :rails_health_check

  root to: 'movies#index'
end
