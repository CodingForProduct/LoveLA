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

@business = get_business('eureka-tasting-kitchen-hawthorne')

#pp @business # Pretty prints the entire YELP API response

def get_business_hours(business)
  business

end


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
# @business['url']
# @business['name']
# @business['hours'][0]['open'][0]['day']
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
#X = @business['hours'][0]['open'][0]['day']#



##  def format_time(time)
##    t = (time > 1200) ? ((time - 1200).to_s + "pm") : (time.to_s + "am")
##    #t = (time <= 1200) ? (time.to_s + "am") : (time - 1200).to_s + "pm"
##    t.insert(-2,":")
##  end#

  def format_time(time)
    if (time === 0000)
      "Midnight"
    elsif (time === 1200)
      "Noon"
    elsif (time < 1200)
      (time.to_s + "am").insert(-5,":")
    else
      ((time - 1200).to_s + "pm").insert(-5,":")
    end
  end#

def days_closed(business)
  day_info = business['hours'][0]['open']
  day_value = business['hours'][0]['open'][0].values[3]
  days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
  count = 0
  if (day_info.size < 7)
    day_info.each do |day|
      day_value = day.values[3]
      if day_value == days[count]
        "Open #{day}"
      else
        "Closed #{day}"
      end
      count += 1
    end
  end
end

def get_business_hours(business)
  day_info = business['hours'][0]['open']
  days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
  count = 0
  hours = []#
  while count <= 6
    start_time = day_info[count]['start'].to_i
    end_time = day_info[count]['end'].to_i
    day = days[count]
    hours << "#{day} #{format_time(start_time)} - #{format_time(end_time)}"
    count += 1
    hours
  end
  hours
end

def categories
  titles = []
  @business['categories'].each do |category|
    titles << category['title']
  end
  titles.join(', ')
end

pp days_closed(@business)
