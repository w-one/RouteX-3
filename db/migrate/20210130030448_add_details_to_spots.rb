class AddDetailsToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :lat, :float
    add_column :spots, :lng, :float
  end
end
