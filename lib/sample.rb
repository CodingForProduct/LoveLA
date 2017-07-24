require_relative 'yelp_helper'
require 'pp'

include YelpHelper
@term = 'food'
@longitude = -118.19609
@latitude = 33.8198599

# @place = search(@term,@longitude,@latitude)

# @business = get_business('eggslut-los-angeles-5')
#pp @business # Pretty prints the entire YELP API response

@place = search(@term, @longitude, @latitude)

puts "place: #{@place}"
#puts @business
#bus_rating = @business3['rating']
#
# display_rating = show_rating(bus_rating)
# puts display_rating