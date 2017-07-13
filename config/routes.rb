Rails.application.routes.draw do
  @routelist = {}
  @stoplist = {}

  root 'route_list#index'
  get '/stop_list/', ':route_id', to: 'stop_list#show'
  get '/place/', ':longitude',':latitude', to: 'place#index'

end
