class Reach < ApplicationRecord
  belongs_to :user
  belongs_to :idea
  validates_uniqueness_of :user_id, :scope => :idea_id
end
