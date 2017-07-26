require 'test_helper'

class PlacesTest < ActionDispatch::IntegrationTest

  def setup
    @id = 'burgerlords-los-angeles'
    @stop = Stop.find_by_id(24)
    @stop = { id: 24, longitude: -118.23425, latitude: 34.0561999 }
  end

  test 'should get places index' do
     get places_path, params: {stop: @stop} #params: {place: @place}
     assert_select "h1", "Top Ten Results"

  end

  test 'should get places show' do
    get places_show_path(id: @id)
    assert_select "h2", "Hours"
  end
end
