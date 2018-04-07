require 'minitest/autorun'
require 'test_helper'


class StopTest < ActiveSupport::TestCase

  def setup
    @stop = create(:stop)
  end

  test "should get stop" do
    assert_not @stop['display_name'].nil?
  end

end