class CreateSpotImages < ActiveRecord::Migration[6.0]
  def change
    create_table :spot_images do |t|

      t.integer "spot_id"
      t.string "image_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["spot_id"], name: "index_spot_images_on_spot_id"
    end
  end
end
