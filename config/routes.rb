Rails.application.routes.draw do
  root to: "challenges#home"
  resources :challenges
  resources :responses
  resources :users, only: [ :new, :create ] do
    resources :gamerooms, only: [ :index, :new, :create, :show ] do
      post '/', to: 'gamerooms#get_blue_card', as: :grab_blue
      patch '/', to: 'gamerooms#restart_blue_cards', as: :restart_blue
    end
  end
end
