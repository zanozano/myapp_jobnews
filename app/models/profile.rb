class Profile < ApplicationRecord
  mount_uploader :profile_photo, ProfilePhotoUploader
  belongs_to :user
end
