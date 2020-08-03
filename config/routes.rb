Rails.application.routes.draw do
  get '/flights/:id', to: 'flights#show'

  resources :passengers, only: [:show]
  patch '/passengers/:id/add_flight', to: 'flight_passengers#create'
end
