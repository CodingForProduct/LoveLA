require_relative '../../lib/yelp_helper'

class PlacesController < ApplicationController
  include YelpHelper
  include ApplicationHelper

  def index
    @term = 'dinner'
    @longitude = params[:longitude]
    @latitude = params[:latitude]
    @place = search(@term,@longitude,@latitude)

  end

  def show
    @id = params[:id]
    @business = get_business(@id)
    #binding.pry
    @name = @business['name']
    @website = @business['url']
    @hours = get_business_hours(@business)
    @price = @business['price']
    @display_phone = @business['display_phone']
    @rating = @business['rating']
    @business_snippet_text = @business['snippet_text']
    @photo = @business['photos'][0]
    @deals = @business['deals']
    @location = get_business_location
    @coordinates = @business['coordinates']
    @is_open_now = is_open_now?
    @categories = categories
  end

end
