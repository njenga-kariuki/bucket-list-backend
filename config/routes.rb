Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:new, :create, :index, :update, :delete]
      resources :destinations, only: [:new, :create, :index, :update, :delete]
      resources :trips, only: [:new, :create, :index, :update, :delete]
      get '/trips/hotel_data', :to => 'trips#hotel_data'
      get '/trips/activity_data', :to => 'trips#activity_data'
    end
  end
end
