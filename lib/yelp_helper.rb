require 'net/http'
require 'json'
require 'erb'

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
    @limit = 20
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
    @result["businesses"].each do |business|
      @businesses << [business['id'], business['name']]
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

    response = Net::HTTP.start(uri.host, uri.port,
                               :use_ssl => uri.scheme == 'https') do |http|
      http.request request
    end
    @result = JSON.parse(response.body)
    @business_url = @result.select{|key, hash| key["url"]}
  end
end
