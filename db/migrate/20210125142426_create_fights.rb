class CreateFights < ActiveRecord::Migration[6.0]
  def change
    create_table :fights do |t|
      t.references :how_to, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
