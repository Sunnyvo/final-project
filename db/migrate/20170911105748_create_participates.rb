class CreateParticipates < ActiveRecord::Migration[5.1]
  def change
    create_table :participates do |t|
      t.belongs_to :idea, foreign_key: true
      t.integer :user_id
      t.string :skills
      t.string :details

      t.timestamps
    end
  end
end
