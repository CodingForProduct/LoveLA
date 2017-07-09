require_relative '../lib/metro_rail'

Rails.application.routes.draw do
  @routelist = {}
  @stoplist = {}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get '/route_list/', to: 'route_list#show'
 	#@metro = MetroRail.new
 	#@routelist = @metro.get_route_list
  get '/stop_list/', ':route_id', to: 'stop_list#show'
end

# Model MetroRoute/metro_route.rb
# View metro_route.html.erb
# Controller MetroRoutes/metro_routes.rb
