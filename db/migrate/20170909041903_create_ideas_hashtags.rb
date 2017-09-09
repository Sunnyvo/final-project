class CreateIdeasHashtags < ActiveRecord::Migration[5.1]
  def change
    create_table :hashtags_ideas, id: false do |t|
      t.references :idea, foreign_key: true
      t.references :hashtag, foreign_key: true
    end
  end
end
