Rails.application.routes.draw do
  root to: "challenges#home"
  resources :challenges
  resources :responses
  resources :users, only: [ :new, :create ] do
    resources :gamerooms, only: [ :index, :new, :create, :show ]
  end
end
