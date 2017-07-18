require_relative 'yelp_helper'
require 'pp'

include YelpHelper
@term = 'dinner'
# @longitude = -118.19609
# @latitude = 33.8198599
# @place = search(@term,@longitude,@latitude)
# @place.each do |row|
#   puts "row data: #{row['id']} - #{row['name']}"
# end

@business = get_business('humblebrags-eatery-lakewood')

pp @business # Pretty prints the entire YELP API response

# These are the fields we may want to call
# @business['url']
# @business['name']
# @business['hours']
# @business['display_phone']
# @business['rating']
# @business['snippet_text']
# @business['snippet_image_url']
# @business['deals']
# @business['location.display_address'] # Address for this business formatted for display. 
# ludes all address fields, cross streets and city, state_code, etc.
# @business['location'] # Location data for this business
# @business['location.cross_streets'] # Cross streets for this business
# @business['location.neighborhoods']
# @business['categories'] # List of category names like: "Breakfast & Brunch", "Bars"
