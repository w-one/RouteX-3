class CreateHashtagNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :hashtag_notes do |t|
      t.references :note, null: false, foreign_key: true
      t.references :hashtag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
