class IdeaAttachment < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :idea
end
