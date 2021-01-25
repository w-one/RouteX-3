class CreateHowTos < ActiveRecord::Migration[6.0]
  def change
    create_table :how_tos do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.string :video
      t.string :image

      t.timestamps
    end
  end
end
