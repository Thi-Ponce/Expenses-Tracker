Rails.application.routes.draw do
  resources :categories, only: [:index, :show]
  resources :entities, only: [:index, :show]
  post '/entity/new', to: "entity#create", as: 'entity_create'
  devise_for :users
  get 'splash/show'
  root 'splash#show'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
