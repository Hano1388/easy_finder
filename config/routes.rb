Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'

  resources :stores do
    resources :aisles, only: [:show]
    resources :items, only: [:show]
  end

  # get '/item/store', to: 'items#store'

  resources :items

  resources :searches
end
