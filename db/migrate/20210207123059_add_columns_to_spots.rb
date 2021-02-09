class AddColumnsToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :image2, :string
    add_column :spots, :image3, :string
  end
end
