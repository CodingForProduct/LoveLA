#require_relative '../../lib/yelp_helper'

class PlacesController < ApplicationController
  #include YelpHelper

  def index
    @term = params[:term] || 'dinner'
    @longitude = params[:stop][:longitude]
    @latitude = params[:stop][:latitude]
    @place = search(@term,@longitude,@latitude)

  end

  def show
    @business_id = params[:id]
    @business = get_business(@business_id)
    redirect_to @business['url']
  end

  private
  def place_params
    params.require(:place).permit(:term, :longitude, :latitude)
  end
end
