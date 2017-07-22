class StopsController < ApplicationController
  @stoplist = {}
  @params = {}
  def index
    if params[:route_id]
      @stoplist = Stop.where(route_id: params[:route_id])
    end
  end

  def select
    @stop = Stop.find_by_id(params[:stop]) #= params[:stop]
    @longitude = params[:longitude] #Stop.select(:longitude).where(display_name: @stop)
    @latitude = params[:latitude] #Stop.select(:latitude).where(display_name: @stop)
    @select_list = ['food','bars','theatres','libraries','grocers','parks','entertainment','museums','malls' ]
  end

  private
  def stop_params
    params.require(:stop).permit(:term, :longitude, :latitude)
  end
end
