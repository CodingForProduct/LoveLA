require 'test_helper'

class StopsTest  < ActionDispatch::IntegrationTest
  def setup
    @route_id = "804"
    @stop = 1
    @longitude = -118.18938
    @latitude = 33.7818299
  end

  test 'should get stops index' do
    get stops_path, params: { route_id: @route_id }
    assert_select "h1", "Gold Line"
  end

  test 'should get stops select' do
    get stops_select_path, params: { stop: @stop, longitude: @longitude, latitude: @latitude}
    assert_select "h1", "Anaheim Street Station"
  end
end