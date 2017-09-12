class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.integer :item_id
      t.string :item_type

      t.timestamps
    end
  end
end
