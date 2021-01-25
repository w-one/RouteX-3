class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :nickname, :string
    add_column :users, :profile_image, :string
    add_column :users, :profile, :text
  end
end
