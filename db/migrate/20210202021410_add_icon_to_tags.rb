class AddIconToTags < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :icon, :string
  end
end
