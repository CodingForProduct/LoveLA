Rails.application.routes.draw do
  get 'static_pages/gmap'

  @routelist = {}
  @stoplist = {}

  root 'routes#index'

  get '/stops', to: 'stops#index'
  get '/stops/select', to: 'stops#select'
  post '/stops/select', to: 'places#index'
  get '/places', to: 'places#index'
  get '/map', to: 'static_pages#gmap'
  #post '/places/show', to: 'places#show'

end
