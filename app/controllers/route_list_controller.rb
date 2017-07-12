class RouteListController < ApplicationController
  @routelist = {}

  def index
    @routelists = Route.all
    if params[:route_id]
      @stoplist = Stop.where(route_id: params[:route_id])
    end
  end

  private

  def route_params
    params.require(:route).permit(:route_id, :display_name, :created_at, :updated_at, :route_location)
  end
end
