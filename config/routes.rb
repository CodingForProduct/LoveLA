Rails.application.routes.draw do
  get 'static_pages/gmap'

  @routelist = {}
  @stoplist = {}

  root 'routes#index'

  get '/stops', to: 'stops#index'
  get '/places', to: 'places#index'
  get '/map', to: 'static_pages#gmap'
  get '/places/show', to: 'places#show'
end
