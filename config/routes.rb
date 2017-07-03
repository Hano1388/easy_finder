Rails.application.routes.draw do
  resources :searches
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :stores do
    resources :aisles, only: [:show]
  end

  resources :items
end
