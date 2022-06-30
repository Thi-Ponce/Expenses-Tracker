Rails.application.routes.draw do
  resources :entity
  get 'entity/index'
  get 'entity/show'
  get 'entity/new'
  post '/entity/new', to: "entity#create", as: 'entity_create'
  devise_for :users
  get 'splash/show'
  root 'splash#show'
  get 'categories/index'
  get 'categories/new'
  resources :categories
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
