require_relative '../../lib/metro_rail'
require_relative '../../lib/database_mgr'

class RouteListController < ApplicationController
  @routelist = {}

  def index
    @routelists = Route.all
    if params[:route_id]
      @stoplist = Stop.where(route_id: params[:route_id])
    end
  end


#  def show
#    @metro = MetroRail.new
#    @routelist = @metro.get_route_list
#  end

  private

  def route_params
    params.require(:route).permit(:route_id, :display_name, :created_at, :updated_at, :route_location)
  end
end
