require_relative 'yelp_helper'
# require 'pp'

include YelpHelper
@term = 'food'
@longitude = -118.19609
@latitude = 33.8198599

@place = search(@term,@longitude,@latitude)

# @place.each do |row|
#   puts "name: #{row['name']}, id: #{row['id']} "
# end

# @place = search(@term,@longitude,@latitude)
# @place.each do |row|
#   puts "row data: #{row['id']} - #{row['name']}"
# end

# @business = get_business('kitchen-mouse-los-angeles')
#  @business2 = get_business('the-hungry-pig-los-angeles')
 @business3 = get_business('sharksteeth-los-angeles')

#pp @business # Pretty prints the entire YELP API response

def get_business_address(business)
  business['location'][0].each do |location|
    location.values
  end
end

#pp @business # Pretty prints the entire YELP API response
#pp @business['photos'][0]
#pp get_business_address(@business)
#pp get_business_hours(@business)
#pp get_business_hours(@business)
#p get_token

# These are the fields we may want to call
# @business['url'] photo
# @business['name']
# @business['hours'][0]['open'][0]['day']
# @business['display_phone']
# @business['rating']
# @business['deals']
# @business['location.display_address'] # Address for this business formatted for display. 
# @business['location.cross_streets'] # Cross streets for this business
# @business['location.neighborhoods']
# @business['categories'] # List of category names like: "Breakfast & Brunch", "Bars"
#X = @business['hours'][0]['open'][0]['day']#

##  def format_time(time)
##    t = (time > 1200) ? ((time - 1200).to_s + "pm") : (time.to_s + "am")
##    #t = (time <= 1200) ? (time.to_s + "am") : (time - 1200).to_s + "pm"
##    t.insert(-2,":")
##  end#

  def categories
    titles = []
    @business['categories'].each do |category|
      titles << category['title']
    end
    titles.join(', ')
  end

  def format_photos(business)
    photos = []
    count = 0
    photo = business['photos']
    if photo.size != 0
      photo.each do |p|
        @photo = @business['photos'][count]
        photos << "<%= image_tag(@photo#{count+1}, class: 'restaurant_photo') %><br/>"
        count += 1
      end
      photos
    end
  end

  def format_time(time)
    if (time.to_i === 0000)
      "Midnight"
    elsif (time.to_i === 1200)
      "Noon"
    elsif (time.to_i < 1200)
      (time.to_s + "am").insert(-5,":")
    else
      ((time.to_i - 1200).to_s + "pm").insert(-5,":")
    end
  end

  def get_business_hours(business)
    if business['hours'] == nil
      return
    else
      day_info = business['hours'][0]['open']
      day_names = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]    

      hours = Array.new(7)    

      hours.each_with_index do |d,i|
        hours[i] = "#{day_names[i]} Closed"
      end    

      day_info.each do |d|
        start_time = d['start']
        end_time = d['end']
        hours[d['day']] = "#{day_names[d['day']]} #{format_time(start_time)}-#{format_time(end_time)}"
      end
      hours
    end
  end

bus_rating = @business3['rating']

display_rating = show_rating(bus_rating)
puts display_rating