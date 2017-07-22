require 'minitest/autorun'
require_relative '../test_helper'

class RouteTest < ActiveSupport::TestCase

  def setup
    @route = Route.first
  end

  test "the truth" do
    #puts @route['display_name']
    assert_not @route['display_name'].nil?
  end
end

# require 'test_helper'
# class ChefTest < ActiveSupport::TestCase
#   def setup
#     @chef = Chef.new(chefname: 'Jen', email: 'jen@email.com',
#                      password:'secretpswd',
#                      password_confirmation: 'secretpswd')
#   end
#
#   test 'should be valid' do
#     assert @chef.valid?
#   end
#
#   test 'chefname should be valid' do
#     @chef.chefname = ' '
#     assert_not @chef.valid?
#   end
# end