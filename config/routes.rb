Rails.application.routes.draw do
  get '/flights/:id', to: 'flights#show'
end
