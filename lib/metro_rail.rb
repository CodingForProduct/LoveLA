require 'net/http'
require 'JSON'
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

	def get_routes_gtfs
		uri = URI('https://gitlab.com/LACMTA/gtfs_rail/blob/master/routes.txt')
		res = Net::HTTP.get_response(uri)
		@route_list = res
	end
end


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
# 	'#{k['display_name']}',
# 	#{k['latitude']},
# 	#{k['longitude']}"
#   "#{k['display_name']}"
# end

# dm = DatabaseMgr.new
# rs = dm.execute("SELECT route_id, display_name, created_at from stops where route_id = '804'")
# rs.each do |row|
#   puts "%s %s %s" % [ row['route_id'], row['display_name'], row['created_at'] ]
# end
#

