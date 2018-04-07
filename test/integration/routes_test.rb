require 'minitest/autorun'
require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest

  test "should get root" do
    get root_url
    assert_response :success
  end

end
