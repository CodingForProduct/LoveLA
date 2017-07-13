require_relative 'yelp_helper'
require 'net/http'
require 'uri'
require 'byebug'
require 'pry'
require 'json'

include YelpHelper

@metro = MetroRail.new

@token = get_token
@term = 'dinner'
@location = 'Los Angeles'

uri = URI("https://api.yelp.com/v3/businesses/search?term=#{@term}&location=#{@location}&limit=10")

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
result = JSON.parse(response.body)

result.each do |k,v|
  if v.class == Array
    bus = v
  end
  bus.each do |b|
    puts "business id - #{b["id"]}, business name - #{b["name"]}"
  end if !bus.nil?
end
