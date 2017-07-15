require_relative '../../lib/yelp_helper'

class PlacesController < ApplicationController
  include YelpHelper

  def index
    #binding.pry

    @term = 'dinner'
    @longitude = params[:longitude]
    @latitude = params[:latitude]
    @place = search(@term,@longitude,@latitude)

  end

  def show
  #binding.pry
    @business_id = params[:id]
    @business = get_business(@business_id)
    redirect_to @business['url']
  end
end
