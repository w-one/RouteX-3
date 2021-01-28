class CreateMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :maps do |t|
      t.integer :spot_id
      t.float :latitude
      t.float :longitude
      t.string :address

      t.timestamps
    end
  end
end
