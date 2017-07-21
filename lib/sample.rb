require_relative 'yelp_helper'


include YelpHelper
@term = 'food'
@longitude = -118.19609
@latitude = 33.8198599

@place = search(@term,@longitude,@latitude)

@place.each do |row|
  puts "name: #{row['name']}, id: #{row['id']} "
end




# @place = search(@term,@longitude,@latitude)
# @place.each do |row|
#   puts "row data: #{row['id']} - #{row['name']}"
# end

# @business = get_business('humblebrags-eatery-lakewood')
# puts @business['url']