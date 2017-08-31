class Idea < ApplicationRecord
  belongs_to :user, class_name: "User"
  mount_uploader :photo, PhotoUploader
end
