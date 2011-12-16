TopOut::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations", :omniauth_callbacks => "users/omniauth_callbacks" } do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end

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
