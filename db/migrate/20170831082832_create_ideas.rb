class CreateIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :body
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end