Rails.application.routes.draw do
  resources :user_stocks, only: [:create,:destroy]
  get 'stocks/search'
  # get 'users/my_portfolio'
  devise_for :users
  root to: "welcome#index"
  get '/my_portfolio', to: "users#my_portfolio"
  get '/search_stocks',to: "stocks#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end