require 'net/http'
require 'json'
require 'erb'

module YelpHelper

  include ERB::Util

  def get_token
    ENV['YELP_LOVELA_ACCESS_TOKEN']
  end

  def search(term, longitude, latitude)
    @token = get_token
    @term = term || 'dinner'
    @longitude = longitude
    @latitude = latitude
    @limit = 10
    @result = {}
    @businesses = []

    uri = URI("https://api.yelp.com/v3/businesses/search?term=#{@term}&longitude=#{@longitude}&latitude=#{@latitude}&limit=#{@limit}")

    request = Net::HTTP::Get.new uri
    request['Authorization'] = "Bearer #{@token}"

    response = Net::HTTP.start(uri.host, uri.port,
                               :use_ssl => uri.scheme == 'https') do |http|
      http.request request
    end

    @result = JSON.parse(response.body)
    if !@result["businesses"].nil?
      @result["businesses"].each do |business|
        @businesses << [business['id'], business['name']]
      end
    else
      @result
    end

  end

  def get_business(id)
    @token = get_token
    encoded_id = url_encode(id)
    uri = URI("https://api.yelp.com/v3/businesses/#{encoded_id}")
    @result = {}
    @business_url = ""

    request = Net::HTTP::Get.new uri
    request['Authorization'] = "Bearer #{@token}"

    response = Net::HTTP.start(
      uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request request
      end

    if response.is_a?(Net::HTTPSuccess)
      @result = JSON.parse(response.body)
    else
      @result = {}
    end

    return @result
  end


  def format_time(time)
    if time.to_i === 0000
      "Midnight"
    elsif time.to_i === 1200
      "Noon"
    elsif time.to_i < 1200
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

  def show_rating(rating)
    display_rating = ''
    base_file = 'small_'
    half = '_half'
    file_ext = '.png'
    rating_str = rating.to_s
    (rating_str.include? '.5') ?
          display_rating = "#{base_file}#{rating_str.tr('.5','')}#{half}#{file_ext}":
        display_rating = "#{base_file}#{rating_str.tr('.0','')}#{file_ext}" if rating_str.length > 0
    display_rating
  end
end
