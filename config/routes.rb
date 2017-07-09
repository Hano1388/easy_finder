Rails.application.routes.draw do

  get 'sessions/new'

  root 'items#index'
  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :stores do
    resources :aisles, only: [:show]
    resources :items, only: [:show]
  end


  resources :nearby_stores, only: [:index]

  # get '/item/store', to: 'items#store'

  resources :items

  resources :searches
end
