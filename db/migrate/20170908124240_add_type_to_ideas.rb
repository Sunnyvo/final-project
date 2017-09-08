class AddTypeToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_reference :ideas, :type, foreign_key: true
  end
end
