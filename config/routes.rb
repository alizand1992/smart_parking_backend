Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Locations
  resources :locations, only: [:index, :show, :new, :create]
  post '/location/parking_spot/link', to: 'locations#link_parking_spot'
  post '/location/parking_spot/unlink/', to: 'locations#unlink_parking_spot'

  # Parking Spots
  get '/parking_spots/:location_id', to: 'parking_spots#index'
  get '/parking_spots/status/:id', to: 'parking_spots#show'
  get '/parking_spots', to: 'parking_spots#all_parking_spots'
  get '/parking_spots/sync', to: 'parking_spots#sync'
  get '/parking_spots/available/:location_id', to: 'parking_spots#available_spots_for_location'
end
