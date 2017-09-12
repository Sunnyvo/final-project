class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :idea
  has_many :likes, as: :item
end
