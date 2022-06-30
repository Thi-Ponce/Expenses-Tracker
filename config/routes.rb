Rails.application.routes.draw do
  devise_for :users
  get 'splash/show'
  root 'splash#show'
end
