
class StopListController < ApplicationController
  @stoplist = {}
  def show
    if params[:route_id]
      @stoplist = Stop.where(route_id: params[:route_id])
    end
  end

  # def search
  #   parameters = { term: params[:term], limit: 16 }
  #   render json: Yelp.client.search('San Francisco', parameters)
  # end

  def search #(term, location)
    search_limit = 5
    default_term = 'dinner'

    if params[:terms].nil?
      params[:terms] = default_term
    end

    @metro = MetroRail.new
    bearer_token = @metro.get_token
    url = "#{API_HOST}#{SEARCH_PATH}"

    search_params = {
        term: params[:term],
        location: params[:location],
        limit: search_limit
    }

    response = HTTP.auth(bearer_token).get(url, params: search_params)
    response.parse
  end

  private

  def search_params
    params.require(:route).permit(:route_id, :display_name, :created_at, :updated_at, :route_location)
  end

end