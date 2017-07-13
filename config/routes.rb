Rails.application.routes.draw do
  @routelist = {}
  @stoplist = {}

  root 'route_list#index'
  get '/stop', ':route_id', to: 'stop_list#index'
  get '/place', ':longitude',':latitude', to: 'place#index'

end
