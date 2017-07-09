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
  #
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
end