class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      t.integer :friend_id
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
