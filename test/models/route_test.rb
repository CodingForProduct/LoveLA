require 'minitest/autorun'
require 'test_helper'

class RouteTest < ActiveSupport::TestCase

  def setup
    @route = create(:route)
  end

  test "should get route" do
    assert_not @route['display_name'].nil?
  end
end
