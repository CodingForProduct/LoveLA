class CreateStops < ActiveRecord::Migration[5.0]
  def change
    create_table :stops do |t|
      t.string :route_id
      t.string :display_name
      t.string :latitude
      t.string :longitude
      t.datetime :created_at
      t.datetime :update_at
    end
  end
end
