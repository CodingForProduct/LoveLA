require 'test_helper'

class PlacesTest < ActionDispatch::IntegrationTest

  def setup
    @id = 'burgerlords-los-angeles'
    @stop = Stop.find_by_id(24)
  end

  test 'should get places index' do

    #post stops_select_path, params: { stop: @stop, term: "food", longitude: -118.23425, latitude: 34.0561999 }
    #assert_select "h1", "Top Ten Results"
  end

  test 'should get places show' do

    #post places_show_path, params = {id: @id}
    #assert_select "h2", "Hours"
  end
end
