Rails.application.routes.draw do
  devise_for :users
  resources :reminders
  #get 'home/index'
  #root 'home#index'
  root 'reminders#index'
end
