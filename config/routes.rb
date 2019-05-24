Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      get '/users/:id/', to: 'users#profile'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get 'users/:id/trip_details/:id', to: 'trips#trip_details'
      resources :destinations, only: [:new, :create, :index, :update, :delete]
      resources :trips, only: [:new, :create, :index, :update, :delete]
      get '/trips/hotel_data', :to => 'trips#hotel_data'
      get '/trips/activity_data', :to => 'trips#activity_data'
    end
  end
end
