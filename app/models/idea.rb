class Idea < ApplicationRecord
  belongs_to :user, class_name: "User"
  mount_uploader :photo, PhotoUploader

  def idea_updated_at
    updated_at|| Time.new()
  end
end
