class Participate < ApplicationRecord
  belongs_to :joined_idea, class_name: 'Idea', foreign_key: "idea_id"
  # belongs_to :joined_idea, class_name: 'Idea', foreign_key: 'idea_id'
  belongs_to :joiner, class_name: 'User', foreign_key: "user_id"
  validates :skills,:details, presence: true
  validates_uniqueness_of :user_id, :scope => :idea_id
end
