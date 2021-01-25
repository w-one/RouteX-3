class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.integer :user_id
      t.text :text
      t.string :image
      t.string :map

      t.timestamps
    end
  end
end
