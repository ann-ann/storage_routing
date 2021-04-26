Rails.application.routes.draw do
  root :to => "home#index"

  resources :destinations do
    member do
      put 'set_destination'
    end
  end
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
