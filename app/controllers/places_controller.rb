require_relative '../../lib/yelp_helper'
require 'net/http'
require 'uri'

class PlacesController  < ApplicationController
  def index
    include YelpHelper

    @longitude = params[:longitude]
    @latitude = params[:latitude]
    @places = search(@term,@longitude,@latitude)

   end

end