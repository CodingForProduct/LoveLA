require_relative '../lib/metro_rail'

@routelist = {}

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get root 'home#index'

 get '/routelist', to: 'home#routelist' do
 	@metro = MetroRail.new
 	@routelist = @metro.get_route_list
 end

end
