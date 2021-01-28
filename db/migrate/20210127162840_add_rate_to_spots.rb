class AddRateToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :rate, :float
  end
end
