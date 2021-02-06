class Spot < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  
  mount_uploader :image, ImageUploader

  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :comments, dependent: :destroy

  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations, dependent: :destroy




end
