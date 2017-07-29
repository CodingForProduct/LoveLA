class RoutesController < ApplicationController
  # Render mobile or desktop depending on User-Agent for these actions.
  # before_filter :check_for_mobile

  @routelist = {}

  def index
    @routelists = Route.all
    @stoplist = Stop.where(route_id: params[:route_id])
  end

  private

  def route_params
    params.require(:route).permit(:route_id, :display_name, :created_at, :updated_at, :route_location)
  end
end
