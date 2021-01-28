class Note < ApplicationRecord
  has_rich_text :content

  belongs_to :user

  has_many :archives, dependent: :destroy
  has_many :archived_users, through: :archives, source: :user
  has_many :questions, dependent: :destroy


end
