Yelp.client.configure do |config|
  config.consumer_key = ENV["YELP_LOVELA_CLIENT_ID"]
  config.consumer_secret = ENV["YELP_LOVELA_CLIENT_SECRET"]
  config.token = ENV["YELP_LOVELA_ACCESS_TOKEN"]
  #config.token_secret = YOUR_TOKEN_SECRET
end