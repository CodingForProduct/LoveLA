Rails.application.routes.draw do
  @routelist = {}
  @stoplist = {}

  root 'routes#index'

  get '/stops', ':route_id', to: 'stops#index'
  get '/places', ':longitude',':latitude', to: 'places#index'

end
