require_relative '../../lib/metro_rail'
require_relative '../../lib/database_mgr'

class RouteListController < ActionController::Base
  @routelist = {}

  def show
    @metro = MetroRail.new
    @routelist = @metro.get_route_list
  end
end
