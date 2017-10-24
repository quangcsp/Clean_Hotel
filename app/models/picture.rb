class Picture < ApplicationRecord
  mount_uploader :photo, AvatarUploader
end
