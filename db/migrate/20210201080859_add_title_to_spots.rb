class AddTitleToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :title, :string
  end
end
