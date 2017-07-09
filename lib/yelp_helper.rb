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
    if( response.is_a?( Net::HTTPSuccess ) )
      @return_msg = JSON.parse(response.body)
      @return_msg['access_token']
    else
      @return_msg = 'request failed'
    end
  end
end
