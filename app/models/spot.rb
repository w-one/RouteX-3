class Spot < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  
  mount_uploader :image, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader

  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :comments, dependent: :destroy

  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations, dependent: :destroy


  validates :title, presence: true




end
