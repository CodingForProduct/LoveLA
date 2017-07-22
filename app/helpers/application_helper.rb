module ApplicationHelper

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

  def get_business_location
    @business['location']['display_address'].join(", ")
  end

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
        photos <<  p
        count += 1
      end
      photos
    end
  end

end
