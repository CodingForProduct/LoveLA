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
    @business_id = params[:id]
    @business = get_business(@business_id)
    @business_name = @business['name']
    @business_url = @business['image_url']
    @business_hours = get_business_hours(@business)


    #binding.pry
    @business_display_phone = @business['display_phone']
    @business_rating = @business['rating']
    @business_snippet_text = @business['snippet_text']
    @business_snippet_image_url = @business['snippet_image_url']
    @business_deals = @business['deals']
    @business_location = @business['location.display_address']
  end

#  def show
#  #binding.pry
#    @business_id = params[:id]
#    @business = get_business(@business_id)
#    redirect_to @business['url']
#  end
end
