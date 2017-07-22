require 'minitest/autorun'
require_relative '../test_helper'

class StopTest < ActiveSupport::TestCase

  def setup
    @stop = Stop.first
  end

  test "the truth" do
    #puts @stop['display_name']
    assert_not @stop['display_name'].nil?
  end

end