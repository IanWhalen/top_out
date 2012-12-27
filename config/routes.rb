TopOut::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations", :omniauth_callbacks => "users/omniauth_callbacks" } do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end

  resources :completed_routes
  resources :completed_problems
  resources :climbing_sessions
  resources :routes
  resources :walls do
    post 'clear', :on => :member
    resources :problems do
      post 'clear', :on => :member
    end
  end
  resources :gyms do
    get 'unsolved', :on => :member
  end
  resources :home

  root :to => "home#index"
end
