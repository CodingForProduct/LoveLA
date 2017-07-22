require 'net/http'
require 'json'
require 'erb'
require 'pry'

module YelpHelper

  include ERB::Util

  def get_token
    params =  {
        :client_id => ENV['YELP_LOVELA_CLIENT_ID'],
        :client_secret => ENV['YELP_LOVELA_CLIENT_SECRET'],
        :grant_type=> 'client_credentials'
    }

    uri = URI('https://api.yelp.com/oauth2/token')
    uri.query = URI.encode_www_form([["q", "ruby"], ["lang", "en"]])

    response = Net::HTTP.post_form( uri, params )
    if( response.is_a?( Net::HTTPSuccess ))
      @return_msg = JSON.parse(response.body)
      @return_msg['access_token']
    else
      @return_msg = 'request failed'
    end
  end

  def search(term, longitude, latitude)
    @token = get_token
    @term = term || 'dinner'
    @longitude = longitude
    @latitude = latitude
    @limit = 10
    @result = {}
    @businesses = []

    if !(ENV.key? 'YELP_LOVELA_CLIENT_ID' and
         ENV.key? 'YELP_LOVELA_CLIENT_SECRET' and
         ENV.key? 'YELP_LOVELA_ACCESS_TOKEN')
      raise "YELP ENV unset"
    end

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

    @result = JSON.parse(response.body)
    #@business_url = @result.select{|key, hash| key["url"]}

    return @result
  end


  def get_business_hours(business)
    @business_hours = []

    business['hours'].each do |hour|
      @business_hours << hour
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
