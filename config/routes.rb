Rails.application.routes.draw do
  root 'welcome#home'
  resources :users, only: [:new, :create, :show, :index]

  resources :categories, only: [:index, :show, :new, :create] do
    resources :games
  end

  resources :achievements, only: [:index]
  resources :games
  resources :tokens
  resources :sessions, only: [:new, :create, :destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#facebook'
  get '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
