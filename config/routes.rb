Rails.application.routes.draw do
  root to: "rounds#index"
  resources :rounds, only: [:show]
  resources :players
  resources :questions, only: [:show, :index]
end
