require 'net/http'
require 'JSON'

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

	def get_stops_list(route_tag)
		uri = URI("http://api.metro.net/agencies/lametro-rail/routes/#{route_tag}/stops/")
		res = Net::HTTP.get_response(uri)
		@stops_list = JSON.parse(res.body)
	end
end

# rail = MetroRail.new
# list = rail.get_route_list
# #puts list.length
# list['items'].each do |k,v|
# 	puts "#{k['display_name']}"
# end
