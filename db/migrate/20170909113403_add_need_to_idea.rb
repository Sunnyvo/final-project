class AddNeedToIdea < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :need, :string
  end
end
