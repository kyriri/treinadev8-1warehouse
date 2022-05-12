Rails.application.routes.draw do
  root "home#index"
  
  resources :warehouses,    only: [        :show, :new, :create, :edit, :update, :destroy]
  resources :manufacturers, only: [:index, :show, :new, :create, :edit, :update]
  resources :products,      only: [:index, :show, :new, :create]
end
