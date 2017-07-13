require_relative 'yelp_helper'


include YelpHelper
@term = 'dinner'
@longitude = -118.19609
@latitude = 33.8198599
@place = search(@term,@longitude,@latitude)
@place.each do |row|
  puts "row data: #{row['name']}"
end
