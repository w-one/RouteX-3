class AddHashbodyToNote < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :hashbody, :text
  end
end
