require 'test_helper'

class PlacesTest < ActionDispatch::IntegrationTest

  def setup
    @id = 'burgerlords-los-angeles'
    @stop = Stop.find_by_id(24)
    #@place = [{"id"=>"the-pan-long-beach-2", "name"=>"The Pan", "image_url"=>"https://s3-media2.fl.yelpcdn.com/bphoto/8HE1t3r5Zs76E4gHmLi_1A/o.jpg", "is_closed"=>false, "url"=>"https://www.yelp.com/biz/the-pan-long-beach-2?adjust_creative=8NTn8KdUycb931RysGu9xg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=8NTn8KdUycb931RysGu9xg", "review_count"=>498, "categories"=>[{"alias"=>"pizza", "title"=>"Pizza"}, {"alias"=>"newamerican", "title"=>"American (New)"}, {"alias"=>"breakfast_brunch", "title"=>"Breakfast & Brunch"}], "rating"=>4.0, "coordinates"=>{"latitude"=>33.821262917874, "longitude"=>-118.189030364156}, "transactions"=>["pickup"], "price"=>"$$", "location"=>{"address1"=>"3550 Long Beach Blvd", "address2"=>"", "address3"=>"", "city"=>"Long Beach", "zip_code"=>"90807", "country"=>"US", "state"=>"CA", "display_address"=>["3550 Long Beach Blvd", "Long Beach, CA 90807"]}, "phone"=>"+15624900700", "display_phone"=>"(562) 490-0700", "distance"=>670.3628199812}]
  end

  test 'should get places index' do
    # get places_path, params: { stop: @stop.id, term: "food", longitude: -118.23425, latitude: 34.0561999 } #params: {place: @place}
    # assert_select "h1", "Top Ten Results"

  end

  test 'should get places show' do
    get places_show_path(id: @id)
    assert_select "h2", "Hours"
  end
end
