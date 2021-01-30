class CreateHomes < ActiveRecord::Migration[6.0]
  def change
    create_table :homes do |t|
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
