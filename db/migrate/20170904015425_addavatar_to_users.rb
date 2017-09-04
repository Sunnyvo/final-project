class AddavatarToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :avatar, :string
    add_column :users, :image_url, :string
    add_column :users, :work, :string
    add_column :users, :phone, :string
    add_column :users, :country, :string
    add_column :users, :area, :string
    add_column :users, :role, :integer
  end
end
