TopOut::Application.routes.draw do
  devise_for :users

  resources :completed_routes
  resources :completed_problems
  resources :climbing_sessions
  resources :routes
  resources :problems
  resources :walls
  resources :gyms
  resources :home

  root :to => "home#index"
end
