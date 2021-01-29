class AddLocationToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :location, :integer
  end
end
