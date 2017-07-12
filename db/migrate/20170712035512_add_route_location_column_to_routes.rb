class AddRouteLocationColumnToRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :routes, :route_location, :string
  end
end
