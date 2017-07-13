Rails.application.routes.draw do
  @routelist = {}
  @stoplist = {}

  root 'route_list#index'
<<<<<<< HEAD
  get '/stop', ':route_id', to: 'stop_list#index'
  get '/place', ':longitude',':latitude', to: 'place#index'
=======
  get '/stop_list/', ':route_id', to: 'stop_list#show'
  get '/place/', ':longitude',':latitude', to: 'place#index'
>>>>>>> master

end
