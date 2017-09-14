class AddImageUrlToIdea < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :image_url, :string
  end
end
