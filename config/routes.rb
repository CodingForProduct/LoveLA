Rails.application.routes.draw do
  @routelist = {}
  @stoplist = {}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'home#index'
  root 'route_list#index'
  get '/stop/', ':route_id', to: 'stop_list#index'
  get '/places/', ':longitude',':latitude', to: 'places#index'
end
