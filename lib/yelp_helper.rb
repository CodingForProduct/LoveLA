require 'net/http'
require 'json'

module YelpHelper
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

end

