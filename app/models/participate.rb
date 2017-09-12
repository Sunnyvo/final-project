class Participate < ApplicationRecord
  belongs_to :joined_idea, class_name: 'Idea', foreign_key: "idea_id"
  # belongs_to :joined_idea, class_name: 'Idea', foreign_key: 'idea_id'
  belongs_to :joiner, class_name: 'User', foreign_key: "user_id"
end
