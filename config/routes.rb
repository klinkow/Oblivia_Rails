Rails.application.routes.draw do
  root to: "rounds#index"
  resources :rounds
  resources :players
  resources :questions
end
