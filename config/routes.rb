Rails.application.routes.draw do
  get 'static_pages/gmap'

  @routelist = {}
  @stoplist = {}

  root 'routes#index'

  get '/stops',  ':route_id', to: 'stops#index'
  get '/places', ':longitude',':latitude', to: 'places#index'
  get '/map', to: 'static_pages#gmap'
end
