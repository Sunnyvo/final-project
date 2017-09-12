class CreateReaches < ActiveRecord::Migration[5.1]
  def change
    create_table :reaches do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :idea, foreign_key: true

      t.timestamps
    end
  end
end
