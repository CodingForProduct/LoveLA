require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest

  def setup
    @routelists = Route.all

#    @chef = Chef.create!(chefname: 'jen', email: 'jen@email.com',
#                         password:'secretpswd', password_confirmation: 'secretpswd')
#    @recipe = Recipe.create(name: 'Meat Pile', description: 'Hamburger and spices', chef: @chef)
#    @recipe2 = @chef.recipes.build(name: 'Eggs in a Cloud', 
#      description: 'Separate eggs, putting whites in 1 large bowl and yolks in 4 separate small bowls. 
#      Whip whites until stiff peaks form. Fold in cheese, chives and bacon. Spoon into 4 mounds on 
#      parchment-lined baking sheet; make a deep well in center of each.')
#    @recipe2.save
  end

  test "should get root" do
    get root_url
    assert_response :success
    assert_template 'routes/index'
    assert_match @routelists.first, response.body
    assert_match @routes.id, response.body
    assert_match @chef.chefname, response.body
    assert_select 'a[href=?]', stops_path(route_id: route.route_id), text: 'Blue Line'
    assert_select 'a[href=?]', routes_path(@routes), text: 'Delete'
    assert_select 'a[href=?]', chef_path(@routes.chef), text: 'View your profile'
  end

end
