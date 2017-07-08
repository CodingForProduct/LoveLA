class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.string :route_id
      t.string :display_name
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
