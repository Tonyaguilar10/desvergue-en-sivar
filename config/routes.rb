Rails.application.routes.draw do
  get 'gamerooms/show'
  get 'users/index'
  get 'users/new'
  get 'users/create'
  root to: "challenges#home"
end
