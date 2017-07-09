require_relative 'metro_rail'
require 'net/http'
require 'uri'
require 'byebug'
require 'pry'
require 'json'

@metro = MetroRail.new

@token = @metro.get_token
@term = 'dinner'
@location = 'Los Angeles'

uri = URI("https://api.yelp.com/v3/businesses/search?term=#{@term}&location=#{@location}&limit=5")

response = ""
request = Net::HTTP::Get.new uri
request['Authorization'] = "Bearer #{@token}"

response = Net::HTTP.start(uri.host, uri.port,
                :use_ssl => uri.scheme == 'https') do |http|
  http.request request # Net::HTTPResponse object
end
# binding.pry

# response.body['businesses'].each do |res|
#   puts "#{res['id']} - #{res['name']}"
# end
puts JSON.parse(response.body)