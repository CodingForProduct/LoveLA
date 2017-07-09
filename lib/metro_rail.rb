require 'net/http'
require_relative('database_mgr')

class MetroRail
  attr_accessor :route_list, :route, :stops_list, :stop

  def initialize
    @route_list = {}
    @route = ""
    @stops_list = {}
    @stop = ""
  end

  def get_route_list
    uri = URI('http://api.metro.net/agencies/lametro-rail/routes/')
    res = Net::HTTP.get_response(uri)
    @route_list = JSON.parse(res.body)
	end

	def get_stop_list(route_tag)
		uri = URI("http://api.metro.net/agencies/lametro-rail/routes/#{route_tag}/stops/")
		res = Net::HTTP.get_response(uri)
		#HTTPOK
		@stops_list = JSON.parse(res.body)
	end

  def get_token
    @return_msg = ""
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

#mr = MetroRail.new
#mr.get_token
#{"access_token": "IUnagA-FYKnXsPNZ0nv5k2QonwcAJsxEJOq_LqXfwG7fGB8jP9lZOIAgkSiG_jYN7iWbI-fNlwTmwrco_QAu16z_cqwcSpPWeYP6roeLca-imog8arS373eq0k5hWXYx", "expires_in": 15528241, "token_type": "Bearer"}


# route_num = '806'
# rail = MetroRail.new
# list = rail.get_route_list
# #puts list.length
# list['items'].each do |k,v|
# 	puts "#{k['display_name']}"
# end

# endstops = rail.get_stop_list(route_num)
# stops['items'].each do |k,v|
#   puts "#{route_num},
#     #{k['id']},
#   '#{k['display_name']}',
#   #{k['latitude']},
#   #{k['longitude']}"
#   "#{k['display_name']}"
# end

# dm = DatabaseMgr.new
# rs = dm.execute("SELECT route_id, display_name, created_at from stops where route_id = '804'")
# rs.each do |row|
#   puts "%s %s %s" % [ row['route_id'], row['display_name'], row['created_at'] ]
# end
#
