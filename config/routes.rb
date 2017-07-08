require_relative '../lib/metro_rail'

Rails.application.routes.draw do
  @routelist = {}
  @stoplist = {}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get root 'home#index'

 get '/route_list', to: 'home#route_list' do
 	@metro = MetroRail.new
 	@routelist = @metro.get_route_list
 end

  get '/stop_list', to: 'home#stop_list' do
    #TODO - get stop list with route tag
  end

end

# Model MetroRoute/metro_route.rb
# View metro_route.html.erb
# Controller MetroRoutes/metro_routes.rb