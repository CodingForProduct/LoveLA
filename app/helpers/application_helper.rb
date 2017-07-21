module ApplicationHelper

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
  end

  def get_business_hours(business)
    day_info = business['hours'][0]['open']
    days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    count = 0
    hours = []

    while count <= 6
      start_time = day_info[count]['start'].to_i
      end_time = day_info[count]['end'].to_i
      day = days[count]
      hours << "#{day}: #{format_time(start_time)} - #{format_time(end_time)}"
      count += 1
      hours
    end
    hours
  end

  def is_open_now?
    @business['hours'][0]['is_open_now']
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
