class Idea < ApplicationRecord
  belongs_to :user, class_name: "User"
  has_many :idea_attachments
  accepts_nested_attributes_for :idea_attachments

  def idea_updated_at
    updated_at|| Time.new()
  end
end
