Rails.application.routes.draw do
  root :to => "home#index"

  resources :destinations
  resources :products
  get '/products/:id/set_destination' => 'products#set_destination', as: :set_destination
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
