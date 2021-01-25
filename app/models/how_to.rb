class HowTo < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
end
