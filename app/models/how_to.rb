class HowTo < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

  belongs_to :user

  has_many :fights, dependent: :destroy
  has_many :fought_users, through: :fights, source: :user
  
  has_many :advices, dependent: :destroy
end
