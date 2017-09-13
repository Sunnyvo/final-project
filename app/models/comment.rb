class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :idea
  has_many :likes, as: :item
  validates :body, presence: true
end
