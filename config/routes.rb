Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :locations, only: [:index, :show]

  # Parking Spots
  get '/parking_spots/:location_id', to: 'parking_spots#index'
  get '/parking_spots/status/:id', to: 'parking_spots#show'
end
