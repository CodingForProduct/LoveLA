require_relative '../../lib/metro_rail'
require_relative '../../lib/database_mgr'

class RouteListController < ApplicationController
  @routelist = {}

  def show
    @metro = MetroRail.new
    @routelist = @metro.get_route_list
  end
end
