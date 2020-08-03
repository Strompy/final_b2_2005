Rails.application.routes.draw do
  get '/flights/:id', to: 'flights#show'

  resources :passengers, only: [:show]
  post '/passengers/:id/add_flight', to: 'flight_passengers#create'
end
