require 'test_helper'

class StopsTest  < ActionDispatch::IntegrationTest
  def setup
    @stop = create(:stop)
    @route = create(:route)

    @stop.update(route_id: @route.route_id)
    @route_id = @stop.route_id

      # @stop = 1
      @longitude = -118.18938
      @latitude = 33.7818299
  end


  test 'should get stops index' do
    get stops_path, params: { route_id: @route_id }
    assert_select "h1", "Test Route"
  end

  test 'should get stops select' do
    get stops_select_path, params: { stop: @stop.id, longitude: @longitude, latitude: @latitude}
    assert_select "h1", "test stop"
  end
end