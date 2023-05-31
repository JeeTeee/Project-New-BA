Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :occasions, only: %i[index show]

  get 'services', to: "pages#services"
  get 'concessions', to: "pages#concessions"
  get 'nouveautes', to: "pages#nouveautes"
end
