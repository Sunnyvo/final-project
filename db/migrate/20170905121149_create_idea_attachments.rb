class CreateIdeaAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :idea_attachments do |t|
      t.belongs_to :idea, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
