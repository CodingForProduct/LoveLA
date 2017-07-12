
class StopListController < ApplicationController
  @stoplist = {}
  def index
    if params[:route_id]
      @stoplist = Stop.where(route_id: params[:route_id])
    end
  end

end