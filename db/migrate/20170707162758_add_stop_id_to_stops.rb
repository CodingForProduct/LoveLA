class AddStopIdToStops < ActiveRecord::Migration[5.0]
  def change
    add_column :stops, :stop_id, :string
  end
end
