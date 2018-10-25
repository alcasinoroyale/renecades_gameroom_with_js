Rails.application.routes.draw do
  root 'welcome#home'
  resources :users, only: [:new, :create, :show]

  resources :categories, only: [:index, :show] do
    resources :games
  end

  resources :games
  resources :tokens
  resources :sessions, only: [:new, :create, :destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
