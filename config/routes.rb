Rails.application.routes.draw do
  devise_for :users
  resources :reminders
  resources :users
  #get 'home/index'
  #root 'home#index'
  root 'reminders#index'
end
