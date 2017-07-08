require_relative '../../lib/metro_rail'
require_relative '../../lib/database_mgr'

class StopListController < ActionController::Base
  @stoplist = {}
  def show
    if params[:route_id]
      @metro = MetroRail.new
      @stoplist = @metro.get_stop_list(params[:route_id])
    end

  end
end