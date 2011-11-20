TopOut::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :completed_routes
  resources :completed_problems
  resources :climbing_sessions
  resources :routes
  resources :walls do
    resources :problems
    member do
      post 'clear'
    end
  end
  resources :gyms do
    member do
      get 'unsolved'
    end
  end
  resources :home

  root :to => "home#index"
end
