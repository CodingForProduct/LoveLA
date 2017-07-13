require_relative '../../lib/yelp_helper'
require 'net/http'
require 'uri'

class PlacesController < ApplicationController
  def index
    include YelpHelper
    @term = 'dinner'
    @longitude = params[:longitude]
    @latitude = params[:latitude]
    @place = search(@term,@longitude,@latitude)

   end

end